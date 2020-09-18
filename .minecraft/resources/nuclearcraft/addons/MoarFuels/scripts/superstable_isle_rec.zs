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

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- QMD Processing -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */

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


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- QMD Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
// this is a separate/extra multiplier beyond NC's base multiplier
// (meaning this only affects MoarFuels' fuels, while NC's config
// affects both NC's & MoarFuels' fuels)
// only accepts an integer value
val lifetimeMultiplier = 1;

/* -=-=-=-=- MIX Fuels -=-=-=-=-*/
val graphite = <ore:ingotGraphite>|<ore:dustGraphite>;
val zirconium = <ore:ingotZirconium>|<ore:dustZirconium>;
var fis = [[<contenttweaker:mendelevium58>,<contenttweaker:mendelevium58carbide>,<contenttweaker:mendelevium58oxide>,<contenttweaker:mendelevium58nitride>,<contenttweaker:mendelevium58zirconium>],[<contenttweaker:flerovium98>,<contenttweaker:flerovium98carbide>,<contenttweaker:flerovium98oxide>,<contenttweaker:flerovium98nitride>,<contenttweaker:flerovium98zirconium>]] as IIngredient[][];
var fer = [[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>],[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>]] as IIngredient[][];
var decayRad = [1.12,0.336,3.70e-6,1.04e-5] as double[];

var FuelNames = [["mendelevium_fuel","mendelevium_fuel_carbide","mendelevium_fuel_oxide","mendelevium_fuel_nitride","mendelevium_fuel_zirconium"],["flerovium_fuel","flerovium_fuel_carbide","flerovium_fuel_triso","flerovium_fuel_oxide","flerovium_fuel_nitride","flerovium_fuel_zirconium"]] as string[][];
var allFuels = [[<contenttweaker:mendelevium_fuel>,<contenttweaker:mendelevium_fuel_carbide>,<contenttweaker:mendelevium_fuel_oxide>,<contenttweaker:mendelevium_fuel_nitride>,<contenttweaker:mendelevium_fuel_zirconium>],[<contenttweaker:flerovium_fuel>,<contenttweaker:flerovium_fuel_carbide>,<contenttweaker:flerovium_fuel_oxide>,<contenttweaker:flerovium_fuel_nitride>,<contenttweaker:flerovium_fuel_zirconium>]] as IItemStack[][];
var fuelN2 = [<contenttweaker:californium_fuel>,<contenttweaker:flerovium_fuel>] as IItemStack[];

// time, heat, criticality
var fuelStats = [[[lifetimeMultiplier*1200,3389,21],[lifetimeMultiplier*768,5295,14]],[[lifetimeMultiplier*7100,1696,60],[lifetimeMultiplier*4544,2650,41]]] as int[][][];
var fuelCrits = [[17],[48]] as int[][];

var trisoFuels = [<contenttweaker:mendelevium_fuel_triso>,<contenttweaker:flerovium_fuel_triso>] as IItemStack[];
var dFuels = [[<contenttweaker:dmendelevium_fuel_triso>,<contenttweaker:dmendelevium_fuel_oxide>,<contenttweaker:dmendelevium_fuel_nitride>,<contenttweaker:dmendelevium_fuel_zirconium>],[<contenttweaker:dflerovium_fuel_triso>,<contenttweaker:dflerovium_fuel_oxide>,<contenttweaker:dflerovium_fuel_nitride>,<contenttweaker:dflerovium_fuel_zirconium>]] as IIngredient[][];
// time, heat, criticality
var trisoStats = [[lifetimeMultiplier*960,4236,14],[lifetimeMultiplier*5680,2120,51]] as int[][];
// efficiency, radiation
var trisoStatsAlt = [[2.15,0.00233],[3.3,0.00110]] as double[][];
for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(FuelNames[i][j],item * 9,[fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
	}
	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(fuelN2[i], array[3]);
	furnace.addRecipe(fuelN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0], fer[i][0]*8);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], true, trisoStatsAlt[i][1]);
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelCrits[i][0], true, trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], true, trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], fuelStats[i][1][2], true, trisoStatsAlt[i][1]);
}

