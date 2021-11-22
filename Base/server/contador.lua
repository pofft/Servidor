<<<<<<< HEAD


function killPlayerEvent(_,killer)
    if isElement (killer) and getElementType(killer) == "player" then 
            dataKiller = checkDataPlayer (killer)
            atualDataKiller = dataKiller["kills"] + 1
        if updateDataPlayer(killer,"kills",atualDataKiller) then 
        else 
            outputDebugString("error,Sistema de Contador Assassino")
        end
            dataVictim = checkDataPlayer (source)
            atualDataVictim = dataVictim["death"] + 1
        if updateDataPlayer(source,"death",atualDataVictim) then 
        else 
            outputDebugString("error,Sistema de Contador Vitima")
        end
    else    
        dataVictim = checkDataPlayer (source)
        atualDataVictim = dataVictim["death"] + 1
        if updateDataPlayer(source,"death",atualDataVictim) then 
        else 
            outputDebugString("error,Sistema de Contador Vitima")
        end

    end
end

addEventHandler("onPlayerWasted",root,killPlayerEvent)

=======


function killPlayerEvent(_,killer)
    if isElement (killer) and getElementType(killer) == "player" then 
            dataKiller = checkDataPlayer (killer)
            atualDataKiller = dataKiller["kills"] + 1
        if updateDataPlayer(killer,"kills",atualDataKiller) then 
        else 
            outputDebugString("error,Sistema de Contador Assassino")
        end
            dataVictim = checkDataPlayer (source)
            atualDataVictim = dataVictim["death"] + 1
        if updateDataPlayer(source,"death",atualDataVictim) then 
        else 
            outputDebugString("error,Sistema de Contador Vitima")
        end
    else    
        dataVictim = checkDataPlayer (source)
        atualDataVictim = dataVictim["death"] + 1
        if updateDataPlayer(source,"death",atualDataVictim) then 
        else 
            outputDebugString("error,Sistema de Contador Vitima")
        end

    end
end

addEventHandler("onPlayerWasted",root,killPlayerEvent)

>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
