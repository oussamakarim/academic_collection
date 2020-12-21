function updateUI (data) {
    console.log(data)
    $("#proc_name").text(data["procedureNom"])
    $("#etape_name").text(data["etapeNom"])
    $("#etape_etat").text(data["etapeEtat"])
    $("#etape_id").text(data["etapeId"])
    $("input#id").attr('value', data['etapeId'])
    $("#etape_ouverture").text(data["etapeOuverture"])
    $("#etape_fermeture").text(data["etapeFermeture"])
    $('#rapports').empty()
    $("#docs").empty()

    switch (data['etapeEtat']) {
        case 'TERMINE':
            $('#validate').hide()
            $('#refuse').hide()
            $('#reject').hide()
            break;
        case 'REJETE':
            $('#reject').hide()
            break;
        case 'REFUSE':
            $('#refuse').hide()
            break;
        default:
            console.log("Pay me")
    }
    if ( data['rapports'].length > 0 ) {
        for (let id in data['rapports'] ) {
            const rapport = data['rapports'][id]['rapportEntity']
            console.warn(rapport)
            let li = $(document.createElement("li"))
            li.attr('class', 'list-group-item')

            let docDiv = $(document.createElement('div'))
            let docLabel = $("<span class='font-weight-bold pr-2'>Doc:</span>")
            let docLink = $(document.createElement('a'))
            docLink.attr('href', 'http://localhost/rapports/' + rapport['filename'])
            docLink.attr('target', '_blank');
            let decision = $(document.createElement('span'))
            decision.attr('class', 'badge badge-primary mx-2')
            decision.text(rapport['decision'])
            docLink.text(rapport['filename'])
            docLabel.appendTo(docDiv)
            docLink.appendTo(docDiv)
            decision.appendTo(docDiv)
            docDiv.appendTo(li)

            let dateDiv = $(document.createElement('div'))
            let dateLabel = $("<span class='font-weight-bold pr-2'>Depo: </span>")
            let dateSpan = $(document.createElement('span'))
            dateSpan.text(rapport['dateDeposition'])
            dateLabel.appendTo(dateDiv)
            dateSpan.appendTo(dateDiv)
            dateDiv.appendTo(li)

            li.appendTo('#rapports')
        }

        if ( data['documents'].length > 0 ) {
            for (let id in data['documents'] ) {
                const doc = data['documents'][id]['documentEntity']
                console.warn(doc)
                let tr = $(document.createElement('tr'))
                let td = $(document.createElement('td'))
                td.attr('class', 'text-center')
                let link = $(document.createElement('a'))
                link.attr('href', 'http://localhost/docs/' + doc['filename'])
                link.attr('target', '_blank')
                link.text(doc['filename'])
                link.appendTo(td)
                td.appendTo(tr)
                tr.appendTo('#docs')
            }
        }
        $("#etape-content").show()
    }

}

function registerAssignment(idEtape, idEmp) {
    console.log("Fetching ....");
    fetch(`http://localhost:8080/web_war_exploded/api/assignment?etape=${idEtape}&emp=${idEmp}`)
    .then(response => response.json())
    .then(json => {
        updateAssignmentUI(json);
    }).catch(error => {
        console.log("Failed to register assignemnt");
        console.log(error);
    })
}

function updateAssignmentUI(json) {
    if (json.status) {
        $('#assignment #msg').removeClass('text-danger')
        $('#assignment #msg').addClass('text-success')
        $('#assignment #msg').text(json.msg);
    } else {
        $('#assignment #msg').addClass('text-danger');
        $('#assignment #msg').removeClass('text-success');
        $('#assignment #msg').text(json.msg);
    }

}

function updateValidationUI(json) {
    if (json.status) {
        $('#validation-msg').removeClass('text-danger')
        $('#validation-msg').addClass('text-success')
        $('#validation-msg').text(json.msg);
    } else {
        $('#validation-msg').addClass('text-danger');
        $('#validation-msg').removeClass('text-success');
        $('#validation-msg').text(json.msg);
    }
}
profileSection = $("#profile-section")
etapesSection = $("#etapes-section")
proceduresSection = $("#procedures-section")
demandesSection = $("#demandes-section")
profileButton = $("#profile-button")
etapesButton = $("#etapes-button")
proceduresButton = $("#procedures-button")
demandesButton = $("#demandes-button")
etapeContent = $("#etape-content")
etapeHint = $("#hint")

profileSection.show()
etapesSection.hide()
demandesSection.hide()
proceduresSection.hide()
etapeContent.hide()
$("#connection").hide()
$("#error").hide()

profileButton.on('click', function (event) {
    profileSection.show();
    etapesSection.hide();
    demandesSection.hide()
    proceduresSection.hide()
})

etapesButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.show();
    demandesSection.hide()
    proceduresSection.hide()
})
proceduresButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.hide();
    demandesSection.hide()
    proceduresSection.show()
})
demandesButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.hide();
    demandesSection.show()
    proceduresSection.hide()
})



$('#etapes-sidbar nav a').on('click', function (event) {
    const idEtape = $(this).attr('id');
    $("#connection").show();
    $("#error").hide()
    fetch("http://localhost:8080/web_war_exploded/api/etape/" + idEtape)
        .then(response => response.json() )
        .then(data => {
            updateUI(data)
            $('#connection').hide()
        })
        .catch(error => {
            $('#connection').hide()
            $('#error').show()
            $("#etape-content").hide()
        })
})

$('button.accepter').on('click', function (event) {
    const jeton = $(event.target).closest('li').attr('id');
    fetch(`http://localhost:8080/web_war_exploded/api/demande/validation?jeton=${jeton}&decision=accepte`)
        .then(response => response.json())
        .then(data => {
            if ( data.status ) {
                $(event.target).closest('li').fadeOut();
            }
            updateValidationUI(data);
        })
        .catch(err => {
            console.error(err);
        })
})
$('button.refuser').on('click', function (event) {
    const jeton = $(event.target).closest('li').attr('id');
    fetch(`http://localhost:8080/web_war_exploded/api/demande/validation?jeton=${jeton}&decision=refuse`)
        .then(response => response.json())
        .then(data => {
            if ( data.status ) {
                $(event.target).closest('li').fadeOut();
            }
            updateValidationUI(data);
        })
        .catch(err => {
            console.error(err);
        })
})
$('#assignment button.btn').on('click', function (event) {
    console.log("Assigner button is clicked");
    let idEtape = $('#assignment #catalogue').val();
    let idEmp = $('#assignment #employees').val();
    if ( idEmp != 0 && idEtape != 0 )
        registerAssignment(idEtape, idEmp);
    else
        updateAssignmentUI({
            status: false,
            msg: "Choix Invalid"
        });
})