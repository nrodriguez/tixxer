# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

	$('.commit_comment').popover()

	$('#branch').change (e) ->
		$("#change_branch").submit()
		# $.post("/change_branch", {"branch" : $(this).val()})
		# 	.success () ->


