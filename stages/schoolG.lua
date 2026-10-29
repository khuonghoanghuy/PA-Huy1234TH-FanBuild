function onCreate()
    makeLuaSprite('background', 'school/Ilustracion_sin_titulo-1', 0, 0)
    scaleObject('background', 1.3, 1.3)
    setProperty('background.antialiasing', getPropertyFromClass("backend.ClientPrefs", "data.antialiasing"))
    setScrollFactor('background', 1, 1)
    updateHitbox('background')
    addLuaSprite('background', false)

    if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
        initLuaShader('cyclesd')
    end

    if not getPropertyFromClass("backend.ClientPrefs", "data.lowQuality") then
        makeLuaSprite('wall', 'school/Ilustracion_sin_titulo-2', -200, 200)
        scaleObject('wall', 1.1, 1.1)
        setProperty('wall.antialiasing', getPropertyFromClass("backend.ClientPrefs", "data.antialiasing"))
        setScrollFactor('wall', 1, 1)
        updateHitbox('wall')
        addLuaSprite('wall', true)

        makeAnimatedLuaSprite('daGloop', 'school/topgoop', 0, 85)
        scaleObject('daGloop', 1.5, 1.5)
        addAnimationByPrefix('daGloop', 'topey', 'gooey', 24, false)
        if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
            setSpriteShader('daGloop', 'cyclesd')
            setShaderFloat('daGloop', 'pixel', 5)
            setShaderFloat('daGloop', 'amount', 0.0)
        end
        addLuaSprite('daGloop', true)

        makeAnimatedLuaSprite('daGloop2', 'school/secondtopgoop', 1450, 110)
        scaleObject('daGloop2', 1.5, 1.5)
        addAnimationByPrefix('daGloop2', 'topey2', 'gooey', 24, false)
        if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
            setSpriteShader('daGloop2', 'cyclesd')
            setShaderFloat('daGloop2', 'pixel', 5)
            setShaderFloat('daGloop2', 'amount', 0.0)
        end
        addLuaSprite('daGloop2', true)

        makeAnimatedLuaSprite('daGloop4', 'school/droplet', 1200, 495)
        scaleObject('daGloop4', 1.7, 1.7)
        addAnimationByPrefix('daGloop4', 'dropey', 'gooey', 24, false)
        if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
            setSpriteShader('daGloop4', 'cyclesd')
            setShaderFloat('daGloop4', 'pixel', 5)
            setShaderFloat('daGloop4', 'amount', 0.0)
        end
        addLuaSprite("daGloop4", false)

        makeAnimatedLuaSprite('daGloop5', 'school/sinkgoop', 635, 515)
        scaleObject('daGloop5', 1.7, 1.7)
        addAnimationByPrefix('daGloop5', 'sinkey', 'gooey', 24, false)
        if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
            setSpriteShader('daGloop5', 'cyclesd')
            setShaderFloat('daGloop5', 'pixel', 5)
            setShaderFloat('daGloop5', 'amount', 0.0)
        end
        addLuaSprite("daGloop5", false)

        makeAnimatedLuaSprite('penny', 'school/penny', 700, 150)
        scaleObject('penny', 1.3, 1.3)
        addAnimationByPrefix('penny', 'idle', 'idle', 8, true)
        setProperty("penny.alpha", 0.00001)
        addLuaSprite("penny", false)

        makeLuaSprite('light', 'school/light', -500, 50)
        scaleObject('light', 1, 1)
        setProperty('light.antialiasing', getPropertyFromClass("backend.ClientPrefs", "data.antialiasing"))
        setScrollFactor('light', 1, 1)
        updateHitbox('light')
        addLuaSprite('light', true)

        makeLuaSprite('vignette', 'school/Ilustracion_sin_titulo-3', 0, 0)
        scaleObject('vignette', 1.3, 1.3)
        setProperty('vignette.antialiasing', getPropertyFromClass("backend.ClientPrefs", "data.antialiasing"))
        setScrollFactor('vignette', 1, 1)
        updateHitbox('vignette')
        addLuaSprite('vignette', true)

        makeLuaSprite('vignette2', 'school/188_sin_titulo11_20230523094718', 0, 0)
        scaleObject('vignette2', 1.3, 1.3)
        setProperty('vignette2.antialiasing', getPropertyFromClass("backend.ClientPrefs", "data.antialiasing"))
        setScrollFactor('vignette2', 1, 1)
        updateHitbox('vignette2')
        addLuaSprite('vignette2', true)
    end
