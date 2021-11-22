<<<<<<< HEAD
 dda = createMarker(fsfsdfds)
 createCar =callRemotesad

addEventHandler("onPlayerMarkerHit",root,function(markerHitted,matchingDimension)
    if markerHitted == dda then 
        if v[source] and isElement(v[source]) and isPedInVehicle(source) then 
            if getPedOccupiedVehicle(source) == v[source] then
              destroyElement(v[source])
            end
        end
    elseif markerHitted == createCar then 
        if v[source]  and isElement(v[source]) then 
            destroyElement(v[source])       
            v[source] = nil 
        end
        v[source] = createVehicle(dfsfsdfsd)
    end
=======
 dda = createMarker(fsfsdfds)
 createCar =callRemotesad

addEventHandler("onPlayerMarkerHit",root,function(markerHitted,matchingDimension)
    if markerHitted == dda then 
        if v[source] and isElement(v[source]) and isPedInVehicle(source) then 
            if getPedOccupiedVehicle(source) == v[source] then
              destroyElement(v[source])
            end
        end
    elseif markerHitted == createCar then 
        if v[source]  and isElement(v[source]) then 
            destroyElement(v[source])       
            v[source] = nil 
        end
        v[source] = createVehicle(dfsfsdfsd)
    end
>>>>>>> 35e5882026fc092c12bf75afcd6f6f52dd67ed9a
end)