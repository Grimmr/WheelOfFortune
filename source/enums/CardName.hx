package enums;

enum CardName {
    EmptyFrame;
    Back;
    PotOfExtravagance;
    HitotsumeGiant;
    HammerShot;
    PetitDragon;
}

class CardNameExtention
{
    public static function PwdFromCardName(name:CardName):Int
    {
        switch(name)
        {
            case EmptyFrame: return 0;
            case Back: return 1;
            case HammerShot: return 26412047;
            case PotOfExtravagance: return 49238328;
            case PetitDragon: return 75356564;
            case HitotsumeGiant: return 76184692;
            
        }
    }
}