-- criar a função e definir os dois parâmetros do evento: 'button' - botão e state - estado do clique
function requisitarLogin(button,state)
	-- se o botão foi clicado com o botão esquerdo do mouse, e o estado do clique for 'up' (solto)
	if button == "left" and state == "up" then
		-- mudar o foco de entrada de volta para o jogo (permitindo ao jogador se movimentar e abrir o chat)
		guiSetInputEnabled(false)
		-- ocultar a janela e todos os componentes
		guiSetVisible(wdwLogin, false)
		-- desabilitar o cursor do mouse
		showCursor(false)
	end
end

function criarJanelaDeLogin()
	wdwLogin = guiCreateWindow(0.375, 0.375, 0.25, 0.25, "Efetue o Login", true)
	
	-- Criar o primeiro label. Note que o último argumento passado é 'wdwLogin', representando a janela
	-- Ou seja, ele será o elemento pai (parent) deste texto (label)
	-- Assim toda os valores de tamanho serão relativos a esta janela
	guiCreateLabel(0.0391, 0.1979, 0.3672, 0.25, "Usuário:", true, wdwLogin)

	-- Alterar o valor de y, assim o segundo label ficará ligeiramente abaixo do primeiro
	guiCreateLabel(0.0391, 0.5, 0.25, 0.25, "Senha:", true, wdwLogin)

	-- Valores para as entradas
	editUsuario = guiCreateEdit(0.415, 0.2, 0.5, 0.15, "gui", true, wdwLogin)
	editSenha = guiCreateEdit(0.415, 0.5, 0.5, 0.15, "123", true, wdwLogin)

	-- Definir o tamanho máximo de caracteres do nome de usuário e a senha para 50
	guiEditSetMaxLength(editUsuario, 50)
	guiEditSetMaxLength(editSenha, 50)
	--Criar Botao Login
	btnLogin = guiCreateButton(0.65, 0.7, 0.25, 0.2, "Login", true, wdwLogin)
	
	-- Tornar a janela invisível
	guiSetVisible(wdwLogin, false)
	
	-- agora, adicionar o evento onClientGUIClick para o botão que acabamos de criar
	addEventHandler("onClientGUIClick", btnLogin, requisitarLogin, false)
end

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), 
	function ()
		-- Chamando a função para criar a janela de login e seus componentes.
		criarJanelaDeLogin()

		-- Mostrar uma mensagem de boas-vindas ao jogador.
		outputChatBox("Bem-vindo ao meu servidor do MTA:SA, por favor efetue o login.")

		-- Se a GUI foi criada com êxito, então ela será mostrada ao jogador.
		if (wdwLogin ~= nil) then
			guiSetVisible(wdwLogin, true)
		else
			-- Se a GUI não foi criada corretamente, notificaremos o jogador.
			outputChatBox("Um erro inesperado ocorreu e a janela de login não foi criada.")
		end

		-- Habilitar o cursor para o jogador, para que ele possa clicar sobre os componentes.
		showCursor(true)
		-- Definir o foco de entrada para a GUI, permitindo, por exemplo, que os jogadores pressionem 't', sem que o chatbox abra.
		guiSetInputEnabled(true)
	end
)

--Chamar Evento do Lado do Servidor Pelo Cliente
function requisitarLogin(button,state)
	if button == "left" and state == "up" then
		-- obter o texto inserido no campo 'nomeDeUsuario'
		local nomeDeUsuario = guiGetText(editUsuario)
		-- obter o texto inserido no campo 'senha'
		local senha = guiGetText(editSenha)
		-- note que 'editUsuario' e 'editSenha' são variáveis definidas na criação do campo de edição
		
		-- se o nome de usuário e senha existem
		if nomeDeUsuario and senha then
			-- chamar o evento do servidor 'submeterLogin' e passar o nome de usuário e senha nos argumentos
			triggerServerEvent("submeterLogin", getRootElement(), nomeDeUsuario, senha)

			-- ocultar a janela, desabilitar o cursor e desativar foco de entrada
			guiSetInputEnabled(false)
			guiSetVisible(wdwLogin, false)
			showCursor(false)
		else
			-- se o nome de usuário ou senha não existir, sairá uma mensagem para o jogador,
			outputChatBox("Por favor, digite o nome de usuário e senha.", 230, 0, 0)
		end
	end
end