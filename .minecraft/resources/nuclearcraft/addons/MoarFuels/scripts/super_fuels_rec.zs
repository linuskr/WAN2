/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

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
/* import mods.nuclearcraft.FissionIrradiator; */
import mods.nuclearcraft.PebbleFission;
import mods.nuclearcraft.SolidFission;
import mods.nuclearcraft.RockCrusher;


// this is a separate/extra multiplier beyond NC's base multiplier
// (meaning this only affects MoarFuels' fuels, while NC's config
// affects both NC's & MoarFuels' fuels)
// only accepts an integer value
val lifetimeMultiplier = 1;

// isotopes recipes
val IsoNames= [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:californium54>,<contenttweaker:californium54carbide>,<contenttweaker:californium54oxide>,<contenttweaker:californium54nitride>,<contenttweaker:californium54zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>],[<contenttweaker:fermium57>,<contenttweaker:fermium57carbide>,<contenttweaker:fermium57oxide>,<contenttweaker:fermium57nitride>,<contenttweaker:fermium57zirconium>]] as IIngredient[][];
//val radName= [<ore:Californium253>,<ore:Californium254>,<ore:Einsteinium254>,<ore:Einsteinium255>,<ore:Fermium257>] as IOreDictEntry[];
val isoN2 = [<contenttweaker:californium53>,<contenttweaker:californium54>,<contenttweaker:einsteinium54>,<contenttweaker:einsteinium55>,<contenttweaker:fermium57>] as IItemStack[];

val decays = [[<ore:ingotCalifornium249>,<ore:ingotCalifornium249Carbide>,<ore:ingotCalifornium249Oxide>,<ore:ingotCalifornium249Nitride>,<ore:ingotCalifornium249ZA>],[<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>,<ore:dustLead>],[<ore:ingotCurium246>,<ore:ingotCurium246Carbide>,<ore:ingotCurium246Oxide>,<ore:ingotCurium246Nitride>,<ore:ingotCurium246ZA>], [<ore:ingotCalifornium251>,<ore:ingotCalifornium251Carbide>,<ore:ingotCalifornium251Oxide>,<ore:ingotCalifornium251Nitride>,<ore:ingotCalifornium251ZA>],[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>]] as IIngredient[][];
var decayRad = [20.5, 6.04, 1.32, 9.18, 3.63] as double[];
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
	furnace.addRecipe(isoN2[i], array[3]);
	furnace.addRecipe(isoN2[i], array[2]);
	mods.nuclearcraft.Separator.addRecipe(array[1], array[0], <nuclearcraft:dust:8>);
	mods.nuclearcraft.Separator.addRecipe(array[4], array[0], <nuclearcraft:dust:10>);
	//adding decays
	for j,item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[i]);
		if (i!=1 | (j!=1 & j!=4)){
			mods.nuclearcraft.DecayHastener.addRecipe(item, decays[i][j],1.0,1.0,decayRad[i]);
		}
	}
}



//oreDic
//val oreDictEnt = <ore:ingotEinsteinium255>;
//oreDictEnt.add(<contenttweaker:einsteinium55>);



// fuels recipes
/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- LE Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
var fis = [[<contenttweaker:californium53>,<contenttweaker:californium53carbide>,<contenttweaker:californium53oxide>,<contenttweaker:californium53nitride>,<contenttweaker:californium53zirconium>],[<contenttweaker:einsteinium54>,<contenttweaker:einsteinium54carbide>,<contenttweaker:einsteinium54oxide>,<contenttweaker:einsteinium54nitride>,<contenttweaker:einsteinium54zirconium>]] as IIngredient[][];
var fer = [[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>],[<contenttweaker:einsteinium55>,<contenttweaker:einsteinium55carbide>,<contenttweaker:einsteinium55oxide>,<contenttweaker:einsteinium55nitride>,<contenttweaker:einsteinium55zirconium>]] as IIngredient[][];

var FuelNames = [["californium_fuel","californium_fuel_carbide","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium"],["einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium"]] as string[][];
var allFuels = [[<contenttweaker:californium_fuel>,<contenttweaker:californium_fuel_carbide>,<contenttweaker:californium_fuel_oxide>,<contenttweaker:californium_fuel_nitride>,<contenttweaker:californium_fuel_zirconium>],[<contenttweaker:einsteinium_fuel>,<contenttweaker:einsteinium_fuel_carbide>,<contenttweaker:einsteinium_fuel_oxide>,<contenttweaker:einsteinium_fuel_nitride>,<contenttweaker:einsteinium_fuel_zirconium>]] as IItemStack[][];
var fuelN2 = [<contenttweaker:californium_fuel>,<contenttweaker:einsteinium_fuel>] as IItemStack[];
decayRad =[2.61,8.3,1.92,7.09,6.56] as double[];

