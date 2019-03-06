function loginHandler(username,senha)
	
	local account = getAccount ( username, senha ) -- Return the account
		
		if ( account ~= false ) then -- If the account exists.
			logIn (client, account, senha) -- Log them in.
			
			if (client) then
				--spawnPlayer(client, 1959.55, -1714.46, 17)
				spawnPlayer(client, 10, 10, 5)
				fadeCamera(client, true)
				setCameraTarget(client, client)
				outputChatBox("Bem-vindo ao servidor!!!", client)
				
				--createExplosion ( 1959.55, -1714.46, 30, 6, client)
				--
				carregarAoIniciar(client)
				--DEBUG, Aparece na janela MTA Server como INFO: .... e na parte inferior do jogo
				outputDebugString ("Login Executado")
			end
			
		else
			outputChatBox ("Nome de usuário e senha inválidos. Por favor, tente novamente.", client, 255, 255, 0 ) -- Output they got the details wrong.
		end	
end
-- definir o evento personalizado e permitir que ele seja chamado a partir do cliente usando 'true'
addEvent("submeterLogin",true)
-- adicionar um manipulador de eventos para quando 'submeterLogin' for chamado,
-- chamar também a função 'loginHandler' que está ligada a ele
addEventHandler("submeterLogin",root,loginHandler)