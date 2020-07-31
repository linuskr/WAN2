/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

// this code adds most of the items' recipes

// imports
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


// isotopes recipes
val IsoNames= [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>],[<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>]] as IIngredient[][];
val isoN2 = [<contenttweaker:californium53>,<contenttweaker:californium54>,<contenttweaker:einsteinium54>,<contenttweaker:einsteinium55>,<contenttweaker:fermium57>] as IItemStack[];

val decays = [[<ore:ingotCalifornium249>,<ore:ingotCalifornium249Carbide>,<ore:ingotCalifornium249Oxide>,<ore:ingotCalifornium249Nitride>,<ore:ingotCalifornium249ZA>],[<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>],[<ore:ingotCurium246>,<ore:ingotCurium246Carbide>,<ore:ingotCurium246Oxide>,<ore:ingotCurium246Nitride>,<ore:ingotCurium246ZA>], [<ore:ingotCalifornium251>,<ore:ingotCalifornium251Carbide>,<ore:ingotCalifornium251Oxide>,<ore:ingotCalifornium251Nitride>,<ore:ingotCalifornium251ZA>],[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>]] as IIngredient[][];
//cf-250 skipped over due to balancing concerns


val graphite = <ore:ingotGraphite>|<ore:dustGraphite>;
val zirconium = <ore:ingotZirconium>|<ore:dustZirconium>;
for i,array in IsoNames{
	// adding carbides
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	// adding oxides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	// adding nitrides
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	// adding zirconium alloys
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	// recipes for normal
	furnace.addRecipe(isoN2[i], array[1]);
	furnace.addRecipe(isoN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//adding decays
	for j,item in array{
		mods.nuclearcraft.DecayHastener.addRecipe(item, decays[i][j]);
	}
}






// fuels recipes
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- LE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val fis = [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>]] as IIngredient[][];
val fer = [[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>]] as IIngredient[][];

var FuelNames = [["californium_fuel","californium_fuel_carbide","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium"],["einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium"]] as string[][];
var allFuels = [[<contenttweaker:californium_fuel>,<contenttweaker:californium_fuel_carbide>,<contenttweaker:californium_fuel_oxide>,<contenttweaker:californium_fuel_nitride>,<contenttweaker:californium_fuel_zirconium>],[<contenttweaker:einsteinium_fuel>,<contenttweaker:einsteinium_fuel_carbide>,<contenttweaker:einsteinium_fuel_oxide>,<contenttweaker:einsteinium_fuel_nitride>,<contenttweaker:einsteinium_fuel_zirconium>]] as IItemStack[][];
var fuelN2 = [<contenttweaker:californium_fuel>,<contenttweaker:einsteinium_fuel>] as IItemStack[];

// time, heat, criticality
val fuelStats = [[[450,1280,25],[288,2000,17]],[[550,1048,31],[352,1638,21]]] as int[][][];
var fuelCrits = [[20],[25]] as int[][];

var trisoFuels = [<contenttweaker:californium_fuel_triso>,<contenttweaker:einsteinium_fuel_triso>] as IItemStack[];
var dFuels = [[<contenttweaker:dcalifornium_fuel_triso>,<contenttweaker:dcalifornium_fuel_oxide>,<contenttweaker:dcalifornium_fuel_nitride>,<contenttweaker:dcalifornium_fuel_zirconium>],[<contenttweaker:deinsteinium_fuel_triso>,<contenttweaker:deinsteinium_fuel_oxide>,<contenttweaker:deinsteinium_fuel_nitride>,<contenttweaker:deinsteinium_fuel_zirconium>]] as IIngredient[][];
// time, heat, criticality
val trisoStats = [[360,1600,17],[440,1310,21]] as int[][];
// efficiency, radiation
var trisoStatsAlt = [[1.9,0.0809],[2.0,0.22]] as double[][];
for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(FuelNames[i][j],item,[fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
	}
	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(fuelN2[i], array[1]);
	furnace.addRecipe(fuelN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0], fer[i][0]*8);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], true, trisoStatsAlt[i][1]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelCrits[i][0], true, trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], true, trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], fuelStats[i][1][2], true, trisoStatsAlt[i][1]);
}

