function onEvent(name, value1, value2)
	if name == "Fade Camera" then
		cameraFade('camGame',value1,value2,true)
	end
end

function onTimerCompleted(tag)
if tag == 'FadeCamStart' then
setProperty('FadeCam.alpha',0.7)
doTweenAlpha('endFadeCam','FadeCam',0,time - 0.1,'linear')
end
end
