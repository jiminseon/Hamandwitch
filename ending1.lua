-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local ending1 = display.newImage("image/ending1.png")
	ending1.x = display.contentWidth * 0.33
	ending1.y = display.contentCenterY
	sceneGroup:insert(ending1)

	local endingStoryBg1 = display.newImage("image/endingStoryBg1.png")
	endingStoryBg1.x = display.contentWidth * 0.83
	endingStoryBg1.y = display.contentCenterY
	sceneGroup:insert(endingStoryBg1)

	--[[local endingTitle1 = display.newImage("image/endingTitle1.png")
	endingTitle1.x = display.contentWidth * 0.8
	endingTitle1.y = display.contentHeight * 0.2
	sceneGroup:insert(endingTitle1)]]

	local endingTitle1 = display.newText("더 넓은 세계로 모험 떠나기", display.contentWidth * 0.82, display.contentHeight * 0.2)
	endingTitle1.size = 45
	sceneGroup:insert(endingTitle1)

	local endingStory1 = display.newImage("image/endingStory1.png")
	endingStory1.x = display.contentWidth * 0.825
	endingStory1.y = display.contentHeight * 0.5
	sceneGroup:insert(endingStory1)

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
	text[1] = "마녀: 그럴 줄 알았어. 하지만 바깥 세상은 햄스터 혼자 여행하기 힘들거야."
	text[2] = "치치: 내가 할 수 있을까?"
	text[3] = "마녀: 당연하지. 그리고 내가 도와줄게. 너의 자유로운 모험이 안전하기를."
	local story = display.newText(text[1], display.contentWidth*0.34, display.contentCenterY + 193)
	story:setFillColor(0)
	story.size = 40
	sceneGroup:insert(story)

	chichi.isVisible = false
	chichi2.isVisible = false
	witch2.isVisible = false
	local k = 2
	local function Next(evnet)
		if k == 2 then
			chichi.isVisible = true
			witch.isVisible = false
			chichi2.isVisible = false
			witch2.isVisible = true
			story.x = display.contentWidth*0.16
		elseif k == 3 then
			chichi.isVisible = false
			witch.isVisible = true
			chichi2.isVisible = true
			witch2.isVisible = false
			story.x = display.contentWidth*0.34
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

	ending1:addEventListener("tap",Next)
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