// reprocessing
var ddecayRad = [0.336,0.336,1.30e-6,1.52e-6] as double[];
for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), fer[i][1].amount(2), fer[i][1].amount(2), <ore:dustGraphite>.amount(3), fer[i][1].amount(2), fer[i][1].amount(2), <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), fer[i][2].amount(2), fer[i][2].amount(2), null, fer[i][2].amount(2), fer[i][2].amount(2), null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), fer[i][3].amount(2), fer[i][3].amount(2), null, fer[i][3].amount(2), fer[i][3].amount(2), null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), fer[i][4].amount(2), fer[i][4].amount(2), <nuclearcraft:dust:10>, fer[i][4].amount(2), fer[i][4].amount(2), null);
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
	}
}


/* -=-=-=-=- Pa-231 Based Fuels -=-=-=-=-*/
val paFuels = [[<contenttweaker:protactinium_fuel>,<contenttweaker:protactinium_fuel_carbide>,<contenttweaker:protactinium_fuel_oxide>,<contenttweaker:protactinium_fuel_nitride>,<contenttweaker:protactinium_fuel_zirconium>],[<contenttweaker:hprotactinium_fuel>,<contenttweaker:hprotactinium_fuel_carbide>,<contenttweaker:hprotactinium_fuel_oxide>,<contenttweaker:hprotactinium_fuel_nitride>,<contenttweaker:hprotactinium_fuel_zirconium>]] as IIngredient[][];
val dpaFuels = [[<contenttweaker:dprotactinium_fuel_triso>,<contenttweaker:dprotactinium_fuel_oxide>,<contenttweaker:dprotactinium_fuel_nitride>,<contenttweaker:dprotactinium_fuel_zirconium>],[<contenttweaker:dhprotactinium_fuel_triso>,<contenttweaker:dhprotactinium_fuel_oxide>,<contenttweaker:dhprotactinium_fuel_nitride>,<contenttweaker:dhprotactinium_fuel_zirconium>]] as IIngredient[][];

val paeff = [1.3,1.35] as double[];
val paStats = [[[lifetimeMultiplier*9600,60,160],[lifetimeMultiplier*12000,48,200],[lifetimeMultiplier*7680,130,136]],[[lifetimeMultiplier*9600,180,80],[lifetimeMultiplier*12000,144,80],[lifetimeMultiplier*7680,225,68]]] as int[][][];
val burnrad = 5.16e-4;
val pebbles = [<contenttweaker:protactinium_fuel_triso>,<contenttweaker:hprotactinium_fuel_triso>] as IItemStack[];

//base recipe
mods.nuclearcraft.Assembler.addRecipe(<ore:dustProtactinium231>, <ore:ingotTBU>*8, null, null, paFuels[0][0]*9);
mods.nuclearcraft.Assembler.addRecipe(<ore:dustProtactinium231>*2, paFuels[0][0]*6, null, null, paFuels[1][0]*8);

//non-base recipes
for i, array in paFuels{
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i+2]);
	}
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(<contenttweaker:protactinium_fuel>, array[3]);
	furnace.addRecipe(<contenttweaker:protactinium_fuel>, array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, pebbles[i]*9);
mods.nuclearcraft.PebbleFission.addRecipe(pebbles[i], dpaFuels[i][0], paStats[i][0][0], paStats[i][0][1], paeff[i], paStats[i][2][2], false, burnrad);
	mods.nuclearcraft.Radiation.setRadiationLevel(pebbles[i], decayRad[i+2]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dpaFuels[i][1], paStats[i][0][0], paStats[i][0][1], paeff[i], paStats[i][0][2], false, burnrad);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dpaFuels[i][2], paStats[i][1][0], paStats[i][1][1], paeff[i], paStats[i][1][2], false, burnrad);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dpaFuels[i][3], paStats[i][2][0], paStats[i][2][1], paeff[i], paStats[i][2][2], false, burnrad);
}


//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][0] * 9, <ore:ingotTBUCarbide> * 4, <ore:ingotUranium233Carbide>, <ore:dustGraphite>.amount(4), <ore:ingotUranium234>, <ore:ingotUranium235Carbide>*2, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][1] * 9, <ore:ingotTBUOxide> * 4, <ore:ingotUranium233Oxide>, null, <ore:ingotUranium234>, <ore:ingotUranium235Oxide>*2,null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][2] * 9, <ore:ingotTBUNitride> * 4, <ore:ingotUranium233Nitride>, null, <ore:ingotUranium234>, <ore:ingotUranium235Nitride>*2,null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[0][3] * 9, <ore:ingotTBUZA> * 4, <ore:ingotUranium233ZA>, <nuclearcraft:dust:10> * 2, <ore:ingotUranium234>, <ore:ingotUranium235ZA>*2, null);

