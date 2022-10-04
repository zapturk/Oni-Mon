///init_player_data()
function init_player_data() {

	global.player_name				= "Tark Kyori"
	global.player_money				= 5000
#macro NUMBER_OF_BADGES 10
	global.player_badges			= array_create(NUMBER_OF_BADGES);
	global.playtime_steps			= 0
	global.monsters_seen_total		= 0
	global.monsters_seen			= array_create(MONSTER_MAX)
	global.monsters_caught_total	= 0
	global.monsters_caught			= array_create(MONSTER_MAX)
	global.monsters_max_level		= 0

	global.savefile_filename        = "notselected.yal"

	//Remembering where you were
	global.load_room		= NONE
	global.load_x			= NONE
	global.load_y			= NONE
	global.load_direction	= NONE
	global.door_transit		= ""

	//Default to first town's shrine
	global.last_saved_shrine_room = rm_town1_indoors
	global.last_saved_shrine_x    = 608
	global.last_saved_shrine_y    = 1200

	global.selected_monster_box   = 0
	global.total_monster_boxes    = (PARTYSIZE_BOXED div PARTYSIZE_MONSTERS_PER_BOXPAGE)
	for(var c = 0; c <= global.total_monster_boxes; c++){
		global.monster_box_name[c] = tsprintf("Spirit Realm %",c+1)
	}

	//Special battle flags
	global.battle_is_boss		= false
	global.after_battle_event	= NONE //Event to run after a battle (but only if you win)

	//Inventory stuff
	inventory_init()

	//Automatic flags (items, trainers)
	//Autoflags are convenient, but since they rely on room + position, you might want another approach for story flags.
	autoflags_init()

#macro STORYFLAGS_MAX 500
	global.storyflags = array_create(STORYFLAGS_MAX)


}
