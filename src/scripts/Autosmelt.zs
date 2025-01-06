import crafttweaker.data.IData;
import crafttweaker.player.IPlayer;
import crafttweaker.item.IItemStack;
import crafttweaker.block.IBlockState;
import crafttweaker.item.WeightedItemStack;
import crafttweaker.event.BlockHarvestDropsEvent;

//Fix for blocks that can be duped using Tconstruct autosmelting + fortune.
val autosmeltFixedDrops = {
    "<blockstate:minecraft:cobblestone>": [<minecraft:stone>.weight(1)],
    "<blockstate:minecraft:stone:variant=stone>": [<minecraft:stone>.weight(1)],
    "<blockstate:minecraft:stonebrick:variant=stonebrick>": [<minecraft:stonebrick:2>.weight(1)],
    "<blockstate:minecraft:sand:variant=sand>": [<minecraft:glass>.weight(1)],
    "<blockstate:minecraft:sand:variant=red_sand>": [<minecraft:glass>.weight(1)],
    "<blockstate:tconstruct:seared:type=BRICK>": [<tconstruct:seared:4>.weight(1)],
    "<blockstate:tconstruct:brownstone:type=BRICK>": [<tconstruct:brownstone:4>.weight(1)],
    "<blockstate:botania:biomestonea:variant=FOREST>": [<botania:biomestonea:0>.weight(1)],
    "<blockstate:botania:biomestonea:variant=FOREST_COBBLE>": [<botania:biomestonea:0>.weight(1)],
    "<blockstate:botania:biomestonea:variant=PLAINS>": [<botania:biomestonea:1>.weight(1)],
    "<blockstate:botania:biomestonea:variant=PLAINS_COBBLE>": [<botania:biomestonea:1>.weight(1)],
    "<blockstate:botania:biomestonea:variant=MOUNTAIN>": [<botania:biomestonea:2>.weight(1)],
    "<blockstate:botania:biomestonea:variant=MOUNTAIN_COBBLE>": [<botania:biomestonea:2>.weight(1)],
    "<blockstate:botania:biomestonea:variant=FUNGAL>": [<botania:biomestonea:3>.weight(1)],
    "<blockstate:botania:biomestonea:variant=FUNGAL_COBBLE>": [<botania:biomestonea:3>.weight(1)],
    "<blockstate:botania:biomestonea:variant=SWAMP>": [<botania:biomestonea:4>.weight(1)],
    "<blockstate:botania:biomestonea:variant=SWAMP_COBBLE>": [<botania:biomestonea:4>.weight(1)],
    "<blockstate:botania:biomestonea:variant=DESERT>": [<botania:biomestonea:5>.weight(1)],
    "<blockstate:botania:biomestonea:variant=DESERT_COBBLE>": [<botania:biomestonea:5>.weight(1)],
    "<blockstate:botania:biomestonea:variant=TAIGA>": [<botania:biomestonea:6>.weight(1)],
    "<blockstate:botania:biomestonea:variant=TAIGA_COBBLE>": [<botania:biomestonea:6>.weight(1)],
    "<blockstate:botania:biomestonea:variant=MESA>": [<botania:biomestonea:7>.weight(1)],
    "<blockstate:botania:biomestonea:variant=MESA_COBBLE>": [<botania:biomestonea:7>.weight(1)]
} as [WeightedItemStack][string];

events.onBlockHarvestDrops(function(event as BlockHarvestDropsEvent) {
	if (isNull(event.player) || isNull(event.player.currentItem) || isNull(event.player.currentItem.tag) || isNull(event.player.currentItem.tag.Traits)) {
		return;
	}

    //Somehow this filters out scenarios where a block drops something even when mined with the wrong tool. Modded blocks have no harvest tool but a harvest level of -1.
    //If certain modded blocks had to be added then this check might no longer work correctly
    if (event.block.definition.harvestLevel==0 && !(event.player.currentItem.toolClasses has event.block.definition.harvestTool)) {
        return;
    }
    
	if (event.player.currentItem.tag.Traits has "autosmelt") {
        if(!isNull(autosmeltFixedDrops[event.blockState.commandString])) {
            event.drops = autosmeltFixedDrops[event.blockState.commandString];
        }
	}
});