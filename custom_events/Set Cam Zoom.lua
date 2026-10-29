function onEvent(name, value1, value2)
    if name == "Set Cam Zoom" then
        if value2 == '' then
            setProperty("defaultCamZoom", tonumber(value1))
        else
            local steps = tonumber(value2)
            local duration = (steps * 60) / (bpm * 4)
            
            doTweenZoom('camz', 'camGame', tonumber(value1), duration, 'sineInOut')
        end
    end
end

function onTweenCompleted(name)
    if name == 'camz' then
        setProperty("defaultCamZoom", getProperty('camGame.zoom')) 
    end
end