allowToFocus = true

function onCreatePost()
    setProperty("gf.alpha", 0.000001)
end

function onMoveCamera(focus)
    if allowToFocus == true then
        if focus == 'dad' then
            setProperty('defaultCamZoom', 1.2)
        else
            setProperty('defaultCamZoom', 0.9)
        end
    end
end

function onSongStart()
    setProperty("camZooming", true)
end

enabled = true

function onStepHit()
	if curStep == 128 then
		doTweenAngle('turn', 'camGame', 2.5, crochet / 300, 'sineInOut')
		doTweenAngle('camturn', 'camHUD', -2.5, crochet / 300, 'sineInOut')
	end
	if curStep == 256 then
		enabled = false
	end
    if curStep == 272 then
		doTweenAngle('turn', 'camGame', 2.5, crochet / 300, 'sineInOut')
		doTweenAngle('camturn', 'camHUD', -2.5, crochet / 300, 'sineInOut')
    end
    if curStep == 622 then
        enabled = false
    end
end

function onTweenCompleted(t)
	if enabled then
		if t == 'turn' then
			doTweenAngle('turn1', 'camGame', -2.5, crochet / 300, 'sineInOut')
			doTweenAngle('camturn1', 'camHUD', 2.5, crochet / 300, 'sineInOut')
		end
		if t == 'turn1' then
			doTweenAngle('turn', 'camGame', 2.5, crochet / 300, 'sineInOut')
			doTweenAngle('camturn', 'camHUD', -2.5, crochet / 300, 'sineInOut')
		end
	else
		doTweenAngle('turn3', 'camGame', 0, crochet / 300, 'sineInOut')
		doTweenAngle('turn4', 'camHUD', 0, crochet / 300, 'sineInOut')
	end
end