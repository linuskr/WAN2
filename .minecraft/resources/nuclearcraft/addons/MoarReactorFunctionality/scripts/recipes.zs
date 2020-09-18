/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

import mods.nuclearcraft.Enricher;
import mods.nuclearcraft.ChemicalReactor;
import crafttweaker.item.IIngredient;
import mods.nuclearcraft.FissionHeating;
import mods.nuclearcraft.Turbine;
import mods.nuclearcraft.SolidFission;



/* -=-=-=-=-=-=-=-=- Normal HX Recipes -=-=-=-=-=-=-=-=- */
val crMatrix = [[275,250,425,400,350,525,450,500,550,575,725,325,475,1000,975,375,600,300,800,650,625,750,875,850,825,900,700,675,925,950,775,1025],[825,750,1275,1200,1050,1575,1350,1500,1650,1725,2175,975,1425,3000,2925,1125,1800,900,2400,1950,1875,2250,2625,2550,2475,2700,2100,2025,2775,2850,2325,3075],[2750,2500,4250,4000,3500,5250,4500,5000,5500,5750,7250,3250,4750,10000,9750,3750,6000,3000,8000,6500,6250,7500,8750,8500,8250,9000,7000,6750,9250,9500,7750,10250],[1375,1250,2125,2000,1750,2625,2250,2500,2750,2875,3625,1625,2375,5000,4875,1875,3000,1500,4000,3250,3125,3750,4375,4250,4125,4500,3500,3375,4625,4750,3875,5125],[165,150,255,240,210,315,270,300,330,345,435,195,285,600,585,225,360,180,480,390,375,450,525,510,495,540,420,405,555,570,465,615],[4125,3750,6375,6000,5250,7875,6750,7500,8250,8625,10875,4875,7125,15000,14625,5625,9000,4500,12000,9750,9375,11250,13125,12750,12375,13500,10500,10125,13875,14250,11625,15375]] as int[][];
val coolantIn = [<fluid:nak_hot>,<fluid:iron_nak_hot>,<fluid:redstone_nak_hot>,<fluid:quartz_nak_hot>,<fluid:obsidian_nak_hot>,<fluid:nether_brick_nak_hot>,<fluid:glowstone_nak_hot>,<fluid:lapis_nak_hot>,<fluid:gold_nak_hot>,<fluid:prismarine_nak_hot>,<fluid:slime_nak_hot>,<fluid:end_stone_nak_hot>,<fluid:purpur_nak_hot>,<fluid:diamond_nak_hot>,<fluid:emerald_nak_hot>,<fluid:copper_nak_hot>,<fluid:tin_nak_hot>,<fluid:lead_nak_hot>,<fluid:boron_nak_hot>,<fluid:lithium_nak_hot>,<fluid:magnesium_nak_hot>,<fluid:manganese_nak_hot>,<fluid:aluminum_nak_hot>,<fluid:silver_nak_hot>,<fluid:fluorite_nak_hot>,<fluid:villiaumite_nak_hot>,<fluid:carobbiite_nak_hot>,<fluid:arsenic_nak_hot>,<fluid:liquid_nitrogen_nak_hot>,<fluid:liquid_helium_nak_hot>,<fluid:enderium_nak_hot>,<fluid:cryotheum_nak_hot>] as IIngredient[];
val coolantOut = [<fluid:nak>,<fluid:iron_nak>,<fluid:redstone_nak>,<fluid:quartz_nak>,<fluid:obsidian_nak>,<fluid:nether_brick_nak>,<fluid:glowstone_nak>,<fluid:lapis_nak>,<fluid:gold_nak>,<fluid:prismarine_nak>,<fluid:slime_nak>,<fluid:end_stone_nak>,<fluid:purpur_nak>,<fluid:diamond_nak>,<fluid:emerald_nak>,<fluid:copper_nak>,<fluid:tin_nak>,<fluid:lead_nak>,<fluid:boron_nak>,<fluid:lithium_nak>,<fluid:magnesium_nak>,<fluid:manganese_nak>,<fluid:aluminum_nak>,<fluid:silver_nak>,<fluid:fluorite_nak>,<fluid:villiaumite_nak>,<fluid:carobbiite_nak>,<fluid:arsenic_nak>,<fluid:liquid_nitrogen_nak>,<fluid:liquid_helium_nak>,<fluid:enderium_nak>,<fluid:cryotheum_nak>] as IIngredient[];
val coolModifier = [144,192,15,60,540,240] as int[];
var transferIn = [<fluid:water>|<fluid:condensate_water>,<fluid:preheated_water>, <fluid:exhaust_steam>,<fluid:condensate_water>,<fluid:well_pressed_water>,<fluid:crap_steam>] as IIngredient[];
var transferOut = [<fluid:high_pressure_steam>,<fluid:high_pressure_steam>,<fluid:low_pressure_steam>,<fluid:preheated_water>,<fluid:super_critical_steam>,<fluid:high_pressure_steam>] as IIngredient[];
var transferModifier = [4,4,1,1,1,1] as int[];

