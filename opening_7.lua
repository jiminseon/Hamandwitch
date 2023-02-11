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

	local background = display.newImage("image/opening8.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)
	
	local textbox = display.newImage("image/OpeningTextbox.png")
	textbox.x = display.contentCenterX
	textbox.y = display.contentCenterY + 311
	sceneGroup:insert(textbox)

	local text = {}
	text[1] = "“이건 보물지도...!”"
	text[2] = "'이것만 있으면 마녀님의 도움 없이도 살 수 있겠지'"
	local story = display.newText(text[1], display.contentCenterX , display.contentCenterY + 370,textbox.x + 80, 300, "font/BMJUA_ttf.ttf")
	story:setFillColor(0.3)
	story.size = 40
	sceneGroup:insert(story)
	
	local next = display.newImage("image/NextButton.png")
	next.x = display.contentCenterX + 523
	next.y = display.contentCenterY + 384
	sceneGroup:insert(next)
 
	local k = 2
	local function Next(evnet)
	   story.text = text[k]
	   k = k + 1
 
	   if k == 4 then
		audio.play(bookSound)
		  composer.gotoScene("opening_8")
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
