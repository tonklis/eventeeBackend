jQuery ->
  $('#event_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#event_end_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('.add-something').click ->
    $('.form-search').show()

 	$('.guests').click ->
 		$('.guest-modal').addClass('show')
 		$('.overlay').show()

 	$('.upload').click ->
 		$('.upload-modal').addClass('show')
 		$('.overlay').show()

	$('.close').click ->
		$('.guest-modal').removeClass('show')
		$('.overlay').hide()
