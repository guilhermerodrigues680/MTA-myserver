--Coordenadas de origem:
local xo = 2886.5625
local yo = -1571.4733
local zo = 10.4434
--Coordenadas de Destino:
local xd = 2878.6829
local yd = -1591.8660
local zd = 22.1504

--Criar marca de origem
local marcaOrigem = createMarker(xo, yo, zo - 1,"cylinder")
local marcaDestino = createMarker(xd, yd, zd - 1,"cylinder")

function teleportarDestino ( hitPlayer, matchingDimension )
    outputDebugString (getPedOccupiedVehicle(hitPlayer))
    if getPedOccupiedVehicle(hitPlayer) == false then
        outputChatBox ( getPlayerName(hitPlayer) .. " entrou no teleport do Michael" )
        setElementPosition (hitPlayer, xd + 5, yd, zd, false) --Nao reseta a animacao
    else
        outputChatBox ("O Teleport só funciona para jogadores")
        local carroJogador = getPedOccupiedVehicle(hitPlayer)
        setVehicleColor(carroJogador,math.ceil(math.random()*255),
        math.ceil(math.random()*255),
        math.ceil(math.random()*255)) --Muda o carro para rosa

    end
end
addEventHandler ("onMarkerHit", marcaOrigem, teleportarDestino )

--Teletransporte de programacao
function portal(thePlayer)
	setElementPosition (thePlayer, (xo+5), (yo+5), zo, false) --Nao reseta a animacao
end
addCommandHandler("beta", portal)