// time, heat, criticality
var fuelStats = [[[lifetimeMultiplier*450,1280,25],[lifetimeMultiplier*288,2000,17]],[[lifetimeMultiplier*550,1048,31],[lifetimeMultiplier*352,1638,21]]] as int[][][];
var fuelCrits = [[20],[25]] as int[][];

var trisoFuels = [<contenttweaker:californium_fuel_triso>,<contenttweaker:einsteinium_fuel_triso>] as IItemStack[];
var dFuels = [[<contenttweaker:dcalifornium_fuel_triso>,<contenttweaker:dcalifornium_fuel_oxide>,<contenttweaker:dcalifornium_fuel_nitride>,<contenttweaker:dcalifornium_fuel_zirconium>],[<contenttweaker:deinsteinium_fuel_triso>,<contenttweaker:deinsteinium_fuel_oxide>,<contenttweaker:deinsteinium_fuel_nitride>,<contenttweaker:deinsteinium_fuel_zirconium>]] as IIngredient[][];
// time, heat, criticality
var trisoStats = [[lifetimeMultiplier*360,1600,17],[lifetimeMultiplier*440,1310,21]] as int[][];
// efficiency, radiation
var trisoStatsAlt = [[1.9,0.0809],[2.0,0.22]] as double[][];
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

// reprocessing the depleted fuels
var dIso = [[[fer[0][1].amount(2),fer[0][1].amount(2),fer[1][1].amount(2),fis[1][1]], [fer[0][2].amount(2),fer[0][2].amount(2),fer[1][2].amount(2),fis[1][2]], [fer[0][3].amount(2),fer[0][3].amount(2),fer[1][3].amount(2),fis[1][3]], [fer[0][4].amount(2),fer[0][4].amount(2),fer[1][4].amount(2),fis[1][4]]], [[fis[1][1],fer[1][1].amount(3),fer[1][1].amount(3),<contenttweaker:fermium57carbide>],[fis[1][2],fer[1][2].amount(3),fer[1][2].amount(3),<contenttweaker:fermium57oxide>],[fis[1][3],fer[1][3].amount(3),fer[1][3].amount(3),<contenttweaker:fermium57nitride>],[fis[1][4],fer[1][4].amount(3),fer[1][4].amount(3),<contenttweaker:fermium57zirconium>]] ] as IIngredient[][][];

var ddecayRad = [2.5,6.67,1.12,3.96,5.29] as double[];
for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], <ore:dustGraphite>.amount(3), dIso[i][0][2], dIso[i][0][3], <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], null, dIso[i][1][2], dIso[i][1][3], null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], null, dIso[i][2][2], dIso[i][2][3], null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], <nuclearcraft:dust:10>, dIso[i][3][2], dIso[i][3][3], null);
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
	}
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
	recipes.addShapeless(mxFuelNames[j],item * 9,[fm257[j], fm257[j], fm257[j], am243[j], am243[j], bk247[j], bk247[j], fer[0][j], cf254[j]]);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[2]);
}
//non-crafting recipes
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], graphite, mxFuels[1]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:oxygen>*1000, mxFuels[2]);
mods.nuclearcraft.Infuser.addRecipe(mxFuels[0], <fluid:nitrogen>*1000, mxFuels[3]);
mods.nuclearcraft.AlloyFurnace.addRecipe(mxFuels[0], zirconium, mxFuels[4]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[3]);
furnace.addRecipe(<contenttweaker:fermium_fuel>, mxFuels[2]);
mods.nuclearcraft.Separator.addRecipe(mxFuels[1], mxFuels[0], <nuclearcraft:dust:8>);
mods.nuclearcraft.Separator.addRecipe(mxFuels[4], mxFuels[0], <nuclearcraft:dust:10>);

val dmxFuels = [<contenttweaker:dfermium_fuel_triso>,<contenttweaker:dfermium_fuel_oxide>,<contenttweaker:dfermium_fuel_nitride>,<contenttweaker:dfermium_fuel_zirconium>] as IItemStack[];

val mxeff = 2.1;
val mxrad = 0.0483;

