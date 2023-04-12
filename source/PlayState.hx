package;

import ui.CardPile;
import flixel.util.FlxColor;
import enums.CardName;
import enums.CardName.CardNameExtention;
import flixel.FlxG;
import ui.CardSlot;
import ui.Hand;
import flixel.FlxState;

class PlayState extends FlxState
{
	static inline var infoWidth = 360; // was 360;
	static inline var logWidth = 360;
	static inline var handHeight = 180;
	static inline var handPadding = 30;
	
	var TopHand = new Hand();
	var TopSpells = [for(_ in 0...6) null];
	var TopMonsters = [for(_ in 0...5) null];
	var EMZ = [for(_ in 0...2) null];
	var BotMonsters = [for(_ in 0...5) null];
	var BotSpells = [for(_ in 0...6) null];
	var BotHand = new Hand();

	var TopGrave:CardPile;
	var BotGrave:CardPile;
	var TopBanish:CardPile;
	var BotBanish:CardPile;

	var TopDeck:CardPile;
	var BotDeck:CardPile;
	var TopExtra:CardPile;
	var BotExtra:CardPile;
	
	override public function create()
	{
		super.create();

		var zoneWidth = ((FlxG.width - infoWidth - logWidth) / 9);
		var zoneHeight = ((FlxG.height - (handHeight*2)) / 5);

		//setup top hand
		TopHand.y = handPadding;
		add(TopHand);
		
		//position top spell slots
		for(i in 0...6)
		{
			TopSpells[i] = new CardSlot(FlxColor.RED);
			var slot = TopSpells[i];
			if(i < 5)
			{
				var pos = i+2;
				slot.x = infoWidth + zoneWidth*pos + ( zoneWidth - slot.width)/2;
				slot.y = handHeight + zoneHeight*0 + ( zoneHeight - slot.height)/2;
			}
			else
			{
				slot.x = infoWidth + zoneWidth*7 + ( zoneWidth - slot.width)/2;
				slot.y = handHeight + zoneHeight*1 + ( zoneHeight - slot.height)/2;
			}

			add(slot);
		}

		//position top monsters
		for(i in 0...5)
		{
			TopMonsters[i] = new CardSlot(FlxColor.RED);
			var slot = TopMonsters[i];

			var pos = i+2;
			slot.x = infoWidth + zoneWidth*pos + ( zoneWidth - slot.width)/2;
			slot.y = handHeight + zoneHeight*1 + ( zoneHeight - slot.height)/2;

			add(slot);
		}

		//position EMZ
		for(i in 0...2)
		{
			EMZ[i] = new CardSlot(FlxColor.MAGENTA);
			var slot = EMZ[i];

			var pos = (i*2)+3;
			slot.x = infoWidth + zoneWidth*pos + ( zoneWidth - slot.width)/2;
			slot.y = handHeight + zoneHeight*2 + ( zoneHeight - slot.height)/2;

			add(slot);
		}

		//position bot monsters
		for(i in 0...5)
		{
			BotMonsters[i] = new CardSlot(FlxColor.BLUE);
			var slot = BotMonsters[i];

			var pos = i+2;
			slot.x = infoWidth + zoneWidth*pos + ( zoneWidth - slot.width)/2;
			slot.y = handHeight + zoneHeight*3 + ( zoneHeight - slot.height)/2;

			add(slot);
		}

		//position bot spell slots
		for(i in 0...6)
		{
			BotSpells[i] = new CardSlot(FlxColor.BLUE);
			var slot = BotSpells[i];
			
			if(i < 5)
			{
				var pos = i+2;
				slot.x = infoWidth + zoneWidth*pos + ( zoneWidth - slot.width)/2;
				slot.y = handHeight + zoneHeight*4 + ( zoneHeight - slot.height)/2;
			}
			else
			{
				slot.x = infoWidth + zoneWidth*1 + ( zoneWidth - slot.width)/2;
				slot.y = handHeight + zoneHeight*3 + ( zoneHeight - slot.height)/2;
			}

			add(slot);
		}

		//setup bottom hand
		BotHand.y = FlxG.height - CardSlot.targetHeight - handPadding;
		add(BotHand);

		//setup grave and banish
		TopGrave = new CardPile(FlxColor.WHITE, true);
		TopGrave.x = infoWidth + zoneWidth*1 + ( zoneWidth - TopGrave.width)/2;
		TopGrave.y = handHeight + zoneHeight*1 + ( zoneHeight - TopGrave.height)/2;
		add(TopGrave);
		TopBanish = new CardPile(FlxColor.WHITE, true);
		TopBanish.x = infoWidth + zoneWidth*0 + ( zoneWidth - TopBanish.width)/2;
		TopBanish.y = handHeight + zoneHeight*1 + ( zoneHeight - TopBanish.height)/2;
		add(TopBanish);
		BotGrave = new CardPile(FlxColor.WHITE, true);
		BotGrave.x = infoWidth + zoneWidth*7 + ( zoneWidth - BotGrave.width)/2;
		BotGrave.y = handHeight + zoneHeight*3 + ( zoneHeight - BotGrave.height)/2;
		add(BotGrave);
		BotBanish = new CardPile(FlxColor.WHITE, true);
		BotBanish.x = infoWidth + zoneWidth*8 + ( zoneWidth - BotBanish.width)/2;
		BotBanish.y = handHeight + zoneHeight*3 + ( zoneHeight - BotBanish.height)/2;
		add(BotBanish);

		//setup decks
		TopDeck = new CardPile(FlxColor.WHITE, false);
		TopDeck.x = infoWidth + zoneWidth*1 + ( zoneWidth - TopDeck.width)/2;
		TopDeck.y = handHeight + zoneHeight*0 + ( zoneHeight - TopDeck.height)/2;
		add(TopDeck);
		BotDeck = new CardPile(FlxColor.WHITE, false);
		BotDeck.x = infoWidth + zoneWidth*7 + ( zoneWidth - BotDeck.width)/2;
		BotDeck.y = handHeight + zoneHeight*4 + ( zoneHeight - BotDeck.height)/2;
		add(BotDeck);
		TopExtra = new CardPile(FlxColor.WHITE, false);
		TopExtra.x = infoWidth + zoneWidth*7 + ( zoneWidth - TopExtra.width)/2;
		TopExtra.y = handHeight + zoneHeight*0 + ( zoneHeight - TopExtra.height)/2;
		add(TopExtra);
		BotExtra = new CardPile(FlxColor.WHITE, false);
		BotExtra.x = infoWidth + zoneWidth*1 + ( zoneWidth - BotExtra.width)/2;
		BotExtra.y = handHeight + zoneHeight*4 + ( zoneHeight - BotExtra.height)/2;
		add(BotExtra);

		//test junk
		TopMonsters[2].setBattlePosition(true);
		TopMonsters[3].setBattlePosition(true);
		TopSpells[1].setContent(CardName.PetitDragon, 600, 700);
		TopHand.addCard(CardName.HammerShot);
		TopHand.addCard(CardName.PotOfExtravagance);
		BotHand.addCard(CardName.HitotsumeGiant);
		BotHand.addCard(CardName.HitotsumeGiant);
		BotHand.addCard(CardName.PetitDragon);
		TopGrave.addCard(CardName.HitotsumeGiant);
		TopDeck.addCard(CardName.HitotsumeGiant);
		BotDeck.addCard(CardName.HitotsumeGiant);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
