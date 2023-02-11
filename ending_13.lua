-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local bookSound = audio.loadSound("music/book.mp3")

	local background = display.newImage("image/ending_13.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local diary1 = display.newImage("image/diary1.png")
	diary1.x = display.contentCenterX
	diary1.y = display.contentCenterY
	sceneGroup:insert(diary1)

	local diary2 = display.newImage("image/diary2.png")
	diary2.x = display.contentCenterX
	diary2.y = display.contentCenterY
	sceneGroup:insert(diary2)

	local diary3 = display.newImage("image/diary3.png")
	diary3.x = display.contentCenterX
	diary3.y = display.contentCenterY
	sceneGroup:insert(diary3)

	local diary4 = display.newImage("image/diary4.png")
	diary4.x = display.contentCenterX
	diary4.y = display.contentCenterY
	sceneGroup:insert(diary4)

	local diary5 = display.newImage("image/diary5.png")
	diary5.x = display.contentCenterX
	diary5.y = display.contentCenterY
	sceneGroup:insert(diary5)

	local diary6 = display.newImage("image/diary6.png")
	diary6.x = display.contentCenterX
	diary6.y = display.contentCenterY
	sceneGroup:insert(diary6)	

	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)

	local options = {
		effect = "fade",
		time = 400
	} 
	
	diary2.isVisible = false
	diary3.isVisible = false
	diary4.isVisible = false
	diary5.isVisible = false
	diary6.isVisible = false
	local k = 2
	local function Next(evnet)
		if k == 2 then
			audio.play(bookSound)
			diary1.isVisible = false
			diary2.isVisible = true
		elseif k == 3 then
			audio.play(bookSound)
			diary2.isVisible = false
			diary3.isVisible = true
		elseif k == 4 then
			audio.play(bookSound)
			diary3.isVisible = false
			diary4.isVisible = true
		elseif k == 5 then
			audio.play(bookSound)
			diary4.isVisible = false
			diary5.isVisible = true
		elseif k == 6 then
			audio.play(bookSound)
			diary5.isVisible = false
			diary6.isVisible = true
		end
		k = k + 1

		if k == 8 then
			composer.gotoScene("ending_14", options)
		end
	end

	next:addEventListener("tap",Next)

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