//pebbles
mods.nuclearcraft.Assembler.addRecipe(mxFuels[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, <contenttweaker:fermium_fuel_triso>*9);
mods.nuclearcraft.PebbleFission.addRecipe(<contenttweaker:fermium_fuel_triso>, dmxFuels[0], (lifetimeMultiplier*760), 2430, mxeff, 37, true, mxrad);
mods.nuclearcraft.Radiation.setRadiationLevel(<contenttweaker:fermium_fuel_triso>, decayRad[2]);
//oxide
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[2], dmxFuels[1], (lifetimeMultiplier*760), 2430, mxeff, 44, true, mxrad);
//nitride
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[3], dmxFuels[2], (lifetimeMultiplier*950), 1944, mxeff, 55, true, mxrad);
//zirconium
mods.nuclearcraft.SolidFission.addRecipe(mxFuels[4], dmxFuels[3], (lifetimeMultiplier*608), 3088, mxeff, 37, true, mxrad);


//reprocessing
//triso
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[0] * 9, <ore:ingotCurium245Carbide> * 2, <ore:ingotCalifornium250Carbide> * 2, <ore:dustGraphite>.amount(4), fer[0][0] * 2, fis[1][0], <nuclearcraft:alloy:13>);
//oxide
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[1] * 9, <ore:ingotCurium245Oxide> * 2, <ore:ingotCalifornium250Oxide> * 2, null, fer[0][1] * 2, fis[1][1],null);
//nitride
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[2] * 9, <ore:ingotCurium245Nitride>* 2, <ore:ingotCalifornium250Nitride> * 2, null, fer[0][2] * 2, fis[1][2],null);
//zirc
mods.nuclearcraft.FuelReprocessor.addRecipe(dmxFuels[3] * 9, <ore:ingotCurium245ZA> * 2, <ore:ingotCalifornium250ZA> * 2, <nuclearcraft:dust:10> * 2, fer[0][3] * 2, fis[1][3], null);
for item in dmxFuels{
	mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[2]);
}



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
		recipes.addShapeless(FuelNames[i][j],item  * 9,[fis[i][j], fis[i][j], fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
		mods.nuclearcraft.Radiation.setRadiationLevel(item, decayRad[3+i]);
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
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0]*3, fer[i][0]*6);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], (3 * trisoStats[i][1]), trisoStatsAlt[i][0], fuelCrits[i][0], true, trisoStatsAlt[i][1]);
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[3+i]);
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
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[3+i]);
	}
}


/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- REF Fuels -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
fis = [[<ore:ingotPlutonium239>,<nuclearcraft:plutonium:6>,<ore:ingotPlutonium239Oxide>,<ore:ingotPlutonium239Nitride>,<nuclearcraft:plutonium:9>],[<ore:ingotAmericium242>,<nuclearcraft:americium:6>,<ore:ingotAmericium242Oxide>,<ore:ingotAmericium242Nitride>,<nuclearcraft:americium:9>],[<ore:ingotCalifornium249>,<nuclearcraft:californium:1>,<ore:ingotCalifornium249Oxide>,<ore:ingotCalifornium249Nitride>,<nuclearcraft:californium:4>]] as IIngredient[][];
fer = [[<ore:ingotPlutonium242>,<nuclearcraft:plutonium:16>,<ore:ingotPlutonium242Oxide>,<ore:ingotPlutonium242Nitride>,<nuclearcraft:plutonium:19>],[<ore:ingotAmericium243>,<nuclearcraft:americium:11>,<ore:ingotAmericium243Oxide>,<ore:ingotAmericium243Nitride>,<nuclearcraft:americium:14>],[<ore:ingotCalifornium252>,<nuclearcraft:californium:16>,<ore:ingotCalifornium252Oxide>,<ore:ingotCalifornium252Nitride>,<nuclearcraft:californium:19>]] as IIngredient[][];
var rad = [[<ore:ingotPlutonium238>,<nuclearcraft:plutonium:1>,<ore:ingotPlutonium238Oxide>,<ore:ingotPlutonium238Nitride>,<nuclearcraft:plutonium:4>],[<ore:ingotAmericium241>,<nuclearcraft:americium:1>,<ore:ingotAmericium241Oxide>,<ore:ingotAmericium241Nitride>,<nuclearcraft:americium:4>],[<ore:ingotCalifornium250>,<nuclearcraft:californium:6>,<ore:ingotCalifornium250Oxide>,<ore:ingotCalifornium250Nitride>,<nuclearcraft:californium:9>]] as IIngredient[][];

