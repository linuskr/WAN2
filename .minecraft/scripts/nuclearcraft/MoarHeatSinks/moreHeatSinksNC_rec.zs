/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.nuclearcraft.Infuser;

val emptyHeat = <nuclearcraft:part:14>;
val ingotHeatSinks = [<nuclearcraft:solid_fission_sink_steel>,<nuclearcraft:solid_fission_sink_ferroboron>,<nuclearcraft:solid_fission_sink_tough_alloy>,<nuclearcraft:solid_fission_sink_limno2>,<nuclearcraft:solid_fission_sink_mgb2>,<nuclearcraft:solid_fission_sink_zirconium>,<nuclearcraft:solid_fission_sink_hard_carbon>,<nuclearcraft:solid_fission_sink_extreme_alloy>,<nuclearcraft:solid_fission_sink_thermoconducting_alloy>,<nuclearcraft:solid_fission_sink_zircaloy>,<nuclearcraft:solid_fission_sink_sic_sic_cmc>,<nuclearcraft:solid_fission_sink_hsla>] as IItemStack[];
val ingots = [<ore:ingotSteel>,<ore:ingotFerroboron>,<ore:ingotTough>,<ore:ingotLithiumManganeseDioxide>,<ore:ingotMagnesiumDiboride>,<ore:ingotZirconium>,<ore:ingotHardCarbon>,<ore:ingotExtreme>,<ore:ingotThermoconducting>,<ore:ingotZircaloy>,<ore:ingotSiCSiCCMC>,<ore:ingotHSLASteel>] as IIngredient[];

for i,ingot in ingots{
	recipes.addShaped(ingotHeatSinks[i], [[null,ingot,null],[ingot,emptyHeat,ingot],[null,ingot,null]]);
}


val gemHeatSinks = [<nuclearcraft:solid_fission_sink_boron_arsenide>,<nuclearcraft:solid_fission_sink_boron_nitride>,<nuclearcraft:solid_fission_sink_rhodochrosite>] as IItemStack[];
val gems = [<ore:gemBoronArsenide>,<ore:gemBoronNitride>,<ore:gemRhodochrosite>] as IIngredient[];

for i,gem in gems{
	recipes.addShaped(gemHeatSinks[i], [[gem,gem,gem],[gem,emptyHeat,gem],[gem,gem,gem]]);
}

recipes.addShaped(<nuclearcraft:solid_fission_sink_smore>, [[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>],[<nuclearcraft:moresmore>,emptyHeat,<nuclearcraft:moresmore>],[<nuclearcraft:smore>,<nuclearcraft:foursmore>,<nuclearcraft:smore>]]);



//need liquid oxygen: 400t, 12RF/t blue
mods.nuclearcraft.Infuser.addRecipe(emptyHeat, <fluid:oxygen>*1000, <nuclearcraft:solid_fission_sink_liquid_oxygen>);
mods.nuclearcraft.Infuser.addRecipe(emptyHeat, <fluid:corium>*1000, <nuclearcraft:solid_fission_sink_corium>);

mods.nuclearcraft.Radiation.setRadiationLevel(<nuclearcraft:solid_fission_sink_corium>, 0.000114);