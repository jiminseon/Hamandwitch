-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/stage2_bg.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local bg = display.newImage("image/clear2-1.png")
	bg.x = display.contentCenterX
	bg.y = display.contentCenterY - 75
	sceneGroup:insert(bg)

	local nextSt = display.newImage("image/nextStage.png")
	nextSt.x = display.contentCenterX
	nextSt.y = display.contentCenterY + 22
	sceneGroup:insert(nextSt)

	local map = display.newImage("image/gotoMap.png")
	map.x = display.contentCenterX
	map.y = display.contentCenterY + 128
	sceneGroup:insert(map)

	local clearStage = 1
	
	local function nextStage(event)
		composer.removeScene("clear")
		composer.setVariable("clear4", clearStage)
		composer.gotoScene("stage5")
	end
	nextSt:addEventListener("tap", nextStage)

	local function backToMap(event)
		composer.removeScene("clear")
		composer.setVariable("clear4", clearStage)			
		composer.gotoScene("map")
	end
	map:addEventListener("tap", backToMap)
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
		composer.removeScene("view8")
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
