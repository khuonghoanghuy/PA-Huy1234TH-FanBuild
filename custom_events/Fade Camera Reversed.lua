function onEvent(name, value1, value2)
	if name == "Fade Camera Reversed" then
		cameraFade('camGame',value1,value2,true, true)
	end
end

function onTimerCompleted(tag)
if tag == 'FadeCamStart' then
setProperty('FadeCam.alpha',0.7)
doTweenAlpha('endFadeCamReversed','FadeCamReversed',0,time - 0.1,'linear')
end
end
