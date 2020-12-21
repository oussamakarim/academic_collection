class LiveTable {
    constructor(data) {
        this.data = data;
    }
    createSearchBar() {
        let row = document.createElement('div');
        row.setAttribute('class', 'row pb-4 mt-4');

        let input = document.createElement('input');
        input.type = 'text';
        input.setAttribute('class', 'form-control');
        input.setAttribute('id', 'filter-grades');
        input.placeholder = 'Search ...';

        let message = document.createElement('div');
        message.textContent = '* Hint: Click a record to update grades';
        message.className = 'text-secondary';

        row.append(input, message);
        return row;
    }

    createTableHead() {
        let thead = document.createElement('thead');
        let tr = document.createElement('tr');

        ['first name', 'last name', 'first test', 'second test', 'grade', 'status'].forEach(function (elem) {
            let td = document.createElement('td');
            td.textContent = elem;
            tr.append(td);
        })

        thead.append(tr);
        return thead;
    }

    createTableBody() {
        // TODO: add course and student id to tag for flexibility
        let tbody = document.createElement('tbody');
        tbody.setAttribute('id', 'grades');
        this.data.forEach(function (student) {
            let tr = document.createElement('tr');
            tr.setAttribute('data-toggle', 'modal');
            tr.setAttribute('data-target', '#update');
            tr.setAttribute('id', student.id);
            for (let prop in student) {
                // replace id with checkbox
                if (prop == 'id'){continue;}
                let td = document.createElement('td');
                td.textContent = student[prop];
                tr.append(td);

            }

            // on click update popup value
            tr.addEventListener('click', function (event) {
                let data = event.currentTarget.querySelectorAll('td');
                let student = {
                    id: tr.getAttribute('id'),
                    firstName: data[0].textContent,
                    lastName: data[1].textContent,
                    firstTest: data[2].textContent,
                    lastTest: data[3].textContent,
                    status: data[5].textContent
                };

                let status = document.createElement('span');
                status.textContent = ' ( ' + student.status + ' )';
                status.style.color = (student.status == 'Pass') ? 'green' : '#ff0000';

                document.querySelector('.modal-title').textContent = student.firstName + " " + student.lastName;
                document.querySelector('.modal-title').appendChild(status);
                document.querySelector('.modal-title').setAttribute('id', student.id);
                // document.getElementById('first-test').setAttribute('value', student.firstTest);
                // document.getElementById('second-test').setAttribute('value', student.lastTest);

                
            })
            tbody.append(tr);
        })
        return tbody;
    }

    createTable() {
        let table = document.createElement('table');
        table.setAttribute('class', 'table table-bordered table-striped table-hover');
        table.append(this.createTableHead(), this.createTableBody(this.data));

        let row = document.createElement('div');
        row.setAttribute('class', 'row');
        row.append(table);
        return row;
    }
}

function updateGrade(studentID, courseID, firstTest, secondTest){
    let xhr = new XMLHttpRequest();
    let data = new FormData();
    data.append('student-id', studentID);
    data.append('course-id', courseID);
    data.append('first-test', firstTest);
    data.append('second-test', secondTest);

    console.log('%c updating grade ....');
    xhr.open('GET', './php/update_grade.php', false);
    xhr.onreadystatechange = function(event){
        if ( this.readyState == 4 && this.status == 200){
            let response = JSON.parse(this.responseText);

            let updateMessage = document.getElementById('update-message');
            updateMessage.className = (response) ? 'text-success' : 'text-danger';
            updateMessage.textContent = response.description;

            // update record on table
            updateTableRecord(studentID, firstTest, secondTest);
        } 
    }

    xhr.send(data);
}

function updateTableRecord(tr_id, firstTest, secondTest) {
    // let data = document.querySelector(`tr[id='${tr_id}]'`);
    let data = document.querySelectorAll(`tr`);
    data.forEach(function(elem){
        console.log(elem);
        if (elem.getAttribute('id') == tr_id){
            let tds = elem.querySelectorAll('td');
            tds[2].textContent = firstTest;
            tds[3].textContent = secondTest;
            tds[4].textContent = (parseFloat(firstTest) + parseFloat(secondTest)) / 2;
            tds[5].textContent = (tds[4] > 10)? 'Pass':'Fail';
        }
    })
}

/* live table update with ajax */
let courses = document.querySelectorAll('.collapse li');

courses.forEach(function(elem){
    elem.addEventListener('click', function(event){
        let course_id = event.target.getAttribute('id');
        
        // get data from server and outputt
        let xhr = new XMLHttpRequest();
        xhr.open('GET', './php/get_students.php?id=' + course_id, false);
        xhr.onreadystatechange = function(){
            let input_div = document.getElementById('grades_data');
            if (this.readyState == 4 && this.status == 200){
                json = JSON.parse(this.responseText);
                input_div.innerHTML = null;

                if (json.status){
                    let livetable = new LiveTable(json.data);
                    input_div.append(livetable.createTable());
                } else {
                    input_div.append(document.createTextNode('not valid'));
                }
            }
        }
        xhr.send();

        document.querySelector('table').setAttribute('id', course_id);
    })
})


/* update students data */
let update_button = document.getElementById('update-grade');
update_button.addEventListener('click', function(event){


    updateGrade(
        document.querySelector('.modal-title').getAttribute('id'),
        document.querySelector('table').getAttribute('id'),
        document.querySelector('#first-test').value,
        document.querySelector('#second-test').value
    );
    
})