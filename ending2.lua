-----------------------------------------------------------------------------------------
--
-- view3.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local ending2 = display.newImage("image/ending2.png")
	ending2.x = display.contentWidth * 0.33
	ending2.y = display.contentCenterY
	sceneGroup:insert(ending2)

	local endingStoryBg2 = display.newImage("image/endingStoryBg2.png")
	endingStoryBg2.x = display.contentWidth * 0.83
	endingStoryBg2.y = display.contentCenterY
	sceneGroup:insert(endingStoryBg2)

	local endingTitle2 = display.newText("마녀와 함께 행복하게 살기", display.contentWidth * 0.82, display.contentHeight * 0.2)
	endingTitle2.size = 45
	sceneGroup:insert(endingTitle2)

	local endingStory2 = display.newImage("image/endingStory2.png")
	endingStory2.x = display.contentWidth * 0.825
	endingStory2.y = display.contentHeight * 0.5
	sceneGroup:insert(endingStory2)

	local witch = display.newImage("image/witch.png")
	witch.x = display.contentWidth * 0.45
	witch.y = display.contentCenterY
	sceneGroup:insert(witch)

	local chichi = display.newImage("image/chichi.png")
	chichi.x = display.contentWidth * 0.15
	chichi.y = display.contentCenterY
	sceneGroup:insert(chichi)

	local chichi2 = display.newImage("image/chichi2.png")
	chichi2.x = display.contentWidth * 0.15
	chichi2.y = display.contentCenterY
	sceneGroup:insert(chichi2)

	local witch2 = display.newImage("image/witch2.png")
	witch2.x = display.contentWidth * 0.45
	witch2.y = display.contentCenterY
	sceneGroup:insert(witch2)

	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentWidth*0.33
	textbox.y = display.contentCenterY + 250
	sceneGroup:insert(textbox)

	local text = {}
	text[1] = "치치: 모험도 재밌지만 나는 주인이랑 같이 있는 게 제일 재밌어.\n모험은 가끔 이렇게 하면 되는 거구."
	text[2] = "마녀: 후회 안 할 자신 있어?"
	text[3] = "치치: 그럼! 주인이랑 같이 사는 걸 후회할 리가 없잖아?"
	local story = display.newText(text[1], display.contentWidth*0.305, display.contentCenterY + 215)
	story:setFillColor(0)
	story.size = 40
	sceneGroup:insert(story)

	witch.isVisible = false
	chichi2.isVisible = false
	witch2.isVisible = false
	local k = 2
	local function Next(evnet)
		if k == 2 then
			witch.isVisible = true
			chichi.isVisible = false
			chichi2.isVisible = true
			witch2.isVisible = false
			story.x = display.contentWidth*0.17
			story.y = display.contentHeight*0.68
		elseif k == 3 then
			witch.isVisible = false
			chichi.isVisible = true
			chichi2.isVisible = false
			witch2.isVisible = true
			story.x = display.contentWidth*0.27
		elseif k == 4 then 
			display.remove(witch)
			display.remove(chichi)
			display.remove(witch2)
			display.remove(chichi2)
			display.remove(textbox)
		end

		story.text = text[k]
		k = k + 1

		if k == 6 then
			composer.gotoScene("title", options)
		end
	end

	ending2:addEventListener("tap",Next)
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
