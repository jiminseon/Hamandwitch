-----------------------------------------------------------------------------------------
--
-- map 설명.lua
--
-----------------------------------------------------------------------------------------

local M = {}
 
local json = require( "json" )
local filePath = system.pathForFile( "scores.json", system.DocumentsDirectory )

 
 
local function saveScores()
	for i = #scoresTable, 1, -1 do
        table.remove( scoresTable, i )
    end
 
    local file = io.open( filePath, "w" )
 
    if file then
        file:write( json.encode( scoresTable ) )
        io.close( file )
    end
end

local function loadScores()
	 
	local file = io.open( filePath, "r" )
	 
	if file then
        local contents = file:read( "*a" )
        io.close( file )
        scoresTable = json.decode( contents )
    end
 
    if ( scoresTable == nil or #scoresTable == 0 ) then
        scoresTable = {1}
    end
end

 

local composer = require( "composer" )
local scene = composer.newScene()
local backMusic = audio.loadStream("music/stage.mp3")

function scene:create( event )
	local sceneGroup = self.view

	local background = display.newRect(display.contentCenterX, display.contentCenterY, 
	display.contentWidth, display.contentHeight) 
	sceneGroup:insert(background)

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

	local function mouseOver(event)
		if event.type == "move" then
			if event.x < cage.x + 95 and event.x > cage.x - 95 and
			event.y < cage.y + 95 and event.y > cage.y - 95 then
				cage.width = 195
				cage.height = 112
			else
				cage.width = 176
				cage.height = 93
			end

			if event.x < stage1.x + 80 and event.x > stage1.x - 80 and
			event.y < stage1.y + 80 and event.y > stage1.y - 80  and 
			event.x < stageClear1.x + 80 and event.x > stageClear1.x - 80 and
			event.y < stageClear1.y + 80 and event.y > stageClear1.y - 80 then
				stage1.width = 195
				stage1.height = 112
				stageClear1.width = 195
				stageClear1.height = 112
			else
				stage1.width = 176
				stage1.height = 93
				stageClear1.width = 176
				stageClear1.height = 93
			end

			if event.x < stage2.x + 80 and event.x > stage2.x - 80 and
			event.y < stage2.y + 80 and event.y > stage2.y - 80  and 
			event.x < stageClear2.x + 80 and event.x > stageClear2.x - 80 and
			event.y < stageClear2.y + 80 and event.y > stageClear2.y - 80 then
				stage2.width = 195
				stage2.height = 112
				stageClear2.width = 195
				stageClear2.height = 112
			else
				stage2.width = 176
				stage2.height = 93
				stageClear2.width = 176
				stageClear2.height = 93
			end

			if event.x < stage3.x + 80 and event.x > stage3.x - 80 and
			event.y < stage3.y + 80 and event.y > stage3.y - 80 and 
			event.x < stageClear3.x + 80 and event.x > stageClear3.x - 80 and
			event.y < stageClear3.y + 80 and event.y > stageClear3.y - 80 then
				stage3.width = 195
				stage3.height = 112
				stageClear3.width = 195
				stageClear3.height = 112
			else
				stage3.width = 176
				stage3.height = 93
				stageClear3.width = 176
				stageClear3.height = 93
			end

			if event.x < stage4.x + 80 and event.x > stage4.x - 80 and
			event.y < stage4.y + 80 and event.y > stage4.y - 80 and 
			event.x < stageClear4.x + 80 and event.x > stageClear4.x - 80 and
			event.y < stageClear4.y + 80 and event.y > stageClear4.y - 80 then
				stage4.width = 195
				stage4.height = 112
				stageClear4.width = 195
				stageClear4.height = 112
			else
				stage4.width = 176
				stage4.height = 93
				stageClear4.width = 176
				stageClear4.height = 93
			end

			if event.x < stage5.x + 80 and event.x > stage5.x - 80 and
			event.y < stage5.y + 80 and event.y > stage5.y - 80 and 
			event.x < stageClear5.x + 80 and event.x > stageClear5.x - 80 and
			event.y < stageClear5.y + 80 and event.y > stageClear5.y - 80 then
				stage5.width = 195
				stage5.height = 112
				stageClear5.width = 195
				stageClear5.height = 112
			else
				stage5.width = 176
				stage5.height = 93
				stageClear5.width = 176
				stageClear5.height = 93
			end

			if event.x < stage6.x + 80 and event.x > stage6.x - 80 and
			event.y < stage6.y + 80 and event.y > stage6.y - 80 and 
			event.x < stageClear6.x + 80 and event.x > stageClear6.x - 80 and
			event.y < stageClear6.y + 80 and event.y > stageClear6.y - 80 then
				stage6.width = 195
				stage6.height = 112
				stageClear6.width = 195
				stageClear6.height = 112
			else
				stage6.width = 176
				stage6.height = 93
				stageClear6.width = 176
				stageClear6.height = 93
			end

			if event.x < treasure.x + 80 and event.x > treasure.x - 80 and
			event.y < treasure.y + 80 and event.y > treasure.y - 80 and 
			event.x < treasureClear.x + 80 and event.x > treasureClear.x - 80 and
			event.y < treasureClear.y + 80 and event.y > treasureClear.y - 80 then
				treasure.width = 217
				treasure.height = 183
				treasureClear.width = 217
				treasureClear.height = 183
			else
				treasure.width = 198
				treasure.height = 164
				treasureClear.width = 198
				treasureClear.height = 164
			end
		end
	end
	Runtime:addEventListener("mouse", mouseOver)

	loadScores()
	table.insert(scoresTable, composer.getVariable("clear1"))
	table.insert(scoresTable, composer.getVariable("clear2"))
	table.insert(scoresTable, composer.getVariable("clear3"))
	table.insert(scoresTable, composer.getVariable("clear4"))
	table.insert(scoresTable, composer.getVariable("clear5"))
	table.insert(scoresTable, composer.getVariable("clear6"))
	table.insert(scoresTable, composer.getVariable("clear7"))

	local n = table.maxn(scoresTable)
	print(n)
	saveScores()

	local function one(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage1")
	end

	local function two(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage2")
	end

	local function three(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage3")
	end

	local function four(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage4")
	end

	local function five(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage5")
	end

	local function six(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage6")
	end

	local function seven(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("stage7")
	end

	local function gotoending(event)
		composer.removeScene("map")
		audio.stop(1)
		composer.gotoScene("ending_1")
	end

	if n == 1 then
		cage:addEventListener("tap", one)
	elseif n <= 2 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stageClear1.isVisible = true
	elseif n <= 3 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stage2:addEventListener("tap", three)
		stageClear1.isVisible = true
		stageClear2.isVisible = true
	elseif n <= 4 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stage2:addEventListener("tap", three)
		stage3:addEventListener("tap", four)
		stageClear1.isVisible = true
		stageClear2.isVisible = true
		stageClear3.isVisible = true
	elseif n <= 5 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stage2:addEventListener("tap", three)
		stage3:addEventListener("tap", four)
		stage4:addEventListener("tap", five)	
		stageClear1.isVisible = true
		stageClear2.isVisible = true
		stageClear3.isVisible = true
		stageClear4.isVisible = true
	elseif n <= 6 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stage2:addEventListener("tap", three)
		stage3:addEventListener("tap", four)
		stage4:addEventListener("tap", five)
		stage5:addEventListener("tap", six)	
		stageClear1.isVisible = true
		stageClear2.isVisible = true
		stageClear3.isVisible = true
		stageClear4.isVisible = true
		stageClear5.isVisible = true
	elseif n <= 8 then
		cage:addEventListener("tap", one)
		stage1:addEventListener("tap", two)
		stage2:addEventListener("tap", three)
		stage3:addEventListener("tap", four)
		stage4:addEventListener("tap", five)
		stage5:addEventListener("tap", six)
		stage6:addEventListener("tap", seven)	
		treasure:addEventListener("tap", gotoending)
		stageClear1.isVisible = true
		stageClear2.isVisible = true
		stageClear3.isVisible = true
		stageClear4.isVisible = true
		stageClear5.isVisible = true
		stageClear6.isVisible = true
		treasureClear.isVisible = true
	end

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
			local op = {
			loops = - 1
		}
		audio.play(backMusic, op)
		audio.setVolume(0.3)
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
		composer.removeScene("map")
		
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