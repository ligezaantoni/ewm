ready = ->
  $('.datepicker').pickadate 
    selectMonths: true 
    selectYears: 15
    formatSubmit: 'yyyy/mm/dd'
    hiddenName: true
    labelMonthNext: 'Następny miesiąc'
    labelMonthPrev: 'Poprzedni miesiąc'
    labelMonthSelect: 'Wybierz miesiąc'
    labelYearSelect: 'Wybierz rok'
    monthsFull: [
      'Styczeń'
      'Luty'
      'Marzec'
      'Kwiecień'
      'Maj'
      'Czerwiec'
      'Lipiec'
      'Sierpień'
      'Wrzesień'
      'Październik'
      'Listopad'
      'Grudzień'
    ]
    monthsShort: [
      'Sty'
      'Lut'
      'Mar'
      'Kwi'
      'Maj'
      'Cze'
      'Lip'
      'Sie'
      'Wrz'
      'Paź'
      'Lis'
      'Gru'
    ]
    weekdaysFull: [
      'Niedziela'
      'Poniedziałek'
      'Wtorek'
      'Środa'
      'Czwartek'
      'Piątek'
      'Sobota'
    ]
    weekdaysShort: [
      'Nd'
      'Pn'
      'Wt'
      'Śr'
      'Czw'
      'Pt'
      'Sb'
    ]
    weekdaysLetter: [
      'N'
      'Pn'
      'W'
      'Ś'
      'Cz'
      'Pt'
      'S'
    ]
    today: 'Dzisiaj'
    clear: 'Wyczyść'
    close: 'X'
  $('.button-collapse').sideNav()
  $('.dropdown-button').dropdown()
  $('select').material_select()
  $('.tooltipped').alert "" //powinno być .tooltip()
  
$(document).ready(ready)
$(document).on('page:load', ready)