// reprocessing the depleted fuels
var dIso = [[[fer[0][1].amount(2),fer[0][1].amount(2),fer[1][1].amount(2),fis[1][1]], [fer[0][2].amount(2),fer[0][2].amount(2),fer[1][2].amount(2),fis[1][2]], [fer[0][3].amount(2),fer[0][3].amount(2),fer[1][3].amount(2),fis[1][3]], [fer[0][4].amount(2),fer[0][4].amount(2),fer[1][4].amount(2),fis[1][4]]], [[fis[1][1],fer[1][1].amount(3),fer[1][1].amount(3),<contenttweaker:fermium57carbide>],[fis[1][2],fer[1][2].amount(3),fer[1][2].amount(3),<contenttweaker:fermium57oxide>],[fis[1][3],fer[1][3].amount(3),fer[1][3].amount(3),<contenttweaker:fermium57nitride>],[fis[1][4],fer[1][4].amount(3),fer[1][4].amount(3),<contenttweaker:fermium57zirconium>]] ] as IIngredient[][][];

for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], <ore:dustGraphite>.amount(3), dIso[i][0][2], dIso[i][0][3], <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], null, dIso[i][1][2], dIso[i][1][3], null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], null, dIso[i][2][2], dIso[i][2][3], null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], <nuclearcraft:dust:10>, dIso[i][3][2], dIso[i][3][3], null);
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- MX Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val mxFuelNames = ["fermium_fuel","fermium_fuel_carbide","fermium_fuel_oxide","fermium_fuel_nitride","fermium_fuel_zirconium"] as string[];
val mxFuels = [<contenttweaker:fermium_fuel>,<contenttweaker:fermium_fuel_carbide>,<contenttweaker:fermium_fuel_oxide>,<contenttweaker:fermium_fuel_nitride>,<contenttweaker:fermium_fuel_zirconium>] as IItemStack[];

val fm257 = [<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>] as IItemStack[];
val am243 = [<ore:ingotAmericium243>,<ore:ingotAmericium243Carbide>,<ore:ingotAmericium243Oxide>,<ore:ingotAmericium243Nitride>,<ore:ingotAmericium243ZA>] as IIngredient[];
val bk247 = [<ore:ingotBerkelium247>,<ore:ingotBerkelium247Carbide>,<ore:ingotBerkelium247Oxide>,<ore:ingotBerkelium247Nitride>,<ore:ingotBerkelium247ZA>] as IIngredient[];
val cf254 = [<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>] as IItemStack[];

for j,item in mxFuels{
	//crafting
	recipes.addShapeless(mxFuelNames[j],item,[fm257[j], fm257[j], fm257[j], am243[j], am243[j], bk247[j], bk247[j], fer[0][j], cf254[j]]);
}
//non-crafting recipes
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], graphite, mxFuels[1]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:oxygen>*1000, mxFuels[2]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:nitrogen>*1000, mxFuels[3]);
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], zirconium, mxFuels[4]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[1]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[2]);
mods.nuclearcraft.Separator.addRecipe(mxFuels[1], mxFuels[0], <nuclearcraft:dust:8>);
mods.nuclearcraft.Separator.addRecipe(mxFuels[4], mxFuels[0], <nuclearcraft:dust:10>);

val dmxFuels = [<contenttweaker:dfermium_fuel_triso>,<contenttweaker:dfermium_fuel_oxide>,<contenttweaker:dfermium_fuel_nitride>,<contenttweaker:dfermium_fuel_zirconium>] as IItemStack[];

val mxeff = 2.1;
val mxrad = 0.0483; 

//pebbles
mods.nuclearcraft.Assembler.addRecipe(mxFuels[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, <contenttweaker:fermium_fuel_triso>*9);
mods.nuclearcraft.PebbleFission.addRecipe(<contenttweaker:fermium_fuel_triso>, dmxFuels[0], 760, 2430, mxeff, 37, true, mxrad);
//oxide
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[2], dmxFuels[1], 760, 2430, mxeff, 44, true, mxrad);
//nitride
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[3], dmxFuels[2], 950, 1944, mxeff, 55, true, mxrad);
//zirconium
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[4], dmxFuels[3], 608, 3088, mxeff, 37, true, mxrad);


//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[0] * 9, <ore:ingotCurium245Carbide> * 2, <ore:ingotCalifornium250Carbide> * 2, <ore:dustGraphite>.amount(4), fer[0][0] * 2, fis[1][0], <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[1] * 9, <ore:ingotCurium245Oxide> * 2, <ore:ingotCalifornium250Oxide> * 2, null, fer[0][1] * 2, fis[1][1],null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[2] * 9, <ore:ingotCurium245Nitride>* 2, <ore:ingotCalifornium250Nitride> * 2, null, fer[0][2] * 2, fis[1][2],null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[3] * 9, <ore:ingotCurium245ZA> * 2, <ore:ingotCalifornium250ZA> * 2, <nuclearcraft:dust:10>, fer[0][3] * 2, fis[1][3], null);



