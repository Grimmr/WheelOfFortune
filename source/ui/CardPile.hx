package ui;

import flixel.util.FlxColor;
import enums.CardName;

class CardPile extends CardSlot
{   
    public var CardList:Array<CardName> = new Array<CardName>();
    public var FaceUp:Bool;
    
    public function new(c:FlxColor, faceUp:Bool)
    {
        FaceUp = faceUp;
        super(c);   
    }

    public function addCard(c:CardName)
    {
        CardList.insert(0, c);
        setContent(c);
    }
    
    //card pile never enters deffence
    override function setBattlePosition(def:Bool) 
    {
        super.setBattlePosition(false);
    }
    
    //card pile never shows stats
    override function setContent(card:CardName, ?atk:Int, ?def:Int) 
    {
        super.setContent((FaceUp || card == CardName.EmptyFrame)? card : CardName.Back);
    }
}