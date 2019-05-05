	--Example 2 - triggerClientEvent
-- Server 
--Teletransporte de programacao
function portal(thePlayer)
	setElementPosition (thePlayer, 0, 0, 5, false) --Nao reseta a animacao
end
addCommandHandler("ini", portal)


function greetingCommand ( playerSource, commandName )
	local x1,y1,z1 = getElementPosition(playerSource)
	local rx1,ry1,rz1 = getElementRotation(playerSource)
    triggerClientEvent ( playerSource, "receberPosicao", playerSource, x1,y1,z1,rx1,ry1,rz1)
end
addCommandHandler ( "greet", greetingCommand )

function fire ( source )
	if ( isElement( source ) ) and ( getElementType( source ) == "player" ) then
		outputChatBox( "You fired a weapon!", source, 0, 225, 0 )
		local x1,y1,z1 = getElementPosition(source)
		local rx1,ry1,rz1 = getElementRotation(source)
		triggerClientEvent ( source, "receberPosicao", source, x1,y1,z1,rx1,ry1,rz1)
	end
end
addEventHandler( "onWeaponFire", root, fire)