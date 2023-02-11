-----------------------------------------------------------------------------------------
--
-- view2.lua
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

	local witch0 = display.newImage("image/witch0.png")
	witch0.x = display.contentCenterX + 352
	witch0.y = display.contentCenterY - 138
	sceneGroup:insert(witch0)

	local witch1 = display.newImage("image/witch1.png")
	witch1.x = display.contentCenterX + 352
	witch1.y = display.contentCenterY - 138
	sceneGroup:insert(witch1)

	local witch2 = display.newImage("image/witch2.png")
	witch2.x = display.contentCenterX + 352
	witch2.y = display.contentCenterY - 138
	sceneGroup:insert(witch2)

	local witch3 = display.newImage("image/witch3.png")
	witch3.x = display.contentCenterX + 352
	witch3.y = display.contentCenterY - 138
	sceneGroup:insert(witch3)

	local witch4 = display.newImage("image/witch4.png")
	witch4.x = display.contentCenterX + 352
	witch4.y = display.contentCenterY - 138
	sceneGroup:insert(witch4)

	local witch5 = display.newImage("image/witch5.png")
	witch5.x = display.contentCenterX + 352
	witch5.y = display.contentCenterY - 138
	sceneGroup:insert(witch5)

	local witch11 = display.newImage("image/witch11.png")
	witch11.x = display.contentCenterX + 352
	witch11.y = display.contentCenterY - 138
	sceneGroup:insert(witch11)

	local witch22 = display.newImage("image/witch22.png")
	witch22.x = display.contentCenterX + 352
	witch22.y = display.contentCenterY - 138
	sceneGroup:insert(witch22)

	local witch33 = display.newImage("image/witch33.png")
	witch33.x = display.contentCenterX + 352
	witch33.y = display.contentCenterY - 138
	sceneGroup:insert(witch33)

	local chichi1 = display.newImage("image/chichi1.png")
	chichi1.x = display.contentCenterX - 411
	chichi1.y = display.contentCenterY + 42
	sceneGroup:insert(chichi1)

	local chichi12 = display.newImage("image/chichi12.png")
	chichi12.x = display.contentCenterX - 411
	chichi12.y = display.contentCenterY + 42
	sceneGroup:insert(chichi12)

	local chichi2 = display.newImage("image/chichi2.png")
	chichi2.x = display.contentCenterX - 411
	chichi2.y = display.contentCenterY + 42
	sceneGroup:insert(chichi2)

	local chichi22 = display.newImage("image/chichi22.png")
	chichi22.x = display.contentCenterX - 411
	chichi22.y = display.contentCenterY + 42
	sceneGroup:insert(chichi22)

	local chichi4 = display.newImage("image/chichi4.png")
	chichi4.x = display.contentCenterX - 411
	chichi4.y = display.contentCenterY + 42
	sceneGroup:insert(chichi4)

	local chichi42 = display.newImage("image/chichi42.png")
	chichi42.x = display.contentCenterX - 411
	chichi42.y = display.contentCenterY + 42
	sceneGroup:insert(chichi42)
	
	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentCenterX
	textbox.y = display.contentCenterY + 311
	sceneGroup:insert(textbox)

	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)
	
	local text = {}
	text[1] = "....."
	text[2] = "일기장 어땠어?  "
	text[3] = "나는 마녀님이 나를 이만큼 좋아하는 줄 몰랐어..."
	text[4] = "너는 해바라기 씨랑 관련된 거에만 눈치가 좋으니까."
	text[5] = "... ..."
	text[6] = "그래서, 여행은 재밌었니?"
	text[7] = "응. 재밌었어. 처음으로 넓은 세상으로 나와서 신나게 움직인 것 같아."
	text[8] = "그래? 네가 요즘 기분이 안 좋아 보여서 작은 선물을 준비한 건데\n재밌었다니 다행이네."
	text[9] = "네가 모험하는 모습을 보면서 생각했어. 집에만 있을 때는 그렇게 행복해보이지 않았는데."
	text[10] = "치치 네가 원하면 여기보다 더 넓은 곳으로 모험을 떠날 수 있게 해줄게. 어떻게 할래? 네가 원하는 대로 해."
	local story = display.newText(text[1], display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)

	local options = {
		effect = "fade",
		time = 400
	} 

	witch1.isVisible = false
	witch2.isVisible = false
	witch3.isVisible = false
	witch4.isVisible = false
	witch5.isVisible = false
	witch11.isVisible = false
	witch22.isVisible = false
	witch33.isVisible = false
	chichi1.isVisible = false
	chichi2.isVisible = false
	chichi4.isVisible = false
	chichi12.isVisible = false
	chichi22.isVisible = false
	chichi42.isVisible = false

	local k = 2
	local function Next(evnet)
		if k == 2 then
			witch0.isVisible = false
			witch1.isVisible = true
		elseif k == 3 then
			witch1.isVisible = false
			witch11.isVisible = true
			chichi2.isVisible = true
		elseif k == 4 then
			witch11.isVisible = false
			chichi2.isVisible = false
			witch2.isVisible = true
			chichi12.isVisible = true
		elseif k == 5 then
			witch2.isVisible = false
			chichi12.isVisible = false
			witch22.isVisible = true
			chichi1.isVisible = true
		elseif k == 6 then
			witch22.isVisible = false
			chichi1.isVisible = false
			witch3.isVisible = true
			chichi22.isVisible = true
		elseif k == 7 then
			witch3.isVisible = false
			chichi22.isVisible = false
			witch33.isVisible = true
			chichi4.isVisible = true
		elseif k == 8 then
			witch33.isVisible = false
			chichi4.isVisible = false
			witch2.isVisible = true
			chichi42.isVisible = true
		elseif k == 9 then
			witch2.isVisible = false
			witch4.isVisible = true
		elseif k == 10 then
			witch4.isVisible = false
			witch5.isVisible = true
		end

		story.text = text[k]
		k = k + 1

		if k == 12 then
			composer.gotoScene("endingSelect", options)
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
