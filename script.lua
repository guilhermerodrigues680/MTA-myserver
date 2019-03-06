--[[
--Teleport ao Iniciar o jogo
local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 17
function joinHandler()
	spawnPlayer(source, spawnX, spawnY, spawnZ)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Bem-vindo meu mozao!!!!", source)
	--
	carregarAoIniciar(source)
end
]]--
function carregarAoIniciar(jogador)
	p = blip createBlip(2000, -1442.5, 13.0)
	outputChatBox("Blip criado", jogador)
end
--addEventHandler("onPlayerJoin", getRootElement(), joinHandler)


--Criar Armamento - /arma
function armamento(playerSource)
	giveWeapon ( playerSource, 1, 1)-- Brassknuckle
	giveWeapon ( playerSource, 4, 1)--Knife
	giveWeapon ( playerSource, 24, 9999) -- Deagle
	giveWeapon ( playerSource, 26, 9999) -- Sawed-off 
	giveWeapon ( playerSource, 29, 9999) -- MP5
	giveWeapon ( playerSource, 31, 9999, true) -- M4
	giveWeapon ( playerSource, 34, 9999) -- Sniper
	giveWeapon ( playerSource, 36, 9999) -- Rocket Launcher HS
	giveWeapon ( playerSource, 16, 9999)-- Grenade
	giveWeapon ( playerSource, 42, 9999)-- Fire Extinguisher
	giveWeapon ( playerSource, 10, 1)--Dildo
	giveWeapon ( playerSource, 46, 1)--Parachute
	outputConsole ("Armas adicionadas! ", hitElement )
end
addCommandHandler("arma", armamento)

--[[ Skills to upgrade: Maximo tudo - /maxvida
24 = Max Player Health
69 = Weapon Type Pistol Skill
70 = Weapon Type Pistol Silenced Skill
71 = Weapon Type Desert Eagle Skill
72 = Weapon Type Shotgun Skill
73 = Weapon Type Sawn off Shotgun Skill
74 = Weapon Type Spas 12 Shotgun Skill
76 = Weapon Type MP5 Skill
77 = Weapon Type AK47 Skill
78 = Weapon Type M4 Skill
79 = Weapon Type Sniper Rifle Skill --]]

function maxVida(thePlayer)
   -- Set every stat to 1000 (the maximum value)
   for i, stat in ipairs({ 24, 69, 70, 71, 72, 73, 74, 76, 77, 78, 79 }) do
      setPedStat(thePlayer, stat, 1000)
      outputChatBox("Your game stats upgraded to maximum!", thePlayer, 0, 0, 255, false)
   end
    -- Set player health to the maximum, as changing the stat keeps the current one
	--[[
    if (isPedDead (thePlayer) ~= true) then
		setElementHealth(thePlayer, 100 + (getPedStat(ped, 24) - 569) / 4.31 return math.max(1, maxhealth))
		-- Tell the player what we did
		outputChatBox("And your health upgraded to maximum!", thePlayer, 0, 255, 0, false)
    else
		outputChatBox("Your health can't be restored because you are already dead!", thePlayer, 0, 255, 0, false)
	end
	--]]
	setElementHealth ( thePlayer, 1000)
	setPedArmor (thePlayer, 100 )    -- Set player's armor to 100
	outputChatBox("Your Armor upgraded to maximum!", thePlayer, 0, 255, 0, false)
end
addCommandHandler("maxvida", maxVida)

--Renascer apos o jogador ter sido morto
function renascer ()
	outputChatBox("Voce foi morto hahahaha! Em 2 segundos estara curado.",source)
	setTimer( spawnPlayer, 2000, 1, source, 2030, -1419, 19 ) --Apos 2000ms renasce no hospital
	--Funcoes
	setTimer(armamento, 2500, 1, source)
	setTimer(maxVida, 3000, 1, source)
	setTimer(setPedArmor, 3000, 1, source, 100)
	setTimer(outputChatBox, 3000, 1, "Seu colete e armas estao de volta!", source)
end
addEventHandler( "onPlayerWasted", getRootElement( ), renascer)

-- when a player spawns,
function player_Spawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
	-- play a frontend sound for him
	playSoundFrontEnd ( source, 1 )
	armamento(source)
	setPedArmor(source,100)
end
addEventHandler ( "onPlayerSpawn", getRootElement(), player_Spawn )

--------------------------------------------------------------------

--Comando para reiniciar servidor - /res [acao]
function reiniciarMyServer(thePlayer, command, acao)
	clearChatBox()
	acao = tonumber(acao)
	if (acao == 0) then
		outputChatBox("Reiniciando Resource",thePlayer,0,255,0,false)
		res = getResourceFromName("myserver")
		restartResource(res)
	elseif (acao == 1) then
		outputChatBox("Rodando Funcao CarregarAoIniciar",thePlayer,0,255,0,false)
		carregarAoIniciar(source)
	else
		outputChatBox("Não foi possível reiniciar. A sintaxe é: /res [acao]",thePlayer,0,255,0,false)
	end
