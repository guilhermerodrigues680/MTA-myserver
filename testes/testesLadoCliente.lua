-- Client 
local x,y,z = 0,0,2

local pessoa = createPed(1,x, y, z)
local blip = createBlip(x,y,z)
attachElements(blip,pessoa)

--local veiculo = createVehicle(411,x+3, y, z + 10)
--warpPedIntoVehicle(pessoa, veiculo)
--setPedControlState(pessoa, "accelerate", true)
--setPedControlState(pessoa, "vehicle_left", true)

--
--triggerServerEvent("passarPosicaoPed", getRootElement(), nomeDeUsuario, senha)

function calculaPosicaoPed ( x,y,z,rx,ry,rz )
    outputChatBox ( "The server says: ")
    outputChatBox ( "X: " .. x )
    outputChatBox ( "Y: " .. y )
    outputChatBox ( "Z: " .. z )
    outputChatBox ( "RX: " .. rx )
    outputChatBox ( "RY: " .. ry )
    outputChatBox ( "RZ: " .. rz )
    setElementPosition (pessoa, (x+2), y, z, false)
    setElementRotation(pessoa,rx,ry,rz,"default",true)
end
addEvent( "receberPosicao", true )
addEventHandler( "receberPosicao", localPlayer, calculaPosicaoPed )