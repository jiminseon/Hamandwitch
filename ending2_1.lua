-----------------------------------------------------------------------------------------
--
-- view3.lua
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

	local witch6 = display.newImage("image/witch6.png")
	witch6.x = display.contentCenterX + 352
	witch6.y = display.contentCenterY - 138
	sceneGroup:insert(witch6)

	local witch55 = display.newImage("image/witch55.png")
	witch55.x = display.contentCenterX + 352
	witch55.y = display.contentCenterY - 138
	sceneGroup:insert(witch55)

	local witch66 = display.newImage("image/witch66.png")
	witch66.x = display.contentCenterX + 352
	witch66.y = display.contentCenterY - 138
	sceneGroup:insert(witch66)

	local chichi3 = display.newImage("image/chichi3.png")
	chichi3.x = display.contentCenterX - 411
	chichi3.y = display.contentCenterY + 42
	sceneGroup:insert(chichi3)

	local chichi32 = display.newImage("image/chichi32.png")
	chichi32.x = display.contentCenterX - 411
	chichi32.y = display.contentCenterY + 42
	sceneGroup:insert(chichi32)

	local chichi4 = display.newImage("image/chichi4.png")
	chichi4.x = display.contentCenterX - 411
	chichi4.y = display.contentCenterY + 42
	sceneGroup:insert(chichi4)

	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentCenterX
	textbox.y = display.contentCenterY + 311
	sceneGroup:insert(textbox)

	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)

	local text = {}
	text[1] = "모험도 재밌지만 나는 마녀님이랑 같이 있는 게 제일 재밌어.\n모험은 가끔 이렇게 하면 되는 거구."
	text[2] = "후회 안 할 자신 있어?"
	text[3] = "그럼! 마녀님이랑 같이 사는 걸 후회할 리가 없잖아?"
	local story = display.newText(text[1], display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)

	local options = {
		effect = "fade",
		time = 400
	} 

	chichi32.isVisible = false
	witch6.isVisible = false
	chichi4.isVisible = false
	witch66.isVisible = false
	local k = 2
	local function Next(evnet)
		if k == 2 then
			chichi3.isVisible = false
			witch55.isVisible = false
			chichi32.isVisible = true
			witch6.isVisible = true
		elseif k == 3 then
			chichi32.isVisible = false
			witch6.isVisible = false
			chichi4.isVisible = true
			witch66.isVisible = true			
		end

		story.text = text[k]
		k = k + 1

		if k == 5 then
			composer.gotoScene("ending2_2", options)
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
