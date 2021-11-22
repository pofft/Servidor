function addClothePlayer (player,global,clothe,numeroRoupa, texture)
	if verificArguments(clothe,numeroRoupa,texture) then 
    if not Textures[getElementModel(player)] then  return end	
      checkChote = clothe == "camisa" or clothe == "perna" or clothe ==  "sapato",
        if global then 
          sendTo = getElementsByType("player")
        else
          sendTo = player
        end
			if checkClothe then 			
				local atualPartePele = LoadChothe(getAccountID(getPlayerAccount(player)) or "N/A")[partePele[clothe]]        
				triggerClientEvent(sendTo, "addChotheShader",player,partePele[clothe],atualPartePele[1], numeroRoupa)
				triggerClientEvent(sendTo, "addChotheShader",player, clothe,numeroRoupa, texture )
			else
				triggerClientEvent(sendTo, "addChotheShader",player, clothe,numeroRoupa, texture )
			end
	end
end


function returnChothePlayer(player,clothe,numeroRoupa, texture )
	if verificArguments(clothe,numeroRoupa,texture) then
	if not Textures[getElementModel(player)] then  return end
		triggerClientEvent(root, "addChotheShader",player, clothe,numeroRoupa, texture )
	end
end


function AplicChothePlayers(playerlogin,player,clothe,numeroRoupa, texture )
	if verificArguments(clothe,numeroRoupa,texture) then
		if not Textures[getElementModel( player)] then  return end
		triggerClientEvent(playerlogin, "addChotheShader",player, clothe,numeroRoupa, texture )
	end
end


executeSQLQuery ('CREATE TABLE IF NOT EXISTS chotheSystem(ID, Chothes)')
function Savechothe( id, theTable )
    local Results = executeSQLQuery("SELECT Chothes FROM `chotheSystem` WHERE ID=?", id )  
     if ( type ( Results ) == "table" and #Results == 0 or not Results ) then 
		executeSQLQuery ( "INSERT INTO `chotheSystem` ( ID, Chothes ) VALUES(?, ?)",id , toJSON ( theTable ) )
    else
        executeSQLQuery('UPDATE `chotheSystem` SET Chothes =? WHERE ID =?',toJSON ( theTable ),id )
    end 
end

function LoadChothe ( id )
	local aRow = executeSQLQuery( "SELECT Chothes FROM `chotheSystem` WHERE ID=?",id )
	if ( type ( aRow ) == "table" and #aRow == 0 ) or not aRow then return false end	
	return fromJSON ( aRow [1] [ "Chothes" ] )
end

addEventHandler( "onPlayerLogin", getRootElement(),function () 
		if not LoadChothe(getElementData(source,"ID")or "N/A") then 
		Savechothe(getAccountID(getPlayerAccount(player)or "N/A",defaultClothes[1])
		end
		setTimer( function (player) 
			for i,v in pairs (LoadChothe(getAccountID(getPlayerAccount(player)or "N/A")) do
				returnChothePlayer(player,i,v[1],v[2])
			end
		end,5000,1,source)
	for _, players in ipairs(getElementsByType("player")) do 
		if not  isGuestAccount( getPlayerAccount( players )) then
			if getAccountID(getPlayerAccount(player) or "N/A" then 
				if getElementModel(players ) == 7 or getElementModel( players ) == 10 then 
					for i,chothes in pairs(LoadChothe(getAccountID(getPlayerAccount(player)or "N/A")) do 
						AplicChothePlayers(source,players,i,chothes[1],chothes[2])
					end	
				end			
			end
		end
	end
end)


peles = {"pele","face","pe","pernaparte"}

function changerPele(player,numero)
	if player and numero then 
		local numero = tonumber(numero)
		for i=1,4 do 
		addClothePlayer(player,true,peles[i],numero,1)
		end
	end
end
addCommandHandler( "mascara",function (thePlayer,commandName,NumeroMascara,NTextura)
	if NumeroMascara then 
		local NumeroMascara = tonumber(NumeroMascara)
		local NTextura = tonumber(NTextura)
		if type(NumeroMascara) == "number" then
			if NumeroMascara == 0 then
				local RoupaAtual = LoadChothe(getAccountID(getPlayerAccount(thePlayer)or "N/A")
				RoupaAtual["mascara"] = {NumeroMascara,1}
				Savechothe(getAccountID(getPlayerAccount(thePlayer)or "N/A",RoupaAtual)
				addClothePlayer(thePlayer,true,"mascara",NumeroMascara,1)
			elseif  NumeroMascara >= 0 and NumeroMascara <= #Textures[getElementModel(thePlayer)]["mascara"] then 
				if NTextura  and type(NTextura) == "number" then 
					if NTextura >= 1 and NTextura <= #Textures[getElementModel(thePlayer)]["mascara"][NumeroMascara] then
						local RoupaAtual = LoadChothe(getAccountID(getPlayerAccount(thePlayer)or "N/A")
						RoupaAtual["mascara"] = {NumeroMascara,NTextura}
						Savechothe(getAccountID(getPlayerAccount(thePlayer)or "N/A",RoupaAtual)
						addClothePlayer(thePlayer,true,"mascara",NumeroMascara,NTextura)
					else 
						outputChatBox("a Mascara "..NumeroMascara.." possui apenas "..#Textures[getElementModel(thePlayer)]["mascara"][NumeroMascara].." cores, de 1 a "..#Textures[getElementModel(thePlayer)]["mascara"][NumeroMascara].." !",thePlayer,255,255,255)
					end
				else
					outputChatBox("adicione o numero da cor da mascara que deseja adicionar!",thePlayer,255,255,255)
				end
			end
		else
			outputChatBox("Use o comando /"..commandName.." [0 a "..#Textures[getElementModel(thePlayer)]["mascara"].. "] [Numero da Cor] !",thePlayer,255,255,255)
		end
	end
end)


function removeShaderFromPlayer ()	
	triggerClientEvent(getElementsByType("player"),"RemoverShaderPlayer",source)
end
addEventHandler( "onPlayerQuit", getRootElement(),removeShaderFromPlayer)