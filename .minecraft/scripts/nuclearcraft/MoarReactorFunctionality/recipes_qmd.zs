/*
Copyright Bob Bartsch, 2020

This code is governed by the
Creative Commons Attribution–NonCommercial License
https://creativecommons.org/licenses/by-nc/3.0/

(Meaning: credit me if you modify and/or redistribute
this code. Also, you may not sell this code.)
*/

#modloaded qmd

import mods.nuclearcraft.Extractor;
import mods.nuclearcraft.Pressurizer;
import mods.nuclearcraft.Centrifuge;


mods.nuclearcraft.Pressurizer.addRecipe(<qmd:canister>, <contenttweaker:compressed_air_canister>);
mods.nuclearcraft.Extractor.addRecipe(<contenttweaker:compressed_air_canister>, <qmd:canister>, <fluid:liquid_air>*1000);
mods.nuclearcraft.Centrifuge.addRecipe(<fluid:liquid_air>*1000, <fluid:nitrogen>*790, <fluid:oxygen>*210, <fluid:krypton>*7, <fluid:xenon>*3);