/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- HE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
FuelNames = [["hcalifornium_fuel","hcalifornium_fuel_carbide","hcalifornium_fuel_oxide","hcalifornium_fuel_nitride","hcalifornium_fuel_zirconium"],["heinsteinium_fuel","heinsteinium_fuel_carbide","heinsteinium_fuel_oxide","heinsteinium_fuel_nitride","heinsteinium_fuel_zirconium"]];
allFuels = [[<contenttweaker:hcalifornium_fuel>,<contenttweaker:hcalifornium_fuel_carbide>,<contenttweaker:hcalifornium_fuel_oxide>,<contenttweaker:hcalifornium_fuel_nitride>,<contenttweaker:hcalifornium_fuel_zirconium>],[<contenttweaker:heinsteinium_fuel>,<contenttweaker:heinsteinium_fuel_carbide>,<contenttweaker:heinsteinium_fuel_oxide>,<contenttweaker:heinsteinium_fuel_nitride>,<contenttweaker:heinsteinium_fuel_zirconium>]];
fuelN2 = [<contenttweaker:hcalifornium_fuel>,<contenttweaker:heinsteinium_fuel>];

fuelCrits = [[9,10,13],[11,13,16]];

trisoFuels = [<contenttweaker:hcalifornium_fuel_triso>,<contenttweaker:heinsteinium_fuel_triso>];
dFuels = [[<contenttweaker:dhcalifornium_fuel_triso>,<contenttweaker:dhcalifornium_fuel_oxide>,<contenttweaker:dhcalifornium_fuel_nitride>,<contenttweaker:dhcalifornium_fuel_zirconium>],[<contenttweaker:dheinsteinium_fuel_triso>,<contenttweaker:dheinsteinium_fuel_oxide>,<contenttweaker:dheinsteinium_fuel_nitride>,<contenttweaker:dheinsteinium_fuel_zirconium>]];

trisoStatsAlt = [[1.95,0.174],[2.05,0.187]] as double[][];


for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(FuelNames[i][j],item,[fis[i][j], fis[i][j], fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
	}
	//non-crafting recipes
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], graphite, array[1]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:oxygen>*1000, array[2]);
	mods.nuclearcraft.Infuser.addRecipe(array[0], <fluid:nitrogen>*1000, array[3]);
	mods.nuclearcraft.AlloyFurnace.addRecipe(array[0], zirconium, array[4]);
	furnace.addRecipe(fuelN2[i], array[1]);
	furnace.addRecipe(fuelN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0]*3, fer[i][0]*6);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], (3 * trisoStats[i][1]), trisoStatsAlt[i][0], fuelCrits[i][0], true, trisoStatsAlt[i][1]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], (3 * trisoStats[i][1]), trisoStatsAlt[i][0], fuelCrits[i][1], true, trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], (3 * fuelStats[i][0][1]), trisoStatsAlt[i][0], fuelCrits[i][2], true, trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], (3 * fuelStats[i][1][1]), trisoStatsAlt[i][0], fuelCrits[i][0], true, trisoStatsAlt[i][1]);
}

// reprocessing the depleted fuels
dIso = [[[fer[0][1].amount(2),<contenttweaker:californium54carbide>,fer[1][1],fis[1][1].amount(3)], [fer[0][2].amount(2),<contenttweaker:californium54oxide>,fer[1][2],fis[1][2].amount(3)], [fer[0][3].amount(2),<contenttweaker:californium54nitride>,fer[1][3],fis[1][3].amount(3)], [fer[0][4].amount(2),<contenttweaker:californium54zirconium>,fer[1][4],fis[1][4].amount(3)]], [[fer[1][1],fer[1][1],fer[1][1].amount(2),<contenttweaker:fermium57carbide> * 3],[fer[1][2],fer[1][2],fer[1][2].amount(2),<contenttweaker:fermium57oxide> * 3],[fer[1][3],fer[1][3],fer[1][3].amount(2),<contenttweaker:fermium57nitride> * 3],[fer[1][4],fer[1][4],fer[1][4].amount(2),<contenttweaker:fermium57zirconium> *3 ]]] as IIngredient[][][];

for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], <ore:dustGraphite>.amount(4), dIso[i][0][2], dIso[i][0][3], <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], null, dIso[i][1][2], dIso[i][1][3],null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], null, dIso[i][2][2], dIso[i][2][3],null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], <nuclearcraft:dust:10> * 2, dIso[i][3][2], dIso[i][3][3], null);
}
