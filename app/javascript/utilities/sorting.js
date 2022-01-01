document.addEventListener('turbolinks:load', () => {
  let control = document.querySelector('.sort-by-title')
  if (control) {
    control.addEventListener('click', sortRowsByTitle)
  }
})

const sortRowsByTitle = () => {
  let table = document.querySelector('table')
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  for (let i = 1; i < rows.length; i++) {
    sortedRows.push(rows[i])
  }

  const arrowUp = table.querySelector('.octicon-arrow-up')

  if (table.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    table.querySelector('.octicon-arrow-up').classList.remove('hide')
    table.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    table.querySelector('.octicon-arrow-down').classList.remove('hide')
    table.querySelector('.octicon-arrow-up').classList.add('hide')
  }
  
  let sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  table.parentNode.replaceChild(sortedTable, table)
}

const compareRowsAsc = (row1, row2) => {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {
    return -1
  }
  if (testTitle1 > testTitle2) {
    return 1
  }
  return 0
}

const compareRowsDesc = (row1, row2) => {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {
    return 1
  }
  if (testTitle1 > testTitle2) {
    return -1
  }
  return 0
}