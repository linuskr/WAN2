import crafttweaker.oredict.IOreDict;

print("Running 'cobalt_block_fix.zs'...");

val cobaltBlock = <tconstruct:metal:0>;

if (<ore:oreCobalt> has cobaltBlock) {
	print("cobaltBlock is in oreCobalt, removing ...");
	<ore:oreCobalt>.remove(cobaltBlock);
}

if (<ore:oreArdite> has cobaltBlock) {
	print("cobaltBlock is in oreArdite, removing ...");
	<ore:oreArdite>.remove(cobaltBlock);
}

print("Finished 'cobalt_block_fix.zs'");
