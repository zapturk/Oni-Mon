///amp_monster_override_move(amp_id,moveslot,newmove)
function amp_monster_override_move(argument0, argument1, argument2) {
	//Override move 0...3 with a different move, fully heals MP.
	global.active_monster_party[argument0,amp_MOVE1    + argument1] = argument2
	global.active_monster_party[argument0,amp_MOVE1_MP + argument1] = global.move_data[argument2,mvd_MP]


}
