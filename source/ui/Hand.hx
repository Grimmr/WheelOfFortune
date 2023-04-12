package ui;

import flixel.math.FlxPoint;
import flixel.FlxG;
import flixel.FlxSprite;
import enums.CardName;
import flixel.group.FlxSpriteGroup;

class Hand extends FlxSpriteGroup
{
    inline static var targetHeight = 110;
    
    var cards:Array<{card:CardName, sprite:FlxSprite}> = new Array<{card:CardName, sprite:FlxSprite}>();

    

    public function UpdateSprites()
    {
        x = 0;
        if(cards.length != 0)
        {
            var cardWidth = cards[0].sprite.width;
            for(i in 0...cards.length)
            {
                cards[i].sprite.x = cardWidth*i;
            }
        }
        x = FlxG.width/2 - width/2;
    }

    public function addCard(c:CardName)
    {
        var newPair = {card:c, sprite:new FlxSprite()};
        newPair.sprite.loadGraphic("assets/images/" + Std.string(CardNameExtention.PwdFromCardName(newPair.card)) + ".png");
        newPair.sprite.setGraphicSize(0,targetHeight);
        newPair.sprite.updateHitbox();
        cards.push(newPair);
        add(newPair.sprite);
        UpdateSprites();
    }
}