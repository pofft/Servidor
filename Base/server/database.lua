<<<<<<< HEAD
executeSQLQuery ('CREATE TABLE IF NOT EXISTS data(id Integer,dataPlayer)')

initialData  = {
    kills = 0,
    death = 0,
    wins = 0,
    defeats = 0,
    skinsWeapons = {},
    skinsChothes = {},        
}

function saveAllData()
    if isGuestAccount(getPlayerAccount(source)) then return end
    id = getAccountID(getPlayerAccount(source))
    data = checkDataPlayer(source)
    local Results = executeSQLQuery("SELECT dataPlayer FROM `data` WHERE id=?", id )
    if ( type ( Results ) == "table" and #Results == 0 or not Results ) then 
		executeSQLQuery ( "INSERT INTO `data` ( id,dataPlayer) VALUES(?,?)",tonumber(id),toJSON(data))
    else
        executeSQLQuery('UPDATE `data` SET dataPlayer =? WHERE ID =?',toJSON(data),id )
    end 
    if playersData[source] then 
        playersData[source] = {}
        playersData[source] = nil
    end
    triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
end
addEventHandler("onPlayerQuit", root ,saveAllData)


function loadAllDataPlayer ( accountPlayer )
    id = getAccountID(accountPlayer)
	local aRow = executeSQLQuery( "SELECT dataPlayer FROM `data` WHERE ID=?",id )
	if ( type ( aRow ) == "table" and #aRow == 0 ) or not aRow then return false end	
	return fromJSON ( aRow [1] [ "dataPlayer" ] )
end



function addPlayerDataList (_,playerAccount,updateDataClient)
    elementPlayer = getAccountPlayer(playerAccount)
    if not elementPlayer then return end
        if not playersData[elementPlayer] and elementPlayer then 
            playersData[elementPlayer] = {}
        end
        dataPlayer = loadAllDataPlayer(playerAccount)
        if dataPlayer then 
            playersData[elementPlayer] = dataPlayer        
        else 
            playersData[elementPlayer] = initialData        
        end
        if updateDataClient ~= "resourceStart" then 
            triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
        end
end
addEventHandler("onPlayerLogin",root,addPlayerDataList)


function saveAllDataStopResource(player)
    id = getAccountID(getPlayerAccount(player))
    data = checkDataPlayer(player)
    local Results = executeSQLQuery("SELECT dataPlayer FROM `data` WHERE id=?", id )
    if ( type ( Results ) == "table" and #Results == 0 or not Results ) then 
		executeSQLQuery ( "INSERT INTO `data` ( id,dataPlayer) VALUES(?,?)",tonumber(id),toJSON(data))
    else
        executeSQLQuery('UPDATE `data` SET dataPlayer =? WHERE ID =?',toJSON(data),id )
    end 
    if playersData[source] then 
        playersData[source] = {}
    end
end
function saveAllPlayerDataResourceStop () 
    for i,v in pairs(playersData) do 
        if not isGuestAccount(getPlayerAccount(i)) then 
            saveAllDataStopResource(i)
        end
    end
end
addEventHandler("onResourceStop",getRootElement(getThisResource()),saveAllPlayerDataResourceStop)

function checkDataPlayer (player)
    for i,v in pairs (playersData) do         
        if i == player then 
            return v
        end
    end
    return false
end
addCommandHandler("checkdata",checkDataPlayer,false,false)
function updateDataPlayer (player,data,value) 
    if playersData[player]then 
        playersData[player][data] = value
        triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
        return true
    end
    return false
end
=======
executeSQLQuery ('CREATE TABLE IF NOT EXISTS data(id Integer,dataPlayer)')

initialData  = {
    kills = 0,
    death = 0,
    wins = 0,
    defeats = 0,
    skinsWeapons = {},
    skinsChothes = {},        
}

function saveAllData()
    if isGuestAccount(getPlayerAccount(source)) then return end
    id = getAccountID(getPlayerAccount(source))
    data = checkDataPlayer(source)
    local Results = executeSQLQuery("SELECT dataPlayer FROM `data` WHERE id=?", id )
    if ( type ( Results ) == "table" and #Results == 0 or not Results ) then 
		executeSQLQuery ( "INSERT INTO `data` ( id,dataPlayer) VALUES(?,?)",tonumber(id),toJSON(data))
    else
        executeSQLQuery('UPDATE `data` SET dataPlayer =? WHERE ID =?',toJSON(data),id )
    end 
    if playersData[source] then 
        playersData[source] = {}
        playersData[source] = nil
    end
    triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
end
addEventHandler("onPlayerQuit", root ,saveAllData)


function loadAllDataPlayer ( accountPlayer )
    id = getAccountID(accountPlayer)
	local aRow = executeSQLQuery( "SELECT dataPlayer FROM `data` WHERE ID=?",id )
	if ( type ( aRow ) == "table" and #aRow == 0 ) or not aRow then return false end	
	return fromJSON ( aRow [1] [ "dataPlayer" ] )
end



function addPlayerDataList (_,playerAccount,updateDataClient)
    elementPlayer = getAccountPlayer(playerAccount)
    if not elementPlayer then return end
        if not playersData[elementPlayer] and elementPlayer then 
            playersData[elementPlayer] = {}
        end
        dataPlayer = loadAllDataPlayer(playerAccount)
        if dataPlayer then 
            playersData[elementPlayer] = dataPlayer        
        else 
            playersData[elementPlayer] = initialData        
        end
        if updateDataClient ~= "resourceStart" then 
            triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
        end
end
addEventHandler("onPlayerLogin",root,addPlayerDataList)


function saveAllDataStopResource(player)
    id = getAccountID(getPlayerAccount(player))
    data = checkDataPlayer(player)
    local Results = executeSQLQuery("SELECT dataPlayer FROM `data` WHERE id=?", id )
    if ( type ( Results ) == "table" and #Results == 0 or not Results ) then 
		executeSQLQuery ( "INSERT INTO `data` ( id,dataPlayer) VALUES(?,?)",tonumber(id),toJSON(data))
    else
        executeSQLQuery('UPDATE `data` SET dataPlayer =? WHERE ID =?',toJSON(data),id )
    end 
    if playersData[source] then 
        playersData[source] = {}
    end
end
function saveAllPlayerDataResourceStop () 
    for i,v in pairs(playersData) do 
        if not isGuestAccount(getPlayerAccount(i)) then 
            saveAllDataStopResource(i)
        end
    end
end
addEventHandler("onResourceStop",getRootElement(getThisResource()),saveAllPlayerDataResourceStop)

function checkDataPlayer (player)
    for i,v in pairs (playersData) do         
        if i == player then 
            return v
        end
    end
    return false
end
addCommandHandler("checkdata",checkDataPlayer,false,false)
function updateDataPlayer (player,data,value) 
    if playersData[player]then 
        playersData[player][data] = value
        triggerClientEvent(root,"updatePlayersData",resourceRoot,playersData)
        return true
    end
    return false
end
>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
