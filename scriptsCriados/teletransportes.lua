--Teletransporte
function teleport(thePlayer)
	--spawnPlayer (thePlayer, -1390.1387, 2638.3479, 1000, 90.0, 0 ) -- {-1390.1387,2638.3479,55.9844}
	giveWeapon (thePlayer, 46, 1, true) --Paraquedas
	setElementPosition (thePlayer, -1390.1387, 2638.3479, 600, false) --Nao reseta a animacao
end
addCommandHandler("tele", teleport)