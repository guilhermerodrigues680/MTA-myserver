--Teleport ao Iniciar o jogo
local spawnX, spawnY, spawnZ = 1959.55, -1714.46, 17
function joinHandler()
	spawnPlayer(source, spawnX, spawnY, spawnZ)
	fadeCamera(source, true)
	setCameraTarget(source, source)
	outputChatBox("Bem-vindo!!!!", source)
	--
	carregarAoIniciar(source)
end
function carregarAoIniciar(jogador)
	p = blip createBlip(2000, -1442.5, 13.0)
	outputChatBox("Blip criado", jogador)
end
addEventHandler("onPlayerJoin", getRootElement(), joinHandler)