allFuels = [[<contenttweaker:rplutonium_fuel>,<contenttweaker:rplutonium_fuel_carbide>,<contenttweaker:rplutonium_fuel_oxide>,<contenttweaker:rplutonium_fuel_nitride>,<contenttweaker:rplutonium_fuel_zirconium>],[<contenttweaker:ramericium_fuel>,<contenttweaker:ramericium_fuel_carbide>,<contenttweaker:ramericium_fuel_oxide>,<contenttweaker:ramericium_fuel_nitride>,<contenttweaker:ramericium_fuel_zirconium>],[<contenttweaker:rcalifornium_fuel>,<contenttweaker:rcalifornium_fuel_carbide>,<contenttweaker:rcalifornium_fuel_oxide>,<contenttweaker:rcalifornium_fuel_nitride>,<contenttweaker:rcalifornium_fuel_zirconium>]];
fuelN2 = [<contenttweaker:rplutonium_fuel>,<contenttweaker:ramericium_fuel>,<contenttweaker:rcalifornium_fuel>];

trisoFuels = [<contenttweaker:rplutonium_fuel_triso>,<contenttweaker:ramericium_fuel_triso>,<contenttweaker:rcalifornium_fuel_triso>];
dFuels = [[<contenttweaker:drplutonium_fuel_triso>,<contenttweaker:drplutonium_fuel_oxide>,<contenttweaker:drplutonium_fuel_nitride>,<contenttweaker:drplutonium_fuel_zirconium>],[<contenttweaker:dramericium_fuel_triso>,<contenttweaker:dramericium_fuel_oxide>,<contenttweaker:dramericium_fuel_nitride>,<contenttweaker:dramericium_fuel_zirconium>],[<contenttweaker:drcalifornium_fuel_triso>,<contenttweaker:drcalifornium_fuel_oxide>,<contenttweaker:drcalifornium_fuel_nitride>,<contenttweaker:drcalifornium_fuel_zirconium>]];

// time, heat, criticality
fuelStats = [[[lifetimeMultiplier*250*20,346,53],[lifetimeMultiplier*160*20,540,42]],[[lifetimeMultiplier*100*20,864,43],[lifetimeMultiplier*64*20,1350,34]],[[lifetimeMultiplier*2805,616,63],[lifetimeMultiplier*1795,963,50]]] as int[][][];
val primer=[false,false,true] as bool[];

// time, heat, criticality
trisoStats = [[lifetimeMultiplier*200*20,432,36],[lifetimeMultiplier*80*20,1080,29],[lifetimeMultiplier*2244,770,43]] as int[][];

// efficiency, radiation
trisoStatsAlt = [[1.35,5.61e-4],[1.45,5.62e-4],[1.90,4.35e-2]] as double[][];


decayRad =[1.28e-3,1.92e-3,0.261] as double[];
ddecayRad =[1.61e-3,1.04e-3,2.49] as double[];

for i,array in allFuels{
	for j,item in array{
		//crafting
		recipes.addShapeless(item  * 9,[rad[i][j], fis[i][j], fis[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j], fer[i][j]]);
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
	mods.nuclearcraft.Separator.addRecipe(array[0]*9, fis[i][0]*3, fer[i][0]*6);
	//pebbles
	mods.nuclearcraft.Assembler.addRecipe(array[1]*9, <ore:dustGraphite>, <nuclearcraft:part:15>, <nuclearcraft:alloy:13>, trisoFuels[i]*9);
	mods.nuclearcraft.PebbleFission.addRecipe(trisoFuels[i], dFuels[i][0], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], trisoStats[i][2], primer[i], trisoStatsAlt[i][1]);
	mods.nuclearcraft.Radiation.setRadiationLevel(trisoFuels[i], decayRad[i]);
	//oxide
	mods.nuclearcraft.SolidFission.addRecipe(array[2], dFuels[i][1], trisoStats[i][0], trisoStats[i][1], trisoStatsAlt[i][0], fuelStats[i][1][2], primer[i], trisoStatsAlt[i][1]);
	//nitride
	mods.nuclearcraft.SolidFission.addRecipe(array[3], dFuels[i][2], fuelStats[i][0][0], fuelStats[i][0][1], trisoStatsAlt[i][0], fuelStats[i][0][2], primer[i], trisoStatsAlt[i][1]);
	//zirconium
	mods.nuclearcraft.SolidFission.addRecipe(array[4], dFuels[i][3], fuelStats[i][1][0], fuelStats[i][1][1], trisoStatsAlt[i][0], trisoStats[i][2], primer[i], trisoStatsAlt[i][1]);
}

