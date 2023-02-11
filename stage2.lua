-----------------------------------------------------------------------------------------
--
-- view2.lua
--
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
	local sceneGroup = self.view

	local physics = require("physics")
	physics.start()
	physics.setGravity(0, 45)
	--physics.setDrawMode("hybrid")

	local background = display.newImage("image/stage1_bg.png")
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	sceneGroup:insert(background)

	local pause = display.newImage("image/pause.png")
	pause.x = display.contentCenterX + 850
	pause.y = display.contentCenterY - 450
	sceneGroup:insert(pause)

	-- animation --
	local sheetOptions =
	{
		width = 150,
		height = 150,
		numFrames = 35
	}
	local sheet = graphics.newImageSheet("image/animation.png", sheetOptions)
	local sequences = {
		-- consecutive frames sequence
		{
			name = "stay",
			start = 1,
			count = 1,
			time = 800,
			loopCount = 0,
			loopDirection = "forward"
		},
		{
			name = "walk_l",
			frames = { 2,3,4,5 },
			time = 400,
			loopCount = 0
		},
		{
			name = "walk_r",
			frames = { 6,7,8,9 },
			time = 400,
			loopCount = 0
		},
		{
			name = "jump_l",
			frames = { 10,11,12,13,14,15,16 },
			time = 1000,
			loopCount = 1
		},
		{
			name = "jump_r",
			frames = { 17,18,19,20,21,22,23 },
			time = 1000,
			loopCount = 1
		},
		{
			name = "jump_stayL",
			frames = { 16 },
			time = 1000,
			loopCount = 1
		},
		{
			name = "jump_stayR",
			frames = { 23 },
			time = 1000,
			loopCount = 1
		},
		{
			name = "push_l",
			frames = { 24,25,26,27,28,29 },
			time = 1000,
			loopCount = 1
		},
		{
			name = "push_r",
			frames = { 30,31,32,33,34,35 },
			time = 1000,
			loopCount = 1
		}
	}

	-- wall --
	local l_wall = display.newRect(display.contentCenterX-960, display.contentCenterY, 3, 1080)
	l_wall:setFillColor(0, 0)
	physics.addBody(l_wall, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(l_wall)
	local r_wall = display.newRect(display.contentCenterX+960, display.contentCenterY, 3, 1080)
	r_wall:setFillColor(0, 0)
	physics.addBody(r_wall, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(r_wall)

	-- ground --
	local ground = display.newImage("image/ground.png")
	ground.x = display.contentCenterX
	ground.y = display.contentCenterY + 500
	sceneGroup:insert(ground)
	local ground_ = display.newRect(ground.x, ground.y-35, ground.width, 5)
	ground_:setFillColor(0, 0)
	ground_.objType = "pf"
	ground_.collType = "passthru"
	physics.addBody(ground_, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(ground_)

	-- platForm --
	local pf1 = display.newImage("image/pf_short.png")
	pf1.x = display.contentCenterX - 600
	pf1.y = display.contentCenterY + 200
	sceneGroup:insert(pf1)
	local pf1_ = display.newRect(pf1.x, pf1.y-30, pf1.width, 5)
	pf1_:setFillColor(0, 0)
	pf1_.objType = "pf"
	pf1_.collType = "passthru"
	physics.addBody(pf1_, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(pf1_)

	local pf2 = display.newImage("image/pf_short.png")
	pf2.x = display.contentCenterX + 400
	pf2.y = display.contentCenterY + 200
	sceneGroup:insert(pf2)
	local pf2_ = display.newRect(pf2.x, pf2.y-30, pf2.width, 5)
	pf2_:setFillColor(0, 0)
	pf2_.objType = "pf"
	pf2_.collType = "passthru"
	physics.addBody(pf2_, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(pf2_)

	local pf4 = display.newImage("image/pf_short.png")
	pf4.x = display.contentCenterX + 510
	pf4.y = display.contentCenterY + 50
	sceneGroup:insert(pf4)
	local pf4_ = display.newRect(pf4.x, pf4.y-30, pf4.width, 5)
	pf4_:setFillColor(0, 0)
	pf4_.objType = "pf"
	pf4_.collType = "passthru"
	physics.addBody(pf4_, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(pf4_)

	local pf3 = display.newImage("image/pf_short.png")
	pf3.x = display.contentCenterX + 600
	pf3.y = display.contentCenterY - 100
	sceneGroup:insert(pf3)
	local pf3_ = display.newRect(pf3.x, pf3.y-30, pf3.width, 5)
	pf3_:setFillColor(0, 0)
	pf3_.objType = "pf"
	pf3_.collType = "passthru"
	physics.addBody(pf3_, "static", { bounce=0.0, friction=0.5 })
	sceneGroup:insert(pf3_)
	
	-- player --
	local player = display.newSprite( sheet, sequences )
	player:setSequence("stay")
	player:play()
	player.x = display.contentCenterX - 750
	player.y = display.contentCenterY + 390
	physics.addBody(player, "dynamic", { density=3.0, friction=0, bounce=0.0 },
	{ box={ halfWidth=73, halfHeight=7, x=0, y=68 }, isSensor=true })
	player.isFixedRotation = true
	player.sensorOverlaps = 0
	sceneGroup:insert(player)

	-- box --
	local box = display.newImage("image/box.png")
	box.x = display.contentCenterX - 200
	box.y = display.contentCenterY + 383
	physics.addBody(box, "dynamic", { density=3.0, friction=0.3, bounce=0.0 })
	box.objType = "pf"
	sceneGroup:insert(box)

	-- memoIcon --
	local memoIcon = display.newImage("image/memo_icon.png")
	memoIcon.x = display.contentCenterX - 530
	memoIcon.y = display.contentCenterY + 395
	physics.addBody(memoIcon, "kinematic", { density=1.0, friction=0.5, isSensor=true})
	sceneGroup:insert(memoIcon)

	-- items --
	local key = display.newImage("image/key.png")
	key.x = display.contentCenterX + 720
	key.y = display.contentCenterY - 210
	physics.addBody(key, "kinematic", { density=1.0, friction=0.5, isSensor=true})
	sceneGroup:insert(key)

	-- gimmicks --
	local opened_door = display.newImage("image/opened_door.png")
	opened_door.x = display.contentCenterX - 700
	opened_door.y = display.contentCenterY + 73
	local door = display.newImage("image/door.png")
	door.x = display.contentCenterX - 700
	door.y = display.contentCenterY + 73
	local door_physics = display.newRect(opened_door.x, opened_door.y, opened_door.width, opened_door.height)
	door_physics:setFillColor(0, 0)
	physics.addBody(door_physics, "kinematic", { density=1.0, friction=0.5, isSensor=true})
	sceneGroup:insert(door)
	sceneGroup:insert(opened_door)
	sceneGroup:insert(door_physics)
	local isDoorOpened = false

	door:toFront()
	player:toFront()
	pause:toFront()

	local ispaused = false

	-- 이동 --
	local last_move = "r"
	local function move( event )
		if (ispaused == false) then
			if ( event.keyName == "right") then
				--transition.moveTo(player, {x=player.x+50, time=50})
				player:setLinearVelocity(600, 100)
				if (player.sensorOverlaps > 0) then
					player:setSequence("walk_r")
					player:play()
				else
					player:setSequence("jump_stayR")
				end
				print("→")
				if ( event.phase == "up" ) then
					player:setLinearVelocity(0, 100)
					if (player.sensorOverlaps > 0) then
						player:setSequence("stay")
					end
					last_move="r"
				end
			elseif ( event.keyName == "left") then
				--transition.moveTo(player, {x=player.x-50, time=50})
				player:setLinearVelocity(-600, 100)
				if (player.sensorOverlaps > 0) then
					player:setSequence("walk_l")
					player:play()
				else
					player:setSequence("jump_stayL")
				end
				print("←")
				if ( event.phase == "up" ) then
					player:setLinearVelocity(0, 100)
					if (player.sensorOverlaps > 0) then
						player:setSequence("stay")
					end
					last_move="l"
				end
			elseif ( event.keyName == "space" and player.sensorOverlaps > 0 ) then
				if (last_move == "l") then
					player:setSequence("jump_l")
				elseif (last_move == "r") then
					player:setSequence("jump_r")
				end
				player:play()
				if (event.phase == "down") then
				--transition.moveTo(player, {y=player.y-300, time=200})
				player:setLinearVelocity(0, -700)
				end
				print("↑")
			end
		end
	end
	Runtime:addEventListener( "key", move )

	-- 발판 통과하기 --
	local function preCollisionEvent( self, event )
 
		local collideObject = event.other
		if ( collideObject.collType == "passthru" ) then
			if self.y  > collideObject.y then
		   		event.contact.isEnabled = false  --disable this specific collision
			end
		end
	end
	player.preCollision = preCollisionEvent
	player:addEventListener( "preCollision" )

	
	local pf_faded = false
	local getKey = false
	local getSeed = false
	-- player 충돌 --
	local function sensorCollide( self, event )
		local collideObject = event.other
		-- 아이템 획득 --
		if ( collideObject == key ) then
			print("getKey")
			display.remove(collideObject)
			display.remove(door)
			isDoorOpened = true
			getKey = true
		end
		if ( collideObject == seed ) then
			print("getSeed")
			display.remove(collideObject)
			transition.moveBy(c_door, {y=-200, time=500})
			getSeed = true
		end
		-- 메모 --
		if ( collideObject == memoIcon ) then
			if ( event.phase == "began" ) then
				print( "memo opened" )
				memo = display.newImage("image/memo2.png")
				memo.x = display.contentCenterX
				memo.y = display.contentCenterY
				sceneGroup:insert(memo)
			elseif ( event.phase == "ended" ) then
				print( "memo closed" )
				display.remove(memo)
			end
		end
		-- 문 들어가기 --
		if ( collideObject == door_physics ) then
			if (isDoorOpened == true) then
				print("gotoDoor")
				ispaused = true
				timer.performWithDelay( 300, function()
					physics.removeBody(pf1_)
					physics.removeBody(pf2_)
					physics.removeBody(pf3_)
					physics.removeBody(pf4_)
					physics.removeBody(player)
					physics.removeBody(memoIcon)
					physics.removeBody(box)
					physics.removeBody(door_physics)
					physics.removeBody(l_wall)
					physics.removeBody(r_wall)
					physics.removeBody(ground_)
					composer.removeScene("stage2")
					composer.gotoScene("stage2_clear")
				end
				)
			end
		end
		-- 발판 감지 --
		-- Confirm that the colliding elements are the foot sensor and a ground object
		if ( event.selfElement == 2 and event.other.objType == "pf" ) then
			
			-- Foot sensor has entered (overlapped) a ground object
			if ( event.phase == "began" ) then
				self.sensorOverlaps = self.sensorOverlaps + 1
			-- Foot sensor has exited a ground object
			elseif ( event.phase == "ended" ) then
				self.sensorOverlaps = self.sensorOverlaps - 1
			end
		end
		-- 사라지는 발판 --
		if ( collideObject == pf7_ ) then
			print("사라지는발판")
			transition.fadeOut(pf7, {time=2000})
			timer.performWithDelay(2000, function() display.remove(pf7_) end)
			pf_faded = true
		end
		-- 상자 밀기 --
		if ( collideObject == box and player.sensorOverlaps > 0) then
			print("push box")
			if (last_move == "r") then
				player:setSequence("push_r")
				player:play()
			elseif (last_move == "l") then
				player:setSequence("push_l")
				player:play()
			end
		end
	end
	-- Associate collision handler function with character
	player.collision = sensorCollide
	player:addEventListener( "collision" )

	-- 메모 열기 (임시) --
	--[[
	local function Memo(event)
		local memo = display.newImage("image/memo.png")
		memo.x = display.contentCenterX
		memo.y = display.contentCenterY
		sceneGroup:insert(memo)
	end
	pause:addEventListener("tap",Memo)
	]]

	function scene:resumeGame()
		print("resumed")
		ispaused = false
	end


	-- 일시정지 --

	local function stop(event)
		local pauseBG = display.newImage("image/pause1-2.png")
		pauseBG.x = display.contentCenterX
		pauseBG.y = display.contentCenterY
		sceneGroup:insert(pauseBG)

		local gotoGame = display.newImage("image/gotoGame.png")
		gotoGame.x = display.contentCenterX
		gotoGame.y = display.contentCenterY + 22
		sceneGroup:insert(gotoGame)

		local gotoMap = display.newImage("image/gotoMap.png")
		gotoMap.x = display.contentCenterX
		gotoMap.y = display.contentCenterY + 128
		sceneGroup:insert(gotoMap)

		local close = display.newImage("image/close.png")
		close.x = display.contentCenterX + 335
		close.y = display.contentCenterY - 120
		sceneGroup:insert(close)
		
		local function backToGame(event)
			display.remove(pauseBG)
			display.remove(gotoGame)
			display.remove(gotoMap)
			display.remove(close)
		end
		
		local function backToMap(event)
			physics.removeBody(pf1_)
					physics.removeBody(pf2_)
					physics.removeBody(pf3_)
					physics.removeBody(pf4_)
					if (getKey == false) then
						physics.removeBody(key)
					end
					physics.removeBody(memoIcon)
					physics.removeBody(box)
					physics.removeBody(door_physics)
					physics.removeBody(l_wall)
					physics.removeBody(r_wall)
					physics.removeBody(ground_)
			composer.removeScene("stage2")
			composer.gotoScene("map")
		end

		gotoGame:addEventListener("tap", backToGame)
		gotoMap:addEventListener("tap", backToMap)
		close:addEventListener("tap", backToGame)
	end
	pause:addEventListener("tap", stop)

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
