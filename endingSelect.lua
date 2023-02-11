-----------------------------------------------------------------------------------------
--
-- view1.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/standingBg.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local select1 = display.newImage("image/select1.png")
	select1.x = display.contentCenterX
	select1.y = display.contentCenterY - 218
	sceneGroup:insert(select1)

	local select2 = display.newImage("image/select2.png")
	select2.x = display.contentCenterX
	select2.y = display.contentCenterY - 52
	sceneGroup:insert(select2)

	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentCenterX
	textbox.y = display.contentCenterY + 311
	sceneGroup:insert(textbox)

	local story = display.newText("치치의 선택은...", display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)

	local function endingSelect1(event)
		composer.removeScene("endingSelect")
		composer.gotoScene("ending1_1")
	end

	local function endingSelect2(event)
		composer.removeScene("endingSelect")
		composer.gotoScene("ending2_1")
	end

	select1:addEventListener("tap", endingSelect1)
	select2:addEventListener("tap", endingSelect2)

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