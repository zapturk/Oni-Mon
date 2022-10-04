/// @description Setup
my_sprite = spr_player
drawimage = 0
drawdir   = 270
mvspd     = 2

stepdelta = 0 //Used to compute when has taken a discrete whole step
encounter_steps = 0 //Steps taken since last encounter

init_keys()

//Jump to stored positions, if any!
alarm[1] = 1
if(global.load_room == room){
	global.load_room = NONE//Reset immediately so we won't have issues with doors etc
	x = global.load_x
	y = global.load_y
	if(global.load_direction != NONE){
		drawdir = global.load_direction
		global.load_direction = NONE
	}
}

//Executing special event after battle
if(global.after_battle_event != NONE){
	script_execute(global.after_battle_event)
	global.after_battle_event = NONE
}

//Clean up enemy data from previous battle, if any.
//Since we can leave battle in multiple ways, some of which still have active monsters,
//we can't destroy this data until we've left battle or we could get weird reference issues.
for(c = AMP_FIRST_ENEMY;c < AMP_FIRST_ENEMY + PARTYSIZE_MAX_ENEMY; c++){
	amp_clear_monster(c)
}
global.encounter_trainer_data = []

//Activation alarm
alarm[0] = 2

if(DEBUG_MODE){
	show_debug_message(tsprintf("Player loaded! (room=%)",room_get_name(room)))
}