ready = ->

  element = $("[data-role~=sortable-list]")
  itemsSelector = element.data("items-selector") || "li"
  
  element.sortable
    items: itemsSelector

$(document).ready(ready)
$(document).on('page:load', ready)
