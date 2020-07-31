/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

// this code generates all the items


// imports
#loader contenttweaker
import mods.contenttweaker.CreativeTab;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;


// isotopes generation
val IsoNames= [["californium53","californium53carbide","californium53oxide","californium53nitride","californium53zirconium"],["californium54","californium54carbide","californium54oxide","californium54nitride","californium54zirconium"],["einsteinium54","einsteinium54carbide","einsteinium54oxide","einsteinium54nitride","einsteinium54zirconium"],["einsteinium55","einsteinium55carbide","einsteinium55oxide","einsteinium55nitride","einsteinium55zirconium"],["fermium57","fermium57carbide","fermium57oxide","fermium57nitride","fermium57zirconium"]] as string[][];
for array in IsoNames{
	for item in array{
		var temp = VanillaFactory.createItem(item);
		temp.creativeTab = <creativetab:misc>;
		temp.register();
	}
}

// fuels generation
var FuelNames= ["californium_fuel","californium_fuel_carbide","californium_fuel_triso","californium_fuel_oxide","californium_fuel_nitride","californium_fuel_zirconium","einsteinium_fuel","einsteinium_fuel_carbide","einsteinium_fuel_triso","einsteinium_fuel_oxide","einsteinium_fuel_nitride","einsteinium_fuel_zirconium","fermium_fuel","fermium_fuel_carbide","fermium_fuel_triso","fermium_fuel_oxide","fermium_fuel_nitride","fermium_fuel_zirconium","hcalifornium_fuel","hcalifornium_fuel_carbide","hcalifornium_fuel_triso","hcalifornium_fuel_oxide","hcalifornium_fuel_nitride","hcalifornium_fuel_zirconium","heinsteinium_fuel","heinsteinium_fuel_carbide","heinsteinium_fuel_triso","heinsteinium_fuel_oxide","heinsteinium_fuel_nitride","heinsteinium_fuel_zirconium"] as string[];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:misc>;
	temp.register();	
}

FuelNames=["dcalifornium_fuel_triso","dcalifornium_fuel_oxide","dcalifornium_fuel_nitride","dcalifornium_fuel_zirconium","deinsteinium_fuel_triso","deinsteinium_fuel_oxide","deinsteinium_fuel_nitride","deinsteinium_fuel_zirconium","dfermium_fuel_triso","dfermium_fuel_oxide","dfermium_fuel_nitride","dfermium_fuel_zirconium","dhcalifornium_fuel_triso","dhcalifornium_fuel_oxide","dhcalifornium_fuel_nitride","dhcalifornium_fuel_zirconium","dheinsteinium_fuel_triso","dheinsteinium_fuel_oxide","dheinsteinium_fuel_nitride","dheinsteinium_fuel_zirconium"];
for item in FuelNames{
	var temp = VanillaFactory.createItem(item);
	temp.creativeTab = <creativetab:misc>;
	temp.register();	
}