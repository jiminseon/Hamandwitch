-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local mapBg = display.newImage("image/map.png")
	mapBg.x = display.contentCenterX
	mapBg.y = display.contentCenterY
	sceneGroup:insert(mapBg)

	local cage = display.newImage("image/1-1.png")
	cage.x = display.contentCenterX - 383
	cage.y = display.contentCenterY - 203
	sceneGroup:insert(cage)

	local stage1 = display.newImage("image/1-22.png")
	stage1.x = display.contentCenterX - 242
	stage1.y = display.contentCenterY - 82
	sceneGroup:insert(stage1)

	local stage2 = display.newImage("image/1-33.png")
	stage2.x = display.contentCenterX - 425
	stage2.y = display.contentCenterY + 18
	sceneGroup:insert(stage2)

	local stage3 = display.newImage("image/2-11.png")
	stage3.x = display.contentCenterX - 47
	stage3.y = display.contentCenterY  + 324
	sceneGroup:insert(stage3)

	local stage4 = display.newImage("image/2-22.png")
	stage4.x = display.contentCenterX + 150
	stage4.y = display.contentCenterY + 256
	sceneGroup:insert(stage4)

	local stage5 = display.newImage("image/3-11.png")
	stage5.x = display.contentCenterX + 355
	stage5.y = display.contentCenterY - 50
	sceneGroup:insert(stage5)

	local stage6 = display.newImage("image/3-22.png")
	stage6.x = display.contentCenterX + 471
	stage6.y = display.contentCenterY - 166
	sceneGroup:insert(stage6)

	local treasure = display.newImage("image/treasure2.png")
	treasure.x = display.contentCenterX + 655
	treasure.y = display.contentCenterY - 342
	sceneGroup:insert(treasure)

	local stageClear1 = display.newImage("image/1-2.png")
	stageClear1.x = display.contentCenterX - 242
	stageClear1.y = display.contentCenterY - 82
	sceneGroup:insert(stageClear1)
	stageClear1.isVisible = false

	local stageClear2 = display.newImage("image/1-3.png")
	stageClear2.x = display.contentCenterX - 425
	stageClear2.y = display.contentCenterY + 18
	sceneGroup:insert(stageClear2)
	stageClear2.isVisible = false

	local stageClear3 = display.newImage("image/2-1.png")
	stageClear3.x = display.contentCenterX - 47
	stageClear3.y = display.contentCenterY  + 324
	sceneGroup:insert(stageClear3)
	stageClear3.isVisible = false

	local stageClear4 = display.newImage("image/2-2.png")
	stageClear4.x = display.contentCenterX + 150
	stageClear4.y = display.contentCenterY + 256
	sceneGroup:insert(stageClear4)	
	stageClear4.isVisible = false

	local stageClear5 = display.newImage("image/3-1.png")
	stageClear5.x = display.contentCenterX + 355
	stageClear5.y = display.contentCenterY - 50
	sceneGroup:insert(stageClear5)
	stageClear5.isVisible = false

	local stageClear6 = display.newImage("image/3-2.png")
	stageClear6.x = display.contentCenterX + 471
	stageClear6.y = display.contentCenterY - 166
	sceneGroup:insert(stageClear6)
	stageClear6.isVisible = false

	local treasureClear = display.newImage("image/treasure1.png")
	treasureClear.x = display.contentCenterX + 655
	treasureClear.y = display.contentCenterY - 342
	sceneGroup:insert(treasureClear)
	treasureClear.isVisible = false

	local story = display.newImage("image/MainTextbox.png")
	story.x = display.contentCenterX
	story.y = display.contentCenterY + 311
	sceneGroup:insert(story)

	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)

	local talking = display.newText("보물을 찾아서 마녀님 도움 없이도 살고 말겠어!", display.contentCenterX + 230, display.contentCenterY + 370,story.x + 80, 300, "font/BMJUA_ttf.ttf")
	talking:setFillColor(0.3)
	talking.size = 40
	sceneGroup:insert(talking)
	
	local function nextStory(evnet)
		composer.setVariable("stageM", stageM)
		composer.gotoScene("map")
	end
	next:addEventListener("tap", nextStory)

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
		composer.removeScene("stageExplain")
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