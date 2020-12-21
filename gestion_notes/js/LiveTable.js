
export default class LiveTable{
    constructor(data){
        this.data = data;
    }
    createSearchBar() {
        let row = document.createElement('div');
        row.setAttribute('class', 'row');

        let col10 = document.createElement('div');
        col10.setAttribute('class', 'col-md-9');

        let col3 = document.createElement('div');
        col3.setAttribute('class', 'col-md-3');

        let input = document.createElement('input');
        input.type = 'text';
        input.setAttribute('class', 'form-control');
        input.placeholder = 'Search ...';

        let addButton = document.createElement('button');
        addButton.setAttribute('class', 'btn btn-primary');
        addButton.textContent = 'add';

        let deleteButton = document.createElement('button');
        deleteButton.setAttribute('class', 'btn btn-danger');
        deleteButton.textContent = 'delete';

        col3.append(addButton);
        col3.append(deleteButton);
        col10.append(input);
        row.append(col10, col3);
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
        let tbody = document.createElement('tbody');
        data.forEach(function (student) {
            let tr = document.createElement('tr');
            tr.setAttribute('data-toggle', 'modal');
            tr.setAttribute('data-target', '#update');
            for (let prop in student) {
                let td = document.createElement('td');
                td.setAttribute('class', 'text-light');
                td.textContent = student[prop];
                tr.append(td);

            }

            // on click update popup valuee
            tr.addEventListener('click', function(event){
                let data = event.target.querySelectorAll('td');
                let student = {
                    firstName: td[0].textContent,
                    lastName: td[0].textContent,
                    firstTest: td[0].textContent,
                    lastTest: td[0].textContent
                };

                document.querySelector('.modal-title').textContent = student.firstName + ' ' + student.lastName;
                document.getElementById('first-test').setAttribute('value', student.firstTest);
                document.getElementById('second-test').setAttribute('value', student.lastTest);
            })
            tbody.append(tr);
        })
        return tbody;
    }

    createTable() {
        let table = document.createElement('table');
        table.setAttribute('class', 'table table-bordered table-striped');
        table.append(this.createTableHead(), this.createTableBody(this.data));

        let row = document.createElement('div');
        row.setAttribute('class', 'row');
        row.append(table);
        return row;
    }

}
