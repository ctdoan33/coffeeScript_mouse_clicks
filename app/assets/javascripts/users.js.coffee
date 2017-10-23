player = prompt "Please enter your name:"
mouseClicks = ->
	field = document.getElementById "field"
	log = document.getElementById "log"
	danger = []
	setup = ->
		log.innerHTML = ""
		danger = []
		danger.push [Math.trunc(Math.random()*10), Math.trunc(Math.random()*10)] for x in [1..5]
		return
	setup()
	clicked = (e) ->
		x = e.clientX
		y = e.clientY
		hit = false
		for i in danger
			if i[0] == Math.trunc(x/20) and i[1] == Math.trunc(y/20)
				hit = true
		if hit
			alert "Aww, sorry, #{player}! You detonated a bomb"
			setup()
		else
			entry = document.createElement "p"
			log.appendChild entry.appendChild document.createTextNode "Safe! you clicked on: x: #{x}; y: #{y}"
			log.appendChild document.createElement "br"
		return
	field.addEventListener "click", clicked
	return
window.onload = mouseClicks