// reprocessing the depleted fuels
dIso = [[[fis[0][1],fer[0][1].amount(3),fis[1][1].amount(2),fer[1][1].amount(2)],[fis[0][2],fer[0][2].amount(3),fis[1][2].amount(2),fer[1][2].amount(2)],[fis[0][3],fer[0][3].amount(3),fis[1][3].amount(2),fer[1][3].amount(2)],[fis[0][4],fer[0][4].amount(3),fis[1][4].amount(2),fer[1][4].amount(2)]],[[fis[1][1],fer[1][1].amount(3),<nuclearcraft:curium:11>*2,<nuclearcraft:berkelium:1>],[fis[1][1],fer[1][1].amount(3),<nuclearcraft:curium:12>*2,<nuclearcraft:berkelium:2>],[fis[1][1],fer[1][1].amount(3),<nuclearcraft:curium:13>*2,<nuclearcraft:berkelium:3>],[fis[1][1],fer[1][1].amount(3),<nuclearcraft:curium:14>*2,<nuclearcraft:berkelium:4>]],[[fis[2][1],fer[2][1].amount(2),fer[2][1].amount(3),<contenttweaker:californium53carbide>],[fis[2][2],fer[2][2].amount(2),fer[2][2].amount(3),<contenttweaker:californium53oxide>],[fis[2][3],fer[2][3].amount(2),fer[2][3].amount(3),<contenttweaker:californium53nitride>],[fis[2][4],fer[2][4].amount(2),fer[2][4].amount(3),<contenttweaker:californium53zirconium>]]] as IIngredient[][][];

for i,array in dFuels{
	//triso
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[0].amount(9), dIso[i][0][0], dIso[i][0][1], <ore:dustGraphite>.amount(4), dIso[i][0][2], dIso[i][0][3], <nuclearcraft:alloy:13>);
	//oxide
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[1].amount(9), dIso[i][1][0], dIso[i][1][1], null, dIso[i][1][2], dIso[i][1][3],null);
	//nitride
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[2].amount(9), dIso[i][2][0], dIso[i][2][1], null, dIso[i][2][2], dIso[i][2][3],null);
	//zirc
	mods.nuclearcraft.FuelReprocessor.addRecipe(array[3].amount(9), dIso[i][3][0], dIso[i][3][1], <nuclearcraft:dust:10> * 2, dIso[i][3][2], dIso[i][3][3], null);
	for item in array{
		mods.nuclearcraft.Radiation.setRadiationLevel(item, ddecayRad[i]);
	}
}

/* -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- Improved RTGs -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- */
val radioIso = [<ore:dustPolonium>,<ore:dustRadium>,<ore:ingotPlutonium238>,<ore:ingotAmericium241>,<ore:ingotCalifornium250>] as IIngredient[];
val decayIso = [<ore:dustLead>,<ore:dustLead>,<ore:dustRadium>,<ore:ingotNeptunium237>,<ore:ingotCurium246>] as IIngredient[];
if(loadedMods has "qmd"){
	decayIso[2] = <ore:ingotUranium234>;
}

val shielding = [<nuclearcraft:rad_shielding>,<nuclearcraft:rad_shielding:2>,<nuclearcraft:rad_shielding>,<nuclearcraft:rad_shielding:1>,<nuclearcraft:rad_shielding:2>] as IIngredient[];
val red = <ore:dustRedstone>;
val sige = <contenttweaker:si_ge>;
mods.nuclearcraft.RockCrusher.addRecipe(<ore:oreLead>*5,<ore:dustLead>*10, <contenttweaker:gemgermanium>, null);
mods.nuclearcraft.AlloyFurnace.addRecipe(<contenttweaker:gemgermanium>, <ore:itemSilicon>, sige);

val input = [<contenttweaker:rtg_po>,<contenttweaker:rtg_ra>,<contenttweaker:rtg_pu>,<contenttweaker:rtg_am>,<contenttweaker:rtg_cf>] as IIngredient[];
val output = [<contenttweaker:rtg_po_done>,<contenttweaker:rtg_ra_done>,<contenttweaker:rtg_pu_done>,<contenttweaker:rtg_am_done>,<contenttweaker:rtg_cf_done>] as IIngredient[];
//mean lifetime, power, radiation
val rtgstats = [[910.0,11000.0,2.10e-15],[3840000.0,20.0,0.0678],[210480.0,50.0,2.38e-12],[1038000.0,10.0,2.41e-6],[31400.0,370.0,0.342]] as double[][];
for i,item in input{
	mods.nuclearcraft.Assembler.addRecipe(radioIso[i].amount(9), shielding[i].amount(4), red*2, sige*2, item);
	mods.nuclearcraft.DecayGenerator.addRecipe(item, output[i], rtgstats[i][0], rtgstats[i][1], rtgstats[i][2]);
	mods.nuclearcraft.FuelReprocessor.addRecipe(output[i], decayIso[i].amount(9), shielding[i].amount(4), null, red*2, sige*2, null);
	mods.nuclearcraft.Radiation.setRadiationLevel(item, rtgstats[i][2]);
}
