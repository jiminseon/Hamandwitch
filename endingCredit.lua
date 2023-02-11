-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()
local backgroundMusic = audio.loadStream("music/main.mp3")

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImage("image/credit.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local box = display.newImage("image/creditBox.png")
	box.x = display.contentCenterX + 464
	box.y = display.contentCenterY
	sceneGroup:insert(box)

	local creditText = display.newImage("image/creditText.png")	
	creditText.x = display.contentCenterX + 480
	creditText.y = display.contentHeight * 2
	sceneGroup:insert(creditText)

	local creditTop = display.newImage("image/credit2.png")	
	creditTop.x = display.contentCenterX + 501.5
	creditTop.y = display.contentCenterY - 434
	sceneGroup:insert(creditTop)

	local creditBottom = display.newImage("image/credit3.png")	
	creditBottom.x = display.contentCenterX + 506
	creditBottom.y = display.contentCenterY + 434
	sceneGroup:insert(creditBottom)

	transition.moveTo(creditText, {y = - 430, time = 18000})
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "will" then
		-- Called when the scene is still off screen and is about to move on screen
	elseif phase == "did" then
		-- Called when the scene is now on screen
		-- 
		-- INSERT code here to make the scene come alive
		-- e.g. start timers, begin animation, play audio, etc.
		audio.setVolume(0.5)
		local op = {
			loops = - 1
		}
		audio.play(backgroundMusic, op)

	end	
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if event.phase == "will" then
		-- Called when the scene is on screen and is about to move off screen
		--
		-- INSERT code here to pause the scene
		-- e.g. stop timers, stop animation, unload sounds, etc.)
	elseif phase == "did" then
		-- Called when the scene is now off screen
		audio.stop(1)
		composer.removeScene("view2")
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	
	-- Called prior to the removal of scene's "view" (sceneGroup)
	-- 
	-- INSERT code here to cleanup the scene
	-- e.g. remove display objects, remove touch listeners, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
