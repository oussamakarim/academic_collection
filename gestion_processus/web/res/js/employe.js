function updateUI(data) {
    console.log(data)
    $("#proc_name").text(data["procedureNom"])
    $("#etape_name").text(data["etapeNom"])
    $("#etape_etat").text(data["etapeEtat"])
    $("#etape_id").text(data["etapeId"])
    $("input#idEtape").attr('value', data['etapeId'])
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
    if (data['rapports'].length > 0) {
        for (let id in data['rapports']) {
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

        if (data['documents'].length > 0) {
            for (let id in data['documents']) {
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

profileSection = $("#profile-section")
etapesSection = $("#etapes-section")
profileButton = $("#profile-button")
etapesButton = $("#etapes-button")
etapeContent = $("#etape-content")
etapeHint = $("#hint")

profileSection.show()
etapesSection.hide()
etapeContent.hide()
$("#connection").hide()
$("#error").hide()

profileButton.on('click', function (event) {
    profileSection.show();
    etapesSection.hide();
})

etapesButton.on('click', function (event) {
    profileSection.hide();
    etapesSection.show();
})

$('#validate').on('click', (event) => {
    $('#decision').attr('value', "TERMINE");
})
$('#refuse').on('click', (event) => {
    $('#decision').attr('value', "REFUSE");
})
$('#reject').on('click', (event) => {
    $('#decision').attr('value', "REJETE");
})


$('#etapes-sidbar nav a').on('click', function (event) {
    const idEtape = $(this).attr('id');
    $("#connection").show();
    $("#error").hide()
    fetch("http://localhost:8080/web_war_exploded/api/etape/" + idEtape)
        .then(response => response.json())
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