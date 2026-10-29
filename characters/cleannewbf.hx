var ayoLockStill:Bool = false;

function onUpdatePost(elapsed:Float) 
{
    game.boyfriend.animation.finishCallback = function (name:String) {
        switch (name) {
            case "singLEFT":
                game.boyfriend.animation.play("singLEFTend", true);
            case "singRIGHT":
                game.boyfriend.animation.play("singRIGHTend", true);
            case "singUP":
                game.boyfriend.animation.play("singUPend", true);
            case "singDOWN":
                game.boyfriend.animation.play("singDOWNend", true);
            case "singLEFTend" | "singRIGHTend" | "singUPend" | "singDOWNend":
                game.boyfriend.animation.play("idle", true);
        }
    };
}