end
addCommandHandler("res", reiniciarMyServer)



--Comando Criar Veiculo - /cv [id]
function createVehicleForPlayer(thePlayer, command, vehicleModel)
	local x,y,z = getElementPosition(thePlayer) -- retorna a posição do jogador
	x = x + 5 -- adiciona 5 unidades na variável x
	local createdVehicle = createVehicle(tonumber(vehicleModel),x,y,z)
	-- verifica se o retorno foi falso
	if (createdVehicle == false) then
		-- Se sim, retorne uma mensagem de erro somente para o jogador
		outputChatBox("Não foi possível criar o veículo. A sintaxe é: /criarveiculo [id]",thePlayer)
	end
end
addCommandHandler("cv", createVehicleForPlayer)

--Comando criar veiculo tunado na marca
local vehMark = createMarker(2000, -1442.5, 13.0,"cylinder")

function vehicleSpawner(hitElement,matchingDimension)
	if getElementType(hitElement) == "player" then
		if getPedOccupiedVehicle(hitElement) == false then
		local x,y,z = getElementPosition(hitElement)
			local theVehicle = createVehicle(411, x,y,z) --Trem = 538, buggy= 568
			warpPedIntoVehicle(hitElement,theVehicle)
            -- add the requested upgrade to the vehicle
            local success = addVehicleUpgrade ( theVehicle, 1080 )
            -- inform the player of whether the upgrade was added successfully
            if ( success ) then
                outputConsole ( 1080 .. " upgrade added.", hitElement )
            else
                outputConsole ( "Failed to add upgrade.", hitElement )
            end
			
			if getElementModel(theVehicle) == 411 then -------------- vehicle Id 411 infernus
				setVehicleHandling (theVehicle, "mass", 300.0)
				setVehicleHandling(theVehicle, "turnMass", 200)
				setVehicleHandling(theVehicle, "dragCoeff", 4.0 )
				setVehicleHandling(theVehicle, "centerOfMass", { 0.0,0.08,-0.09 } )
				setVehicleHandling(theVehicle, "percentSubmerged", 103)
				setVehicleHandling(theVehicle, "tractionMultiplier", 1.8)
				setVehicleHandling(theVehicle, "tractionLoss", 1.0)
				setVehicleHandling(theVehicle, "tractionBias", 0.48)
				setVehicleHandling(theVehicle, "numberOfGears", 5)
				setVehicleHandling(theVehicle, "maxVelocity", 300.0)
				setVehicleHandling(theVehicle, "engineAcceleration", 90.0 )
				setVehicleHandling(theVehicle, "engineInertia", 5.0)
				setVehicleHandling(theVehicle, "driveType", "rwd")
				setVehicleHandling(theVehicle, "engineType", "petrol")
				setVehicleHandling(theVehicle, "brakeDeceleration", 20.0)
				setVehicleHandling(theVehicle, "brakeBias", 0.60)
				-----abs----
				setVehicleHandling(theVehicle, "steeringLock",  35.0 )
				setVehicleHandling(theVehicle, "suspensionForceLevel", 0.85)
				setVehicleHandling(theVehicle, "suspensionDamping", 0.15 )
				setVehicleHandling(theVehicle, "suspensionHighSpeedDamping", 0.0)
				setVehicleHandling(theVehicle, "suspensionUpperLimit", 0.15 ) -- 0.15
				setVehicleHandling(theVehicle, "suspensionLowerLimit", -0.16) -- -0.16
				setVehicleHandling(theVehicle, "suspensionFrontRearBias", 0.5 )
				setVehicleHandling(theVehicle, "suspensionAntiDiveMultiplier", 0.0)
				setVehicleHandling(theVehicle, "seatOffsetDistance", 0.0)
				setVehicleHandling(theVehicle, "collisionDamageMultiplier", 0.00)
				setVehicleHandling(theVehicle, "monetary",  10000)
				setVehicleHandling(theVehicle, "modelFlags", 1002000)
				setVehicleHandling(theVehicle, "handlingFlags", 1000002)
				setVehicleHandling(theVehicle, "headLight", 3)
				setVehicleHandling(theVehicle, "tailLight", 2)
				setVehicleHandling(theVehicle, "animGroup", 4)
			end
			
		end
	end 
end 
addEventHandler("onMarkerHit",vehMark,vehicleSpawner)

--Teletransport
function teleport(thePlayer)
	--spawnPlayer (thePlayer, -1390.1387, 2638.3479, 1000, 90.0, 0 ) -- {-1390.1387,2638.3479,55.9844}
	giveWeapon (thePlayer, 46, 1, true) --Paraquedas
	setElementPosition (thePlayer, -1390.1387, 2638.3479, 600, false) --Nao reseta a animacao
end
addCommandHandler("tele", teleport)
