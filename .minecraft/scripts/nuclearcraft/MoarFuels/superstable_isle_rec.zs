/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDictEntry;
import mods.nuclearcraft.AlloyFurnace;
import mods.nuclearcraft.Assembler;
import mods.nuclearcraft.DecayHastener;
import mods.nuclearcraft.Infuser;
import mods.nuclearcraft.Separator;
import mods.nuclearcraft.FuelReprocessor;
import mods.nuclearcraft.PebbleFission;
import mods.nuclearcraft.SolidFission;

mods.qmd.target_chamber.addRecipe(<contenttweaker:einsteinium54>, ((<particle:alpha>*120000)^3000)~1.0, <contenttweaker:mendelevium58>, null, <particle:photon>, null, 7500, 1.0, -3000, 0.0001);
mods.qmd.target_chamber.addRecipe(<contenttweaker:fermium57>, ((<particle:heffalumpMatter>*120000)^8000)~1.0, <contenttweaker:flerovium98>, null, <particle:photon>, null, 20000, 1.0, -8000, 0.0001);

val stuff = <contenttweaker:mysterymix>;
if(false){ //loadedMods has "thermalfoundation"
	recipes.addShaped("mana",stuff,[[<ore:clathrateEnder>, <ore:dustPyrotheum>, <ore:clathrateOil>],[<ore:dustPetrotheum>, <ore:dustLead>, <ore:dustCryotheum>],[<ore:clathrateGlowstone>,<ore:dustAerotheum>,<ore:clathrateRedstone>]]);
	mods.qmd.target_chamber.addRecipe(stuff, ((<particle:positron>*120000)^8000)~2.6, <ore:dustLead>, null, <particle:heffalumpMatter>, null, 20000, 1.0, 0, 0.0021);
}else{
	recipes.addShaped("mana",stuff,[[<nuclearcraft:gem>, <nuclearcraft:gem:1>, <nuclearcraft:gem:2>],[<nuclearcraft:gem:6>, <ore:dustLead>, <nuclearcraft:gem:6>],[<nuclearcraft:gem:3>,<nuclearcraft:gem:4>,<nuclearcraft:gem:5>]]);
	mods.qmd.target_chamber.addRecipe(stuff, ((<particle:positron>*120000)^8000)~2.6, <ore:dustLead>, null, <particle:heffalumpMatter>, null, 20000, 1.0, 0, 0.0021);
}