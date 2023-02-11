-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local op = {
		loops = - 1
	}
	local soloMusic = audio.loadStream("music/soloEnding.mp3")
	audio.play(soloMusic, op)
	audio.setVolume(0.5)

	local ending1 = display.newImage("image/ending1.png")
	ending1.x = display.contentWidth * 0.335
	ending1.y = display.contentCenterY
	sceneGroup:insert(ending1)

	local endingStoryBg1 = display.newImage("image/endingStoryBg1.png")
	endingStoryBg1.x = display.contentCenterX + 635
	endingStoryBg1.y = display.contentCenterY 
	sceneGroup:insert(endingStoryBg1)

	local goTitle = display.newImage("image/goToTitle.png")
	goTitle.x = display.contentCenterX + 806
	goTitle.y = display.contentCenterY - 455
	sceneGroup:insert(goTitle)

	goTitle.isVisible = false

	local function titleVisible(event)
		goTitle.isVisible = true
	end
	timer.performWithDelay(5000, titleVisible)

	local options = {
		effect = "fade",
		time = 400
	} 

	local function Next(evnet)
		composer.gotoScene("endingCredit", options)
	end
	goTitle:addEventListener("tap",Next)
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