//normal HX recipes
for i,array in crMatrix{
	for j,num in array{
		mods.nuclearcraft.ChemicalReactor.addRecipe(coolantIn[j].amount(coolModifier[i]), transferIn[i].amount(num), coolantOut[j].amount(coolModifier[i]), transferOut[i].amount(num*transferModifier[i]), 0.25, 0.0, 0.0);
	}
}

//steam powered HX recipes
mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:high_pressure_steam>*75, <fluid:exhaust_steam>*120, <fluid:steam>*300, <fluid:low_pressure_steam>*120, 0.075, 0.0, 0.0);
mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:high_pressure_steam>*80, <fluid:condensate_water>*16, <fluid:steam>*320, <fluid:preheated_water>*16, 0.075, 0.0, 0.0);


//condenser recipes
mods.nuclearcraft.Enricher.addRecipe(<minecraft:snowball>, <fluid:exhaust_steam>*16000, <fluid:condensate_water>*1000, 0.075, 0.0, 0.0);
mods.nuclearcraft.Enricher.addRecipe(<minecraft:snowball>, <fluid:low_quality_steam>*16000, <fluid:condensate_water>*500, 0.075, 0.0, 0.0);



/* -=-=-=-=-=-=-=-=- SuperCritical Water Recipes -=-=-=-=-=-=-=-=- */
//functionality
recipes.addShapeless(<contenttweaker:blaster> * 32,[<minecraft:tnt>]);
mods.nuclearcraft.Enricher.addRecipe(<contenttweaker:blaster>, <fluid:preheated_water>*16000, <fluid:well_pressed_water>*4000, 0.1, 0.0, 0.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:well_pressed_water>, <fluid:super_critical_steam>, 190);
mods.nuclearcraft.Turbine.addRecipe(<fluid:super_critical_steam>, <fluid:crap_steam>*16, 16.00, 16.00);

//sc steam powered HX recipes
mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam>*80, <fluid:crap_steam>*672, <fluid:steam>*5120, <fluid:high_pressure_steam>*672, 0.1, 0.0, 0.0);
mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam>*5, <fluid:exhaust_steam>*448, <fluid:steam>*320, <fluid:low_pressure_steam>*448, 0.1, 0.0, 0.0);
mods.nuclearcraft.ChemicalReactor.addRecipe(<fluid:super_critical_steam>*20, <fluid:condensate_water>*224, <fluid:steam>*1280, <fluid:preheated_water>*224, 0.1, 0.0, 0.0);



/* -=-=-=-=-=-=-=-=- Gas Turbine Recipes -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:nitrogen>*2, <fluid:hot_nitrogen>, 10);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_nitrogen>, <fluid:nitrogen>*2, 11.00, 2.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:carbon_dioxide>*3, <fluid:hot_carbon_dioxide>, 12);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_carbon_dioxide>, <fluid:carbon_dioxide>*3, 14.00, 3.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:helium>*4, <fluid:hot_helium>, 24);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_helium>, <fluid:helium>*4, 30.00, 4.00);

/* -=-=-=- QMD additions -=-=-=- */
if(loadedMods has "qmd"){
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:argon>*2, <fluid:hot_argon>, 10);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_argon>, <fluid:argon>*2, 12.00, 2.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:krypton>*5, <fluid:hot_krypton>, 14);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_krypton>, <fluid:krypton>*5, 17.00, 5.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:xenon>*6, <fluid:hot_xenon>, 18);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_xenon>, <fluid:xenon>*6, 22.00, 6.00);

mods.nuclearcraft.FissionHeating.addRecipe(<fluid:neon>*8, <fluid:hot_neon>, 20);
mods.nuclearcraft.Turbine.addRecipe(<fluid:hot_neon>, <fluid:neon>*8, 25.00, 8.00);
}

/* -=-=-=-=-=-=-=-=- SC CO2 Recipes -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.Enricher.addRecipe(<contenttweaker:blaster>, <fluid:hot_carbon_dioxide>*16000, <fluid:compr_carbon_dioxide>*4000, 0.1, 0.0, 0.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:compr_carbon_dioxide>,<fluid:supercritical_carbon_dioxide>, 64);
mods.nuclearcraft.Turbine.addRecipe(<fluid:supercritical_carbon_dioxide>,<fluid:critical_exhaust_carbon_dioxide>*8,24.0,8.0);
mods.nuclearcraft.FissionHeating.addRecipe(<fluid:critical_exhaust_carbon_dioxide>*8,<fluid:compr_carbon_dioxide>, 8);


/* -=-=-=-=-=-=-=-=- Heavy Water Recipe -=-=-=-=-=-=-=-=- */
mods.nuclearcraft.Centrifuge.addRecipe(<fluid:water>*1600, <fluid:condensate_water>*1590, <fluid:heavy_water>*10, null, null , 1.0, 1.0, 0.0);


