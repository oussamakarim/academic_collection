
function update_table(data){
    let tbody =document.querySelector('#student-grades tbody');
    data.forEach(function(record){
        let tr = document.createElement('tr');
        for (let prop in record){
            let td = document.createElement('td');
            td.textContent = record[prop];
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    })
}
let xhr = new XMLHttpRequest();
xhr.open('GET', './php/get_grades.php', true);

xhr.onreadystatechange = function(event){
    if ( this.readyState == 4 && this.status == 200){
        let response = JSON.parse(this.responseText);
        console.log(response);
        update_table(response.data);
    }
}

xhr.send()