import mods.appliedenergistics2.Inscriber;

//remove
// AE2uel Pattern Expansion Card
recipes.removeShapeless(<appliedenergistics2:material:58>);
// AE2uel Quantum and Magnet card
Inscriber.removeRecipe(<appliedenergistics2:material:59>)
Inscriber.removeRecipe(<appliedenergistics2:material:60>)

//add
recipes.addShaped(<appliedenergistics2:sky_stone_block> * 8, [[<ore:netherrack>, <ore:netherrack>, <ore:netherrack>],[<ore:netherrack>, <ore:bEnderAirBottle>, <ore:netherrack>], [<ore:netherrack>, <ore:netherrack>, <ore:netherrack>]]);