/* -=-=-=-=-=-=-=-=- Pebble Transfer -=-=-=-=-=-=-=-=- */
val pebbles = [<ore:ingotTBUTRISO>,<ore:ingotLEU233TRISO>,<ore:ingotHEU233TRISO>,<ore:ingotLEU235TRISO>,<ore:ingotHEU235TRISO>,<ore:ingotLEN236TRISO>,<ore:ingotHEN236TRISO>,<ore:ingotLEP239TRISO>,<ore:ingotHEP239TRISO>,<ore:ingotLEP241TRISO>,<ore:ingotHEP241TRISO>,<ore:ingotMIX239TRISO>,<ore:ingotMIX241TRISO>,<ore:ingotLEA242TRISO>,<ore:ingotHEA242TRISO>,<ore:ingotLECm243TRISO>,<ore:ingotHECm243TRISO>,<ore:ingotLECm245TRISO>,<ore:ingotHECm245TRISO>,<ore:ingotLECm247TRISO>,<ore:ingotHECm247TRISO>,<ore:ingotLEB248TRISO>,<ore:ingotHEB248TRISO>,<ore:ingotLECf249TRISO>,<ore:ingotHECf249TRISO>,<ore:ingotLECf251TRISO>,<ore:ingotHECf251TRISO>] as IIngredient[];
val dpebbles = [<ore:ingotDepletedTBUTRISO>,<ore:ingotDepletedLEU233TRISO>,<ore:ingotDepletedHEU233TRISO>,<ore:ingotDepletedLEU235TRISO>,<ore:ingotDepletedHEU235TRISO>,<ore:ingotDepletedLEN236TRISO>,<ore:ingotDepletedHEN236TRISO>,<ore:ingotDepletedLEP239TRISO>,<ore:ingotDepletedHEP239TRISO>,<ore:ingotDepletedLEP241TRISO>,<ore:ingotDepletedHEP241TRISO>,<ore:ingotDepletedMIX239TRISO>,<ore:ingotDepletedMIX241TRISO>,<ore:ingotDepletedLEA242TRISO>,<ore:ingotDepletedHEA242TRISO>,<ore:ingotDepletedLECm243TRISO>,<ore:ingotDepletedHECm243TRISO>,<ore:ingotDepletedLECm245TRISO>,<ore:ingotDepletedHECm245TRISO>,<ore:ingotDepletedLECm247TRISO>,<ore:ingotDepletedHECm247TRISO>,<ore:ingotDepletedLEB248TRISO>,<ore:ingotDepletedHEB248TRISO>,<ore:ingotDepletedLECf249TRISO>,<ore:ingotDepletedHECf249TRISO>,<ore:ingotDepletedLECf251TRISO>,<ore:ingotDepletedHECf251TRISO>] as IIngredient[];
//lifetime, heat, criticality
val pebInts = [[12960,44,211],[2399,240,70],[2399,720,35],[4320,133,92],[4320,399,46],[1775,324,63],[1775,972,32],[4115,140,89],[4115,420,45],[2848,202,76],[2848,606,38],[3917,147,85],[2713,213,72],[1328,433,59],[1328,1299,30],[1350,427,59],[1350,1281,30],[2178,264,68],[2178,792,34],[1935,298,65],[1935,894,33],[1949,296,66],[1949,888,33],[959,600,54],[959,1800,27],[1800,320,64],[1800,960,32]] as int[][];
//efficiency, radiation
val pebDoubles = [[1.25,5.157E-4],[1.1, 6.400E-4],[1.15, 5.159E-4],[1.0,5.159E-4],[1.05,5.159E-4],[1.1,6.398E-4],[1.15,6.598E-4],[1.2,5.287E-4],[1.25,7.132E-4],[1.25,6.417E-4],[1.3,0.001026],[1.05,6.401E-4],[1.15,7.641E-4],[1.35,5.376E-4],[1.4,6.167E-4],[1.45,5.882E-4],[1.5,7.070E-4],[1.5,5.278E-4],[1.55,5.271E-4],[1.55,5.323E-4],[1.6,5.355E-4],[1.65,5.502E-4],[1.7,0.002534],[1.75,0.01108],[1.8,0.008580],[1.8,0.01107],[1.85,0.009098]] as double[][];
val pebPrime = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true,true,true,true] as bool[];
mods.nuclearcraft.PebbleFission.removeAllRecipes();
for i, item in pebbles{
	mods.nuclearcraft.SolidFission.addRecipe(item, dpebbles[i], pebInts[i][0], pebInts[i][1], pebDoubles[i][0], pebInts[i][2], pebPrime[i], pebDoubles[i][1]);
}


