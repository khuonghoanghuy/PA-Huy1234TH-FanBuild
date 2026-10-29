bordersSize = 360

function onCreate()

    runHaxeCode([[
        FlxG.cameras.remove(game.camHUD,false);
		FlxG.cameras.remove(game.camOther,false);
		var overlayCam:FlxCamera = new FlxCamera();
		overlayCam.bgColor = 0x00;
		setVar('camOverlay', overlayCam);
		FlxG.cameras.add(overlayCam,false);
		FlxG.cameras.add(game.camHUD,false);
		FlxG.cameras.add(game.camOther,false);
    ]])

    makeLuaSprite('cinematicBorder1',nil,-100,0)
    makeLuaSprite('cinematicBorder2',nil,-100,screenHeight - bordersSize)
    for borders = 1,2 do
        makeGraphic('cinematicBorder'..borders,screenWidth + 300,bordersSize,'000000')
        setObjectCamera('cinematicBorder'..borders,'camHUD')
        addLuaSprite('cinematicBorder'..borders,false) 
    end

    runHaxeCode([[
    game.getLuaObject("cinematicBorder1").camera = getVar("camOverlay");
    game.getLuaObject("cinematicBorder2").camera = getVar("camOverlay");
    ]])

    setObjectOrder('cinematicBorder1', 1000)
    setObjectOrder('cinematicBorder2', 1001)
    
    setProperty('cinematicBorder1.y',-bordersSize)
    setProperty('cinematicBorder2.y',screenHeight)
end

function onEvent(name,value1,value2)
    if name == 'Cinematic' then
        cancelTween('cenematic1Y')
        cancelTween('cenematic2Y')
        if value2 ~= '' then
            doTweenY('cenematic1Y','cinematicBorder1',-bordersSize + value1, value2, 'cubeOut')
            doTweenY('cenematic2Y','cinematicBorder2',screenHeight - value1, value2, 'cubeOut')
        else
            setProperty('cinematicBorder1.y', -bordersSize + value1)
            setProperty('cinematicBorder2.y', screenHeight - value1)
        end
    end
end