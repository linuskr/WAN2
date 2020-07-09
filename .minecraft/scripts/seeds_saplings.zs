
print("Running 'seeds_saplings.zs'...");

mods.compatskills.ModLock.addModLock("dynamictreesbop", "reskillable:farming|8");
mods.compatskills.ModLock.addModLock("dynamictreesexc", "reskillable:farming|8");
mods.compatskills.ModLock.addModLock("dynamictreesphc", "reskillable:farming|8");
mods.compatskills.ModLock.addModLock("dynamictreestc", "reskillable:farming|10", "reskillable:magic|16");
mods.compatskills.ModLock.addModLock("dynamictreesnatura", "reskillable:farming|10");
mods.compatskills.Requirement.addRequirement(<endreborn:item_dragonite_seeds>, "reskillable:farming|10", "reskillable:magic|12");
mods.compatskills.Requirement.addRequirement(<fossil:fossilseed:*>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:fossil_sapling_palae>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:fossil_sapling_calamites>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:fossil_sapling_sigillaria>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:fossil_sapling_cordaites>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:seed:*>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:fern_seed>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:palm_sapling>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:calamites_sapling>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.Requirement.addRequirement(<fossil:sigillaria_sapling>, "reskillable:farming|12", "reskillable:magic|8");
mods.compatskills.ModLock.addModLock("growthcraft_apples", "reskillable:farming|6");
mods.compatskills.ModLock.addModLock("growthcraft_grapes", "reskillable:farming|6");
mods.compatskills.ModLock.addModLock("growthcraft_hops", "reskillable:farming|8");
mods.compatskills.ModLock.addModLock("growthcraft_milk", "reskillable:farming|8");
mods.compatskills.ModLock.addModLock("growthcraft_rice", "reskillable:farming|8");
mods.compatskills.Requirement.addRequirement(<immersiveengineering:seed>, "reskillable:farming|6");
mods.compatskills.Requirement.addRequirement(<inspirations:cactus_seeds>, "reskillable:farming|6");
mods.compatskills.Requirement.addRequirement(<inspirations:sugar_cane_seeds>, "reskillable:farming|6");
mods.compatskills.Requirement.addRequirement(<inspirations:carrot_seeds>, "reskillable:farming|6");
mods.compatskills.Requirement.addRequirement(<inspirations:potato_seeds>, "reskillable:farming|6");

print("Finished 'seeds_saplings.zs'");
