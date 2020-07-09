import mods.compatskills.Requirement.addRequirement;
import crafttweaker.item.IItemStack;

print("Running 'tcon_locks.zs'...");

//val materials = ["electrical_steel", "energetic_alloy", "vibrant_alloy", "redstone_alloy", "conductive_iron", "pulsating_iron", "dark_steel", "soularium", "end_steel", "construction_alloy", "_internal_render", "_internal_render", "_internal_render", "_internal_render", "_internal_renderstring", "stone", "flint", "cactus", "bone", "obsidian", "prismarine", "endstone", "paper", "sponge", "firewood", "iron", "pigiron", "knightslime", "slime", "blueslime", "magmaslime", "netherrack", "cobalt", "ardite", "manyullyn", "copper", "bronze", "lead", "silver", "electrum", "steel", "string", "slimevine_blue", "slimevine_purple", "vine", "blaze", "reed", "ice", "endrod", "feather", "slimeleaf_blue", "slimeleaf_orange", "slimeleaf_purple", "leaf", "treatedwood", "hemp", "constantan", "umbrium", "endorium", "wolframium", "ancient_metal", "tar_slime", "dragonbone", "desert_myrmex", "jungle_myrmex", "dragonsteel_fire", "dragonsteel_ice", "stymph_feather", "amphithere_feather", "weezer", "enderium", "platinum", "iridium", "mithril", "signalum", "lumium", "invar", "nickel", "tin", "brass", "aluminum", "zinc", "refinedobsidian", "refinedglowstone", "osmium", "manasteel", "terrasteel", "elvenelementium", "gaia", "yellorium", "cyanite", "blutonium", "ludicrite", "quartzenrichediron", "draconium", "wyverndraconium", "awakeneddraconium", "chaoticdraconium", "psi", "psigem", "ivorypsi", "ebonypsi", "darkmatter", "redmatter", "electrumflux", "refinediron", "tungsten", "titanium", "chrome", "advancedalloy", "ruby", "sapphire", "peridot", "yellowgarnet", "redgarnet", "rubber", "certus", "fluix", "boron", "tough", "hard_carbon", "boron_nitride", "thorium", "uranium", "magnesium", "chocolate", "tnt", "alumite", "malachite_gem", "amber", "topaz", "tanzanite", "amethyst", "psimetal", "thaumium", "cheese", "string_cheese", "plague_metal", "emerald_plustic", "flamestring_plustic", "bloodwood_plustic", "fusewood_plustic", "ghostwood_plustic", "darkwood_plustic", "wood"];

addRequirement(<tconstruct:pickaxe>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:mining|4");
addRequirement(<tconstruct:pickaxe>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:mining|8");
addRequirement(<tconstruct:pickaxe>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:mining|16");
addRequirement(<tconstruct:pickaxe>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:mining|24");

addRequirement(<tconstruct:shovel>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:gathering|4");
addRequirement(<tconstruct:shovel>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:gathering|8");
addRequirement(<tconstruct:shovel>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:gathering|16");
addRequirement(<tconstruct:shovel>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:gathering|24");

addRequirement(<tconstruct:hatchet>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:gathering|4");
addRequirement(<tconstruct:hatchet>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:gathering|8");
addRequirement(<tconstruct:hatchet>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:gathering|16");
addRequirement(<tconstruct:hatchet>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:gathering|24");

addRequirement(<tconstruct:mattock>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:farming|4");
addRequirement(<tconstruct:mattock>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:farming|8");
addRequirement(<tconstruct:mattock>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:farming|16");
addRequirement(<tconstruct:mattock>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:farming|24");

addRequirement(<tconstruct:kama>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:gathering|4");
addRequirement(<tconstruct:kama>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:gathering|8");
addRequirement(<tconstruct:kama>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:gathering|16");
addRequirement(<tconstruct:kama>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:gathering|24");

addRequirement(<tconstruct:scythe>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:farming|4");
addRequirement(<tconstruct:scythe>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:farming|8");
addRequirement(<tconstruct:scythe>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:farming|16");
addRequirement(<tconstruct:scythe>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:farming|24");

addRequirement(<tconstruct:hammer>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:mining|6");
addRequirement(<tconstruct:hammer>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:mining|10");
addRequirement(<tconstruct:hammer>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:mining|18");
addRequirement(<tconstruct:hammer>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:mining|26");

addRequirement(<tconstruct:excavator>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:gathering|6");
addRequirement(<tconstruct:excavator>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:gathering|10");
addRequirement(<tconstruct:excavator>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:gathering|18");
addRequirement(<tconstruct:excavator>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:gathering|26");

addRequirement(<tconstruct:lumberaxe>.withTag({ Stats: { HarvestLevel: 1 } }), "reskillable:gathering|6");
addRequirement(<tconstruct:lumberaxe>.withTag({ Stats: { HarvestLevel: 2 } }), "reskillable:gathering|10");
addRequirement(<tconstruct:lumberaxe>.withTag({ Stats: { HarvestLevel: 3 } }), "reskillable:gathering|18");
addRequirement(<tconstruct:lumberaxe>.withTag({ Stats: { HarvestLevel: 4 } }), "reskillable:gathering|26");


for itemdef in game.items {

	val item = itemdef.makeStack(0);

	if(isNull(item)) {
		print("item was null: " + itemdef.id);
		continue;
	}

	if(isNull(item.toolClasses)) {
		print("toolClasses was null: " + item.name);
		continue;
	}

	for toolClass in item.toolClasses {

		if(toolClass == "pickaxe") {

			if(item.getHarvestLevel(toolClass) < 1) {
				continue;
			}

			print("adding " + ("reskillable:mining|" + ((4 * item.getHarvestLevel(toolClass)) as string)) + " to " + item.name);
			addRequirement(item, ("reskillable:mining|" + ((4 * item.getHarvestLevel(toolClass)) as string)));

		} else if(toolClass == "axe") {

			if(item.getHarvestLevel(toolClass) < 1) {
				continue;
			}

			print("adding " + ("reskillable:gathering|" + ((4 * item.getHarvestLevel(toolClass)) as string)) + " to " + item.name);
			addRequirement(item, ("reskillable:gathering|" + ((4 * item.getHarvestLevel(toolClass)) as string)));

		} else if(toolClass == "shovel") {

			if(item.getHarvestLevel(toolClass) < 1) {
				continue;
			}

			print("adding " + ("reskillable:gathering|" + ((4 * item.getHarvestLevel(toolClass)) as string)) + " to " + item.name);
			addRequirement(item, ("reskillable:gathering|" + ((4 * item.getHarvestLevel(toolClass)) as string)));

		} else {
			print("unknown toolClass: " + toolClass + " item " + item.name + " has level " + item.getHarvestLevel(toolClass));
		}
	}
}


//addRequirement(<tconstruct:pick_head>.withTag({Material: "refinedobsidian"}), "reskillable:mining|20");


print("Finished 'tcon_locks.zs'");

// -material_id
// Head Durability: 306
// Head Mining Level: bDiamond
// Head Mining Speed: 6.5
// Head Attack: 2.25
// Handle Durability Modifier: 0.75
// Handle Durability: 80
// Extra Durability: 75
// Bowlimb Drawspeed: 0.67
// Bowlimb Range Multiplier: 0.9
// Bowlimb Bonus Damage: 1
// Bowstring Modifier: 0.75

// Core Durability: 8.7
// Core Defense: 5
// Plates Modifier: 0.5
// Plates Durability: -3.5
// Plates Toughness: 0
// Trim Durability: 0.75