//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][0] * 9, <ore:ingotTBUCarbide> * 2, <ore:ingotUranium233Carbide>*2, <ore:dustGraphite>.amount(4), <ore:ingotUranium235Carbide>*2, <ore:ingotNeptunium237Carbide>, <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][1] * 9, <ore:ingotTBUOxide> * 2, <ore:ingotUranium233Oxide>*2, null, <ore:ingotUranium235Oxide>*2, <ore:ingotNeptunium237Oxide>, null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][2] * 9, <ore:ingotTBUNitride> * 2, <ore:ingotUranium233Nitride>*2, null, <ore:ingotUranium235Nitride>*2, <ore:ingotNeptunium237Nitride>,null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dpaFuels[1][3] * 9, <ore:ingotTBUZA> * 2, <ore:ingotUranium233ZA>*2, <nuclearcraft:dust:10> * 2, <ore:ingotUranium235ZA>*2, <ore:ingotNeptunium237ZA>, null);
for i,array in dpaFuels{
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
	}
}


/* -=-=-=-=- Isotope Stuff -=-=-=-=-*/
val qIsoNames= [[<contenttweaker:mendelevium58>,<contenttweaker:mendelevium58carbide>,<contenttweaker:mendelevium58oxide>,<contenttweaker:mendelevium58nitride>,<contenttweaker:mendelevium58zirconium>],[<contenttweaker:flerovium98>,<contenttweaker:flerovium98carbide>,<contenttweaker:flerovium98oxide>,<contenttweaker:flerovium98nitride>,<contenttweaker:flerovium98zirconium>]] as IIngredient[][];
val qisoN2 = [<contenttweaker:mendelevium58>,<contenttweaker:flerovium98>] as IItemStack[];

val qdecays = [<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>] as IIngredient[];
decayRad = [7.09,1.0e-9] as double[];

for i,array in qIsoNames{
	// adding carbides
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	// adding oxides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	// adding nitrides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	// adding zirconium alloys
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	// recipes for normal
	furnace.addRecipe(qisoN2[i], array[3]);
	furnace.addRecipe(qisoN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//adding decays
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
		if (i!=1){
			mods.nuclearcraft.DecayHastener.addRecipe(item, qdecays[j],1.0,1.0,decayRad[i]);
		}
	}
}
var uran = <ore:ingotUranium235>;
mods.nuclearcraft.DecayHastener.removeRecipeWithInput(uran);
uran = <ore:ingotUranium235>|<ore:ingotUranium235Oxide>|<ore:ingotUranium235Nitride>;
mods.nuclearcraft.DecayHastener.addRecipe(uran, <ore:dustProtactinium231>,1.0,1.0,1.42e-9);

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Improved RTGs -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val radioIso = [<ore:ingotCobalt60>,<ore:ingotStrontium90>,<ore:ingotPromethium147>] as IIngredient[];
val decayIso = [<ore:dustNickel>,<ore:dustZirconium>,<ore:ingotNeodymium>] as IIngredient[];
val red = <ore:dustRedstone>;
val sige = <contenttweaker:si_ge>;
var input = [<contenttweaker:rtg_co>,<contenttweaker:rtg_sr>,<contenttweaker:rtg_pm>] as IIngredient[];
var output = [<contenttweaker:rtg_co_done>,<contenttweaker:rtg_sr_done>,<contenttweaker:rtg_pm_done>] as IIngredient[];
//mean lifetime, power, radiation
var rtgstats = [[12660.0,420.0,1.71],[69000.0,77.0,1.0,0.342],[6300.0,67.0,0.171]] as double[][];
for i,item in input{
	mods.nuclearcraft.Assembler.addRecipe(radioIso[i].amount(9), <nuclearcraft:rad_shielding:2>*4, red*2, sige*2, item);
	mods.nuclearcraft.DecayGenerator.addRecipe(item, output[i], rtgstats[i][0], rtgstats[i][1], rtgstats[i][2]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(output[i], decayIso[i].amount(9), <nuclearcraft:rad_shielding:2>*4, null, red*2, sige*2, null);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, rtgstats[i][2]);
}