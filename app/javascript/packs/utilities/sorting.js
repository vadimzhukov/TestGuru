document.addEventListener("turbolinks:load", function() {
  
  let control = document.querySelector(".sort-by-title");
  if (control) {
  control.addEventListener("click", function() {
    
    let arrowUp = document.querySelector('.bi-caret-up-fill');
    let arrowDown = document.querySelector('.bi-caret-down-fill');
      
    let table = document.querySelector('table');

    let rows = table.querySelectorAll('tr');

    let sortedRows = [];

    for (let i = 1; i < rows.length; i++ ) {
      sortedRows.push(rows[i]);
    }

    if (arrowUp.classList.contains('hide')) {
      sortedRows.sort(compareRowsASC);
      
      arrowUp.classList.remove('hide');
      arrowDown.classList.add('hide');
    }

    else {
      sortedRows.sort(compareRowsDESC);
    
      arrowUp.classList.add('hide');
      arrowDown.classList.remove('hide');
    }

    let sortedTable = document.createElement('table');
    sortedTable.classList.add('table');
    sortedTable.appendChild(rows[0]);

    sortedRows.forEach((el) => {
        sortedTable.appendChild(el);
    })

    let tableParentNode = table.parentNode
    tableParentNode.removeChild(table);
    tableParentNode.appendChild(sortedTable);

    function compareRowsASC(row1, row2) {
      let titleValue1 = row1.querySelector('.title-col').textContent
      let titleValue2 = row2.querySelector('.title-col').textContent

      if (titleValue1 > titleValue2) { return 1 }
      else if (titleValue1 < titleValue2) { return -1 }
      else {return 0};

    }

    function compareRowsDESC(row1, row2) {
      let titleValue1 = row1.querySelector('.title-col').textContent
      let titleValue2 = row2.querySelector('.title-col').textContent

      if (titleValue1 > titleValue2) { return -1 }
      else if (titleValue1 < titleValue2) { return 1 }
      else {return 0};

    }
  })
}
})
