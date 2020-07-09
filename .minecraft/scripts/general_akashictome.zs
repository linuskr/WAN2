import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

print("Running 'LPMMP_general_akashictome.zs'...");

print(" =================== Akashic Tome =================== ");
print(" ==================================================== ");
/*
	Script just for the "all books included" tome to make it easier
	to see/find/edit/organize things related to just this tome
*/


//====== Ahashic Tome ======
//
	var completeTome = <akashictome:tome>.withTag(
	{
		"akashictome:is_morphing": 1 as byte, 
		"akashictome:data": {
			tconstruct: {
				id: "tconstruct:book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "tconstruct"
				}, 
				Damage: 0 as short
			}, 
			conarm: {
				id: "conarm:book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "conarm"
				}, 
				Damage: 0 as short
			},
			endreborn: {
				id: "patchouli:guide_book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "endreborn", 
					"patchouli:book": "endreborn:book"
				}, 
				Damage: 0 as short
			}, 
			buildcraftlib: {
				id: "buildcraftlib:guide", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "buildcraftlib"
				}, 
				Damage: 0 as short
			},  
			buildcraftlib1: {
				id: "buildcraftlib:guide", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "buildcraftlib1", 
					BookName: "buildcraftlib:meta"
				}, 
				Damage: 0 as short
			}, 
			immersiveengineering: {
				id: "immersiveengineering:tool", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "immersiveengineering"
				}, 
				Damage: 3 as short
			}, 
			engineersdecor: {
				id: "patchouli:guide_book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "engineersdecor", 
					"patchouli:book": "engineersdecor:engineersdecor_manual"
				}, 
				Damage: 0 as short
			}, 
			rftoolsdim: {
				id: "rftoolsdim:rftoolsdim_manual", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "rftoolsdim"
				}, 
				Damage: 0 as short
			}, 
			rftools: {
				id: "rftools:rftools_manual", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "rftools"
				}, 
				Damage: 0 as short
			}, 
			rftools1: {
				id: "rftools:rftools_shape_manual", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "rftools1"
				}, 
				Damage: 0 as short
			}, 
			fossil: {
				id: "fossil:dinopedia", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "fossil"
				}, 
				Damage: 0 as short
			}, 
			notreepunching: {
				id: "guideapi:notreepunching-guide_book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "notreepunching"
				}, 
				Damage: 0 as short
			}, 
			opencomputers: {
				id: "opencomputers:tool", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "opencomputers"
				}, 
				Damage: 4 as short
			}, 
			tis3d: {
				id: "tis3d:book_manual", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "tis3d"
				}, 
				Damage: 0 as short
			}, 
			cookingforblockheads: {
				id: "cookingforblockheads:recipe_book", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "cookingforblockheads"
				}, 
				Damage: 1 as short
			}, 
			xnet: {
				id: "xnet:xnet_manual", 
				Count: 1 as byte, 
				tag: {
					"akashictome:definedMod": "xnet"
				}, 
				Damage: 0 as short
			}
		}
	}
	
	
	);

	//metadata to item
	completeTome.addTooltip(format.aqua("Contains all basic mod manuals/guides already included"));
	mods.jei.JEI.addDescription(completeTome, "The Akashic tome is a book for your books...",
											  "This recipe of 1 dirt = full book is added by All The Mods to ALREADY contain most/all modded manuals as a convenience for our players");

	//add the full book to JEI as it's own entry
	mods.jei.JEI.addItem(completeTome);

	//1 dirt = book
	recipes.addShapeless(completeTome, [<minecraft:dirt>]);
	


//====== Tooltip for added books ======
//
	var addedBooks = [
		<tconstruct:book>, 
		<immersiveengineering:tool:3>, 
		<rftools:rftools_manual>, 
		<opencomputers:tool:4>, 
		<cookingforblockheads:recipe_book:1>, 
		<xnet:xnet_manual>, 
		<rftoolsdim:rftoolsdim_manual>, 
		<rftools:rftools_shape_manual>, 
		<conarm:book>,
		] as IItemStack[];

	for itemBook in addedBooks {
		itemBook.addTooltip(format.aqua("Included within the \"default\" Akashic Tome"));
	}

print("Finished 'LPMMP_general_akashictome.zs'");
