function onCreatePost() 
{
    if (game.dad.curCharacter == "cumball" || game.dad.curCharacter == "gumball") {
        for (object in [game.scoreTxt, game.timeTxt, game.botplayTxt]) {
            object.font = Paths.font("gumball.ttf");
        }
    }    
}

function onMoveCamera(target:String) 
{
    if (game.dad.curCharacter == "cumball" || game.dad.curCharacter == "gumball") {
        if (target == 'dad') {
            if (game.scoreTxt != null) 
                game.scoreTxt.color = FlxColor.fromRGB(game.dad.healthColorArray[0], game.dad.healthColorArray[1], game.dad.healthColorArray[2]);
            for (object in [game.timeTxt, game.botplayTxt]) {
                if (object != null) 
                    object.color = FlxColor.fromRGB(game.dad.healthColorArray[0], game.dad.healthColorArray[1], game.dad.healthColorArray[2]);
            }
            if (game.timeBar != null) {
                game.timeBar.leftBar.color = FlxColor.fromRGB(game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2]);
            }
        }
        else if (target == 'boyfriend') {
            if (game.scoreTxt != null) 
                game.scoreTxt.color = FlxColor.fromRGB(game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2]);
            for (object in [game.timeTxt, game.botplayTxt]) {
                if (object != null) 
                    object.color = FlxColor.fromRGB(game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2]);
            }
            if (game.timeBar != null) {
                game.timeBar.leftBar.color = FlxColor.fromRGB(game.boyfriend.healthColorArray[0], game.boyfriend.healthColorArray[1], game.boyfriend.healthColorArray[2]);
            }
        }
    }
}

function onUpdatePost(elapsed:Float) 
{

}