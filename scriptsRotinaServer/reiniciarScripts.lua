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