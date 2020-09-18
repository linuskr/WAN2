/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/


// imports
#loader contenttweaker
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;

/*
import crafttweaker.item.IItemStack;
val logo = [<nuclearcraft:fuel_californium:3>] as IItemStack[];

val zsTab = VanillaFactory.createCreativeTab("nucleartweaks", logo[0]);
zsTab.register();
*/


// isotopes generation
val IsoNames= [["californium53","californium53carbide","californium53oxide","californium53nitride","californium53zirconium"],["californium54","californium54carbide","californium54oxide","californium54nitride","californium54zirconium"],["einsteinium54","einsteinium54carbide","einsteinium54oxide","einsteinium54nitride","einsteinium54zirconium"],["einsteinium55","einsteinium55carbide","einsteinium55oxide","einsteinium55nitride","einsteinium55zirconium"],["fermium57","fermium57carbide","fermium57oxide","fermium57nitride","fermium57zirconium"]] as string[][];
for i,array in IsoNames{
	for item in array{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:misc>;
		temp.register();
	}
}

// fuels generation
var FuelNames= ["californium_fuel","californium_fuel_carbide","californium_fuel_triso","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium","einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_triso","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium","fermium_fuel","fermium_fuel_carbide","fermium_fuel_triso","fermium_fuel_oxide","fermium_fuel_nitride","fermium_fuel_zirconium","hcalifornium_fuel","hcalifornium_fuel_carbide","hcalifornium_fuel_triso","hcalifornium_fuel_oxide","hcalifornium_fuel_nitride","hcalifornium_fuel_zirconium","heinsteinium_fuel","heinsteinium_fuel_carbide","heinsteinium_fuel_triso","heinsteinium_fuel_oxide","heinsteinium_fuel_nitride","heinsteinium_fuel_zirconium","rplutonium_fuel","rplutonium_fuel_carbide","rplutonium_fuel_triso","rplutonium_fuel_oxide","rplutonium_fuel_nitride","rplutonium_fuel_zirconium","ramericium_fuel","ramericium_fuel_carbide","ramericium_fuel_triso","ramericium_fuel_oxide","ramericium_fuel_nitride","ramericium_fuel_zirconium","rcalifornium_fuel","rcalifornium_fuel_carbide","rcalifornium_fuel_triso","rcalifornium_fuel_oxide","rcalifornium_fuel_nitride","rcalifornium_fuel_zirconium"] as string[];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:misc>;
	temp.register();	
}

FuelNames=["dcalifornium_fuel_triso","dcalifornium_fuel_oxide","dcalifornium_fuel_nitride","dcalifornium_fuel_zirconium","deinsteinium_fuel_triso","deinsteinium_fuel_oxide","deinsteinium_fuel_nitride","deinsteinium_fuel_zirconium","dfermium_fuel_triso","dfermium_fuel_oxide","dfermium_fuel_nitride","dfermium_fuel_zirconium","dhcalifornium_fuel_triso","dhcalifornium_fuel_oxide","dhcalifornium_fuel_nitride","dhcalifornium_fuel_zirconium","dheinsteinium_fuel_triso","dheinsteinium_fuel_oxide","dheinsteinium_fuel_nitride","dheinsteinium_fuel_zirconium","drplutonium_fuel_triso","drplutonium_fuel_oxide","drplutonium_fuel_nitride","drplutonium_fuel_zirconium","dramericium_fuel_triso","dramericium_fuel_oxide","dramericium_fuel_nitride","dramericium_fuel_zirconium","drcalifornium_fuel_triso","drcalifornium_fuel_oxide","drcalifornium_fuel_nitride","drcalifornium_fuel_zirconium"];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:misc>;
	temp.register();	
}

//RTG stuff
val itemNames=["gemgermanium","si_ge"] as string[];
for item in itemNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:misc>;
	temp.register();	
}
var rtgNames = ["rtg_po","rtg_po_done","rtg_ra","rtg_ra_done","rtg_pu","rtg_pu_done","rtg_am","rtg_am_done","rtg_cf","rtg_cf_done"] as string[];
for item in rtgNames{
	var zsBlock = VanillaFactory.createBlock(item, <blockmaterial:rock>);
	zsBlock.setBlockHardness(2.0);
	zsBlock.setBlockResistance(5.0);
	zsBlock.setToolClass("pickaxe");
	zsBlock.setToolLevel(0);
	zsBlock.setBlockSoundType(<soundtype:stone>);
	zsBlock.register();
}

//special QMD additions
if(loadedMods has "qmd"){
	val IsoNames2= [["mendelevium58","mendelevium58carbide","mendelevium58oxide","mendelevium58nitride","mendelevium58zirconium"],["flerovium98","flerovium98carbide","flerovium98oxide","flerovium98nitride","flerovium98zirconium"]] as string[][];
	for i,array in IsoNames2{
		for item in array{
			var temp = VanillaFactory.createItem(item);
			temp.creativeTab = <creativetab:misc>;
			temp.register();
		}
	}
	FuelNames= ["protactinium_fuel","protactinium_fuel_carbide","protactinium_fuel_triso","protactinium_fuel_oxide","protactinium_fuel_nitride","protactinium_fuel_zirconium","hprotactinium_fuel","hprotactinium_fuel_carbide","hprotactinium_fuel_triso","hprotactinium_fuel_oxide","hprotactinium_fuel_nitride","hprotactinium_fuel_zirconium","mendelevium_fuel","mendelevium_fuel_carbide","mendelevium_fuel_triso","mendelevium_fuel_oxide","mendelevium_fuel_nitride","mendelevium_fuel_zirconium","flerovium_fuel","flerovium_fuel_carbide","flerovium_fuel_triso","flerovium_fuel_oxide","flerovium_fuel_nitride","flerovium_fuel_zirconium"] as string[];
	for item in FuelNames{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:misc>;
		temp.register();	
	}
	FuelNames= ["dprotactinium_fuel_triso","dprotactinium_fuel_oxide","dprotactinium_fuel_nitride","dprotactinium_fuel_zirconium","dhprotactinium_fuel_triso","dhprotactinium_fuel_oxide","dhprotactinium_fuel_nitride","dhprotactinium_fuel_zirconium","dmendelevium_fuel_triso","dmendelevium_fuel_oxide","dmendelevium_fuel_nitride","dmendelevium_fuel_zirconium","dflerovium_fuel_triso","dflerovium_fuel_oxide","dflerovium_fuel_nitride","dflerovium_fuel_zirconium"] as string[];
	for item in FuelNames{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:misc>;
		temp.register();	
	}
	var temp = VanillaFactory.createItem("mysterymix");
	temp.creativeTab = <creativetab:misc>;
	temp.register();

rtgNames = ["rtg_co","rtg_co_done","rtg_sr","rtg_sr_done","rtg_pm","rtg_pm_done"];
for item in rtgNames{
	var zsBlock = VanillaFactory.createBlock(item, <blockmaterial:rock>);
	zsBlock.setBlockHardness(2.0);
	zsBlock.setBlockResistance(5.0);
	zsBlock.setToolClass("pickaxe");
	zsBlock.setToolLevel(0);
	zsBlock.setBlockSoundType(<soundtype:stone>);
	zsBlock.register();
}

}