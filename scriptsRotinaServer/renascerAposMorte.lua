--Renascer apos o jogador ter sido morto
function renascer ()
	outputChatBox("Voce foi morto hahahaha! Em 2 segundos estara curado.",source)
	setTimer( spawnPlayer, 2000, 1, source, 2030, -1419, 19 ) --Apos 2000ms renasce no hospital
	--Funcoes
	setTimer(armamento, 2500, 1, source) --funcao do Srcipt darArmas.lua
	setTimer(maxVida, 3000, 1, source) --funcao do Script atualizarStatus.lua
	--setTimer(setPedArmor, 3000, 1, source, 100)
	setTimer(outputChatBox, 3000, 1, "Seu colete e armas estao de volta!", source)
end
addEventHandler( "onPlayerWasted", getRootElement( ), renascer)