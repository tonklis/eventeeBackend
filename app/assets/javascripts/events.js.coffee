jQuery ->
  $('#event_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#event_end_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('.invite-people').click ->
    $('.form-search').show()