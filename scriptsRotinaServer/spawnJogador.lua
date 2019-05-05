-- when a player spawns, (Quando o jogador e encaixado no jogo)
function player_Spawn ( posX, posY, posZ, spawnRotation, theTeam, theSkin, theInterior, theDimension )
	playSoundFrontEnd ( source, 1 ) --Toca um beep ao iniciar o jogo
	armamento(source) --funcao do Srcipt darArmas.lua
	setPedArmor(source,100)
end
addEventHandler ( "onPlayerSpawn", getRootElement(), player_Spawn )