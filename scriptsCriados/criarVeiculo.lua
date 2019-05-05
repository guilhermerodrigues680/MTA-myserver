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