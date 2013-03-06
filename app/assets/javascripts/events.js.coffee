jQuery ->
  $('#event_start_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('#event_end_date').datepicker
    dateFormat: 'yy-mm-dd'

  $('.add-something').click ->
    $('.form-search').show()

  $('.comment').click ->
  	$('.comment-area').addClass('open')
  	false

 	$('.guests').click ->
 		$('.guest-modal').addClass('show')
 		$('.overlay').show()