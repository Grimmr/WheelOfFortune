package ui;

import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.text.FlxText;
import enums.CardName;
import flixel.group.FlxSpriteGroup;
import flixel.FlxSprite;
import flixel.FlxState;

class CardSlot extends FlxSpriteGroup
{  
    public inline static var targetHeight = 110;
    
    var contents:CardName;
    var statText:FlxText;
    var sprite:FlxSprite;
    var colour:FlxColor;

    public function new(c:FlxColor) {
        super();
        sprite = new FlxSprite();
        add(sprite);

        statText = new FlxText();
        statText.visible = false;
        statText.y = targetHeight + 5;
        add(statText);

        colour = c;

        setContent(CardName.EmptyFrame);
        
    }

    public function setContent(card:CardName, ?atk:Int, ?def:Int)
    {
        contents = card;
        sprite.loadGraphic("assets/images/" + Std.string(CardNameExtention.PwdFromCardName(card)) + ".png");
        sprite.setGraphicSize(0,targetHeight);
        sprite.updateHitbox();

        if(card == CardName.EmptyFrame)
        {
            color = colour;
        }
        else
        {
            color = FlxColor.WHITE;
        }

        if(atk != null && def != null)
        {
            statText.visible = true;
            statText.text = Std.string(atk) + "/" + Std.string(def);
            statText.updateHitbox();
            statText.x = x + sprite.width/2 - statText.width/2;
        }
        else 
        {
            statText.visible = false;
        }
    }

    public function setBattlePosition(def:Bool)
    {
        if(def)
        {
            angle = 90;
        }
        else
        {
            angle = 0;
        }
    }
}
