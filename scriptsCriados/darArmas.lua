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