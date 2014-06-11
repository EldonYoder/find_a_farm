$ ->
	
	# Pops up the overlay and new link form
	$("#farm_link_button").click ->
		$("#mod_overlay").show "fast"
		$("#add_new_link").slideDown "400"

	$("#close_new_q_modal").click ->
		$("#mod_overlay").hide "fast"
		$("#add_new_link").slideUp "400"