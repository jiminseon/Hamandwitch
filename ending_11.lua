-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newImage("image/ending_11.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentCenterX
	textbox.y = display.contentCenterY + 311
	sceneGroup:insert(textbox)

	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)

	local text = {}
	text[1] = "군데군데 찢어진 곳이 많아 읽을 수가 없어.. "
	text[2] = "군데군데 찢어진 곳이 많아 읽을 수가 없어.. \n잠깐 설마 이거 아까 주운 쪽지들과 같은 종이인가?"
	text[3] = "군데군데 찢어진 곳이 많아 읽을 수가 없어.. \n잠깐 설마 이거 아까 주운 쪽지들과 같은 종이인가?\n한번 붙여봐야겠어"
	local story = display.newText(text[1], display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)

	local k = 2
	local function Next(evnet)
		story.text = text[k]
		k = k + 1

		if k == 5 then
			composer.gotoScene("ending_12")
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
