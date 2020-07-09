import mods.compatskills.Requirement.addRequirement;

print("Running 'conarm_locks.zs'...");

addRequirement(<conarm:helmet_core>.withTag({Material: "magmaslime"}), "reskillable:magic|20");
addRequirement(<conarm:helmet>.withTag({TinkerData: {Materials: ["magmaslime"]}}), "reskillable:defense|25");
addRequirement(<conarm:helmet>.withTag({TinkerData: {Materials: ["cactus"]}}), "reskillable:agility|20");

print("Finished 'conarm_locks.zs'");
