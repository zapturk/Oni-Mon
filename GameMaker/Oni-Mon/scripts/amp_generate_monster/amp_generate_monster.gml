///amp_generate_monster(slot,species,level)
function amp_generate_monster(argument0, argument1, argument2) {

	amp_clear_monster(argument0)//Clear all fields to NONE

	global.active_monster_party[argument0,amp_MONID]	= argument1
	global.active_monster_party[argument0,amp_LEVEL]	= argument2
	global.active_monster_party[argument0,amp_AILMENT]	= NONE 
	global.active_monster_party[argument0,amp_NICKNAME] = ""
	global.active_monster_party[argument0,amp_EV_MHP]	= 0
	global.active_monster_party[argument0,amp_EV_ATK]	= 0
	global.active_monster_party[argument0,amp_EV_DEF]	= 0
	global.active_monster_party[argument0,amp_EV_MAG]	= 0
	global.active_monster_party[argument0,amp_EV_RES]	= 0
	global.active_monster_party[argument0,amp_EV_SPD]	= 0
	global.active_monster_party[argument0,amp_IV_MHP]	= irandom(32)
	global.active_monster_party[argument0,amp_IV_ATK]	= irandom(32)
	global.active_monster_party[argument0,amp_IV_DEF]	= irandom(32)
	global.active_monster_party[argument0,amp_IV_MAG]	= irandom(32)
	global.active_monster_party[argument0,amp_IV_RES]	= irandom(32)
	global.active_monster_party[argument0,amp_IV_SPD]	= irandom(32)

	//Set EXP to the value needed to reach current level
	global.active_monster_party[argument0,amp_EXP]		= monster_get_next_level_exp(argument1,argument2-1)

	//Reset move data in case we don't get 4 moves from the default moves list
	global.active_monster_party[argument0,amp_MOVE1]    = NONE
	global.active_monster_party[argument0,amp_MOVE2]    = NONE
	global.active_monster_party[argument0,amp_MOVE3]    = NONE
	global.active_monster_party[argument0,amp_MOVE4]    = NONE
	global.active_monster_party[argument0,amp_MOVE1_MP] = 0
	global.active_monster_party[argument0,amp_MOVE2_MP] = 0
	global.active_monster_party[argument0,amp_MOVE3_MP] = 0
	global.active_monster_party[argument0,amp_MOVE4_MP] = 0

	//Learn default moves
	var mvslot = 0;
	for(var c = 0;c < global.monster_data[argument1,mond_TOTALINNATEMOVES]; c++){
		if(argument2 >= global.monster_innatemove_level[argument1,c]){
			global.active_monster_party[argument0,amp_MOVE1 + mvslot] = global.monster_innatemove_move[argument1,c]
			if(DEBUG_MODE){
				show_debug_message(tsprintf("Learn move: % (%)",global.monster_innatemove_move[argument1,c],global.move_data[global.monster_innatemove_move[argument1,c],mvd_NAME]))
			}
		}
		mvslot++
		if(mvslot >= MONSTER_MAX_NUMBER_OF_MOVES){
			mvslot = 0
		}
	}

	//Heal HP / MP fully now when they're both known
	amp_heal_HPMP(argument0)

	if(DEBUG_MODE){
		show_debug_message(tsprintf("[%]: Lv.% %",argument0,argument2,global.monster_data[global.active_monster_party[argument0,amp_MONID],mond_NAME]))
	}

	//If monster is generated in player zone, additionally register it
	if(argument0 < AMP_FIRST_ENEMY){
		global.monsters_seen[argument1]		= true
		global.monsters_caught[argument1]	= true
	}


}
