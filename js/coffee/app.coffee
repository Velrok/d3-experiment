@visuData = []

$(document).ready =>
	$('#input').first().change(input_changed)
	setVisuData( $('#input').first().attr('value') )

	updateVisualisation()


setVisuData = (newValue)->
	try
		@visuData = JSON.parse(newValue)
	catch e
		console.log "can't parse json: #{newValue}"
		alert e

input_changed = (event)=>
	newValue = event.target.value
	setVisuData(newValue)
	console.log "input changed to #{newValue}"
	updateVisualisation()

updateVisualisation = ->
	divs = @d3.select('#vis').selectAll('div').data(@visuData)
	divs.enter().append("div").classed('bar', true)
	divs.style 'height', (d)->
		d*10