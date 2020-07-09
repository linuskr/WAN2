import mods.compatskills.OreDictLock.addOreDictLock;
import mods.compatskills.Requirement.addRequirement;

#priority 1

print("Running 'ore_locks.zs'...");

addOreDictLock(<ore:oreTin>, "reskillable:mining|4");
addOreDictLock(<ore:oreCopper>, "reskillable:mining|4");
addOreDictLock(<ore:oreAluminum>, "reskillable:mining|5");
addOreDictLock(<ore:oreLead>, "reskillable:mining|6");
addOreDictLock(<ore:oreSilver>, "reskillable:mining|2", "reskillable:magic|2");
addOreDictLock(<ore:oreNickel>, "reskillable:mining|5");
addOreDictLock(<ore:oreUranium>, "reskillable:mining|10", "reskillable:magic|4");
addOreDictLock(<ore:oreThorium>, "reskillable:mining|10", "reskillable:magic|4");
addOreDictLock(<ore:oreBoron>, "reskillable:mining|8", "reskillable:magic|4");
addOreDictLock(<ore:oreLithium>, "reskillable:mining|6");
addOreDictLock(<ore:oreMagnesium>, "reskillable:mining|6");
addOreDictLock(<ore:oreRuby>, "reskillable:mining|8");
addOreDictLock(<ore:oreSapphire>, "reskillable:mining|8");
addOreDictLock(<ore:orePeridot>, "reskillable:mining|7");
addOreDictLock(<ore:oreTopaz>, "reskillable:mining|8");
addOreDictLock(<ore:oreMalachite>, "reskillable:mining|8");
addOreDictLock(<ore:oreTanzanite>, "reskillable:mining|8");
addOreDictLock(<ore:oreAmethyst>, "reskillable:mining|10");
addOreDictLock(<ore:oreElectrotine>, "reskillable:mining|4");
addOreDictLock(<ore:oreDimensionalShard>, "reskillable:mining|10");
addOreDictLock(<ore:oreSulfur>, "reskillable:mining|4");
addOreDictLock(<ore:oreSaltpeter>, "reskillable:mining|4");
addOreDictLock(<ore:oreFossil>, "reskillable:mining|4");
//addOreDictLock(<ore:oreSalt>, "reskillable:mining|2");
addOreDictLock(<ore:oreZinc>, "reskillable:mining|5");
addOreDictLock(<ore:oreFirestone>, "reskillable:mining|5");
addOreDictLock(<ore:oreNaquadah>, "reskillable:mining|14");
addOreDictLock(<ore:oreAmber>, "reskillable:mining|4", "reskillable:magic|12");
addOreDictLock(<ore:oreCinnabar>, "reskillable:mining|6", "reskillable:magic|12");
addOreDictLock(<ore:oreQuartz>, "reskillable:mining|4", "reskillable:magic|10");
addOreDictLock(<ore:oreCobalt>, "reskillable:mining|12");
addOreDictLock(<ore:oreArdite>, "reskillable:mining|12");
addOreDictLock(<ore:oreTrinitite>, "reskillable:mining|10");
addOreDictLock(<ore:oreLapis>, "reskillable:mining|4", "reskillable:magic|4");
addOreDictLock(<ore:oreDiamond>, "reskillable:mining|8");
addOreDictLock(<ore:oreEmerald>, "reskillable:mining|8");

print("Finished 'ore_locks.zs'");