end

function onCreatePost()
    if songName == "Child's Play Remake WIP" then
        setProperty("daGloop5.alpha", 0)
        setProperty("daGloop4.alpha", 0)
        setProperty("daGloop2.alpha", 0)
        setProperty("daGloop.alpha", 0)
    end
end

function onUpdate(elapsed)
    if getProperty('dad.curCharacter') == 'gumball' then
        setProperty('dad.x', 250)
        setProperty('dad.y', 450)
    else
        setProperty('dad.x', 300)
        setProperty('dad.y', 550)
    end
end

function onBeatHit(curBeat)
    doGoo()
    ponny()
end

function onStepHit()
    if songName == "Child's Play Randomness Mix" then
        if curStep == 0 then
            runHaxeCode([[
                for (object in [game.getLuaObject("daGloop5"), game.getLuaObject("daGloop4"), game.getLuaObject("daGloop2"), game.getLuaObject("daGloop")])
                {
                    object.alpha = 1;
                }
            ]])
        end
        if curStep == 256 then
            setProperty("background.alpha", 0)
            setProperty("light.alpha", 0)
            setProperty("vignette.alpha", 0)
            setProperty("vignette2.alpha", 0)

            setProperty("daGloop5.alpha", 0)
            setProperty("daGloop4.alpha", 0)
            setProperty("daGloop2.alpha", 0)
            setProperty("daGloop.alpha", 0)
        end
        if curStep == 384 then
            runHaxeCode([[
                for (object in [game.getLuaObject("background"), game.getLuaObject("light"), game.getLuaObject("vignette"), game.getLuaObject("vignette2")])
                {
                    FlxTween.tween(object, {alpha: 1}, 10, {ease: FlxEase.sineInOut});
                }
            ]])
        end
        if curStep == 448 then
            runHaxeCode([[
                for (object in [game.getLuaObject("daGloop5"), game.getLuaObject("daGloop4"), game.getLuaObject("daGloop2"), game.getLuaObject("daGloop")])
                {
                    FlxTween.tween(object, {alpha: 1}, 5, {ease: FlxEase.sineInOut});
                }
            ]])
        end
        if curStep == 510 then
            runHaxeCode([[
                for (object in [game.getLuaObject("daGloop5"), game.getLuaObject("daGloop4"), game.getLuaObject("daGloop2"), game.getLuaObject("daGloop")])
                {
                    FlxTween.cancelTweensOf(object);
                    object.alpha = 0;
                }
            ]])
        end
        if curStep == 2067 then
            setProperty("penny.alpha", 1)
            setProperty("daGloop5.alpha", 1)
            setProperty("daGloop4.alpha", 1)
            setProperty("daGloop2.alpha", 1)
            setProperty("daGloop.alpha", 1)
        end
        if curStep == 2735 then
            setProperty("background.alpha", 0)
            setProperty("light.alpha", 0)
            setProperty("vignette.alpha", 0)
            setProperty("vignette2.alpha", 0)
            setProperty("penny.alpha", 0)
            setProperty("daGloop5.alpha", 0)
            setProperty("daGloop4.alpha", 0)
            setProperty("daGloop2.alpha", 0)
            setProperty("daGloop.alpha", 0)
            setProperty("wall.alpha", 0)
        end
    end
end

function doGoo()
    if not getPropertyFromClass("backend.ClientPrefs", "data.lowQuality") then
        playAnim('daGloop5', 'sinkey', false)
        playAnim('daGloop4', 'dropey', false)
        playAnim('daGloop2', 'topey2', false)
        playAnim('daGloop', 'topey', false)
    end
end

function ponny()
    if not getPropertyFromClass("backend.ClientPrefs", "data.lowQuality") then
        playAnim('penny', 'idle', false)
    end
end

function stepsInSeconds(steps)
    if not steps then return 0 end
    return (steps * 60) / (curBpm * 4)
end