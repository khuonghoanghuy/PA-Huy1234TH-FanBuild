--SCRIPT BY NTH208
chromAmount = 0.2 --default = 0.65
chromatic = 0.001
percent = 50
enabled = false
activated = false
zoomChromatic = true
glitchChromatic = true
notGF = false

glitchShaderIntensity = 0
chromaticShaderIntensity = 0
lerpGlitchChromatic = 7.0
glitchyAmount = 0
uTimeFloat = 0

function onCreatePost()
    --if shadersEnabled then
    initLuaShader('ChromaticAbberationHUD')
    initLuaShader('glitchChromatic')
    initLuaShader('Glitchy2')

    runHaxeCode([[
            var pibbyFNF = game.createRuntimeShader('glitchChromatic');
            var glitchy = game.createRuntimeShader('Glitchy2');
            var chromToggle = game.createRuntimeShader('ChromaticAbberationHUD'); 
            setVar('pibbyFNF', pibbyFNF);
            setVar('glitchy', glitchy);
            setVar('chromToggle', chromToggle);

            game.camGame.setFilters([new ShaderFilter(pibbyFNF),new ShaderFilter(chromToggle),new ShaderFilter(glitchy)]);
            game.camHUD.setFilters([new ShaderFilter(pibbyFNF),new ShaderFilter(chromToggle),new ShaderFilter(glitchy)]);
    ]])
    --end
end

function onSectionHit()
    if zoomChromatic then
        chromBeat()
    end
end

function onEvent(name,value1,value2)
    if name == 'Add Camera Zoom' then
        if zoomChromatic then
            chromBeat() 
        end
    end

    if value1 == 'Change Lerp Glitch' then
        lerpGlitchChromatic = tonumber(value2);
    end
end


function chromBeat()
    if zoomChromatic then
        chromaticShaderIntensity = chromAmount
    end
end

function resetShaderGlitch()
    runHaxeCode([[
            var pibbyFNF = getVar('pibbyFNF');
            var chromToggle = getVar('chromToggle'); 
            var glitchy = getVar('glitchy');
            
            game.camGame.setFilters([new ShaderFilter(pibbyFNF),new ShaderFilter(chromToggle),new ShaderFilter(glitchy)]);
            game.camHUD.setFilters([new ShaderFilter(pibbyFNF),new ShaderFilter(chromToggle),new ShaderFilter(glitchy)]);
    ]])
end

function ChromaticAbberationSetting(isZoomChromatic,amount)
    zoomChromatic = isZoomChromatic

    if not zoomChromatic then
        chromaticShaderIntensity = (amount ~= nil and amount or 0)
    end
end

function glitchChromaticSetting(isGlitch, amount, percentGlitch)
    glitchChromatic = isGlitch
    percent = percentGlitch
    chromatic = amount
    --debugPrint(amount == '')
end

function opponentNoteHit(id,noteData,noteType,isSustainNote)
    if noteType == 'GF Sing But Not Visible Note' or noteType == 'GF Sing' then
        notGF = false
    else
        notGF = true
    end

    if noteType == 'Glitch Note' or noteType == 'Second Char Glitch' then
        glitchyAmount = 0.25
    end

    if glitchChromatic then
        if notGF and getRandomBool(percent) and noteType ~= ('Glitch Note' and 'Second Char Glitch') then
            glitchShaderIntensity = getRandomFloat(0.2 + chromatic, 0.8 + chromatic)
        elseif noteType == ('Glitch Note' or 'Second Char Glitch') then
            glitchShaderIntensity = getRandomFloat(1.4 + chromatic, 2.0 + chromatic)
        end
    end
end

function onUpdate(elapsed)
    uTimeFloat = uTimeFloat + elapsed
    glitchShaderIntensity = math.lerp(glitchShaderIntensity, 0, math.bound(elapsed * lerpGlitchChromatic, 0, 1));
    glitchyAmount = math.lerp(glitchyAmount, 0, math.bound(elapsed * 5, 0, 1));
    if zoomChromatic then
        chromaticShaderIntensity = math.lerp(chromaticShaderIntensity, 0, math.bound(elapsed * 6, 0, 1));
    end

    runHaxeCode([[
        var chromToggle = getVar('chromToggle');
        var glitchy = getVar('glitchy');
        var pibbyFNF = getVar('pibbyFNF');

        chromToggle.setFloat('amount', ]]..chromaticShaderIntensity..[[);
        pibbyFNF.setFloat('glitchMultiply', ]]..glitchShaderIntensity..[[);
        pibbyFNF.setFloat('uTime', ]]..uTimeFloat..[[);
        glitchy.setFloat('iTime', ]]..uTimeFloat..[[);
        glitchy.setFloat('AMT', ]]..glitchyAmount..[[);
        glitchy.setFloat('SPEED', 0.5);
    ]])
end

function math.bound(value,min,max)
    return math.max(min,math.min(max,value))
end

function math.lerp(from,to,i)
    return from+(to-from)*i
end
