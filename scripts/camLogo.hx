import Date;

var cnlogo:FlxSprite;
var camCard:FlxCamera;

function onCreatePost() 
{
    camCard = new FlxCamera();
    camCard.bgColor = FlxColor.TRANSPARENT;
    FlxG.cameras.add(camCard, false);

    cnlogo = new FlxSprite(990, 600);
    cnlogo.setGraphicSize(Std.int(cnlogo.width * 0.17));
    cnlogo.alpha = 0.5;
    
    if (ClientPrefs.data.downScroll) 
        cnlogo.y -= 530;
	
    cnlogo.cameras = [camCard];

    var leDate = Date.now();
    if (leDate.getHours() >= 17 && leDate.getHours() <= 24) {
        cnlogo.loadGraphic(Paths.image('logo/aslogo'));
        cnlogo.x = 1046.5;
        cnlogo.y = 660;
        cnlogo.setGraphicSize(Std.int(cnlogo.width * 0.09));
        cnlogo.updateHitbox();
        if (ClientPrefs.data.downScroll) 
            cnlogo.y -= 530;
    }

    if (leDate.getHours() >= 1 && leDate.getHours() <= 6) {
        cnlogo.loadGraphic(Paths.image('logo/aslogo'));
        cnlogo.x = 1046.5;
        cnlogo.y = 660;
        cnlogo.setGraphicSize(Std.int(cnlogo.width * 0.09));
        cnlogo.updateHitbox();
        if (ClientPrefs.data.downScroll) 
            cnlogo.y -= 530;
    }

    if (leDate.getHours() >= 6 && leDate.getHours() <= 17) {
        cnlogo.loadGraphic(Paths.image('logo/cnlogo'));
        cnlogo.x = 990;
        cnlogo.y = 600;
        cnlogo.setGraphicSize(Std.int(cnlogo.width * 0.17));
        cnlogo.updateHitbox();
        if (ClientPrefs.data.downScroll) 
            cnlogo.y -= 530;
    }

    game.add(cnlogo);
}