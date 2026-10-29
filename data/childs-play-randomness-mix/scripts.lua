hidePlayerStrum = false
hideOpponentStrum = false
allowToFocus = true
pixelAmount = 0

function onCreate()
    setProperty("gf.alpha", 0.00001)

    if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
        initLuaShader('cyclesd')

        makeLuaSprite('gameShaderHolder')
        setSpriteShader('gameShaderHolder', 'cyclesd')
        setShaderFloat('gameShaderHolder', 'pixel', 0)
        setShaderFloat('gameShaderHolder', 'amount', 0)

        makeLuaSprite('hudShaderHolder')
        setSpriteShader('hudShaderHolder', 'cyclesd')
        setShaderFloat('hudShaderHolder', 'pixel', 0)
        setShaderFloat('hudShaderHolder', 'amount', 0)
    end
end


function onCreatePost()
    if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
        addHaxeLibrary('ShaderFilter', 'openfl.filters')

        runHaxeCode([[
            var gameHolder = game.getLuaObject('gameShaderHolder');
            var hudHolder = game.getLuaObject('hudShaderHolder');

            if (gameHolder != null && hudHolder != null) {
                game.camGame._filters.push(
                    new ShaderFilter(gameHolder.shader)
                );

                game.camHUD._filters.push(
                    new ShaderFilter(hudHolder.shader)
                );
            }
        ]])
    end

    setProperty("camGame.alpha", 0)
    setProperty("camHUD.alpha", 0)
end

function onSongStart()
    setProperty('camZooming', true)
    setProperty('camGame.zoom', 2)
    setProperty('defaultCamZoom', 2)

    doTweenAlpha("camHUDTweenAlpha", "camHUD", 1, 2, "sineInOut")
    runHaxeCode([[
        for (object in [game.timeTxt, game.timeBar, game.healthBar, game.iconP1, game.iconP2, game.scoreTxt])
        {
            object.alpha = 0;
        }
    ]])

    setProperty("boyfriend.alpha", 0)
    setProperty("dad.alpha", 0)
    setProperty("camGame.alpha", 1)

    hidePlayerStrum = true
    hideOpponentStrum = true
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

function onUpdate(elapsed)
    if hidePlayerStrum == true then
        for i = 0,3 do
            setPropertyFromGroup("playerStrums", i, "alpha", 0)
        end
    end

    if hideOpponentStrum == true then
        for i = 0,3 do
            setPropertyFromGroup("opponentStrums", i, "alpha", 0)
        end
    end
end

function onStepHit()
    if curStep == 248 then
        hidePlayerStrum = false

        runHaxeCode([[
            for (i in 0...4) {
                var strum = game.playerStrums.members[i];
                strum.alpha = 0;
                FlxTween.tween(strum, {alpha: 1}, 0.5, {ease: FlxEase.sineInOut});
            }
        ]])
    end

    if curStep == 256 then
        runHaxeCode([[
            game.boyfriend.setColorTransform(1, 1, 1, 1, 255, 255, 255, 0);
            FlxTween.tween(game.boyfriend, {alpha: 1}, 1, {ease: FlxEase.sineInOut});
        ]])
    end

    if curStep == 504 then
        hideOpponentStrum = false

        runHaxeCode([[
            for (i in 0...4) {
                var strum = game.opponentStrums.members[i];
                strum.alpha = 0;
                FlxTween.tween(strum, {alpha: 1}, 0.5, {ease: FlxEase.sineInOut});
            }
        ]])
        setProperty("dad.alpha", 1)
    end

    if curStep == 510 then
        runHaxeCode([[
            game.boyfriend.setColorTransform(1, 1, 1, 1, 0, 0, 0, 0);
            for (object in [game.timeTxt, game.timeBar, game.healthBar, game.iconP1, game.iconP2, game.scoreTxt])
            {
                object.alpha = 1;
            }
        ]])
        allowToFocus = false
    end

    if curStep == 1022 then
        allowToFocus = true
    end

    if curStep == 1278 then
        allowToFocus = false
    end

    if curStep == 1534 then
        allowToFocus = true
    end

    if curStep == 1790 then
        setProperty("camGame.alpha", 0)
        runHaxeCode([[
            for (object in [game.timeTxt, game.timeBar, game.healthBar, game.iconP1, game.iconP2, game.scoreTxt])
            {
                object.alpha = 0;
            }

            for (i in 0...4) {
                var strumPlayer = game.playerStrums.members[i];
                var strumOpponent = game.opponentStrums.members[i];
                strumPlayer.alpha = 0;
                strumOpponent.alpha = 0;
            }
        ]])
    end

    if curStep == 2067 then
        setProperty("camGame.alpha", 1)
        runHaxeCode([[
            for (object in [game.timeTxt, game.timeBar, game.healthBar, game.iconP1, game.iconP2, game.scoreTxt])
            {
                object.alpha = 1;
            }

            for (i in 0...4) {
                var strumPlayer = game.playerStrums.members[i];
                var strumOpponent = game.opponentStrums.members[i];
                strumPlayer.alpha = 1;
                strumOpponent.alpha = 1;
            }
        ]])
    end

    if curStep == 2735 then
        runHaxeCode([[
            game.dad.setColorTransform(1, 1, 1, 1, 255, 255, 255, 0);
            game.boyfriend.setColorTransform(1, 1, 1, 1, 255, 255, 255, 0);

            FlxTween.tween(game.camGame, {alpha: 1}, 5, {ease: FlxEase.sineInOut});
        ]])
    end

    if curStep == 2854 then
        allowToFocus = false
        runHaxeCode([[
            FlxTween.tween(game.camHUD, {alpha: 1}, 1.25, {ease: FlxEase.sineInOut});
        ]])
    end

    if curStep == 3028 then
        if getPropertyFromClass("backend.ClientPrefs", "data.shaders") then
            runHaxeCode([[
                var gameHolder = game.getLuaObject('gameShaderHolder');
                var hudHolder = game.getLuaObject('hudShaderHolder');

                if (gameHolder != null && hudHolder != null) {
                    var gameShader = gameHolder.shader;
                    var hudShader = hudHolder.shader;

                    FlxTween.num(0, 35, 1, {
                        ease: FlxEase.quadIn
                    }, function(value:Float) {
                        gameShader.data.pixel.value = [value];
                        hudShader.data.pixel.value = [value];
                    });
                }

                FlxTween.tween(game.camGame, {alpha: 0}, 1, {
                    ease: FlxEase.sineInOut
                });

                FlxTween.tween(game.camHUD, {alpha: 0}, 1, {
                    ease: FlxEase.sineInOut
                });
            ]])
        end
    end
end

function updatePixelShader(value)
    pixelAmount = value

    setShaderFloat('gameShaderHolder', 'pixel', value)
    setShaderFloat('hudShaderHolder', 'pixel', value)
end
