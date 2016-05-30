-- diaplay.setStatusBar(display.HiddenStatusBar)
local physics = require "physics"
physics.start()
physics.setGravity(0, 0)

local background = display.newImage("background.jpg")

background.x = 570
background.y = 140

local happy = display.newImage("pacman.png")

happy.x = 100
happy.y = 100
physics.addBody(happy, "dynamic")

local angry = display.newImage("ghost.png")

angry.x = 200
angry.y = 200
physics.addBody(angry, "static")

local angry2 = display.newImage("ghost.png")

angry2.x = 300
angry2.y = 300
physics.addBody(angry2, "static")

function touchScreen(event)
	if event.phase == "began" then
		transition.to(happy, {time=1000, x=event.x, y=event.y})
	end
end

Runtime:addEventListener("touch", touchScreen)

function moveAngry( ang )
	transition.to(ang, {time=1000, x=math.random(80, 880), y=math.random(60,580), onComplete=moveAngry})
end

moveAngry(angry)
moveAngry(angry2)

function onCollision( event )
	-- print("collide!")
	happy:removeSelf()
end

Runtime:addEventListener("collision", onCollision)