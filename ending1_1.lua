
local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage("image/standingBg.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local witch2 = display.newImage("image/witch2.png")
	witch2.x = display.contentCenterX + 352
	witch2.y = display.contentCenterY - 138
	sceneGroup:insert(witch2)

	local witch22 = display.newImage("image/witch22.png")
	witch22.x = display.contentCenterX + 352
	witch22.y = display.contentCenterY - 138
	sceneGroup:insert(witch22)	

	local witch7 = display.newImage("image/witch7.png")
	witch7.x = display.contentCenterX + 326
	witch7.y = display.contentCenterY - 168
	sceneGroup:insert(witch7)

	local chichi2 = display.newImage("image/chichi2.png")
	chichi2.x = display.contentCenterX - 411
	chichi2.y = display.contentCenterY + 42
	sceneGroup:insert(chichi2)

	local chichi22 = display.newImage("image/chichi22.png")
	chichi22.x = display.contentCenterX - 411
	chichi22.y = display.contentCenterY + 42
	sceneGroup:insert(chichi22)

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
	text[1] = "그럴 줄 알았어. 하지만 바깥 세상은 햄스터 혼자 여행하기 힘들거야."
	text[2] = "내가 할 수 있을까?"
	text[3] = "당연하지. 그리고 내가 도와줄게. 너의 자유로운 모험이 안전하기를."
	local story = display.newText(text[1], display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)

	local options = {
		effect = "fade",
		time = 400
	} 

	chichi2.isVisible = false
	chichi22.isVisible = false
	witch22.isVisible = false
	witch7.isVisible = false
	local k = 2
	local function Next(evnet)
		if k == 2 then
			chichi42.isVisible = false
			witch2.isVisible = false
			chichi2.isVisible = true
			witch22.isVisible = true			
		elseif k == 3 then
			witch22.isVisible = false
			chichi2.isVisible = false
			chichi22.isVisible = true
			witch7.isVisible = true
		end

		story.text = text[k]
		k = k + 1

		if k == 5 then
			composer.gotoScene("ending1_2", options)
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