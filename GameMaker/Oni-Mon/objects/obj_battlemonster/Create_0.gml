/// @description Setup

//State machine
state = NONE
cntr  = 0
dx    = 0
dy    = 0

//Side and order in conflict
side = side_ENEMY
combat_turn_priority = 0//Actions are asked for in an order sorted by this value (ascending)
ordering_number = 0
name = "(no monster loaded)"
drawscale = 1
switch_mon = 0

//Pointer to read monster data
amp_id = NONE

//Buffs
for(c = STAT_MAX; c >= 0; c--){
	buff[c] = 0
}

//Combat-specific state
target = NONE //Single target from the target array, set during attacking loop. Useful shorthand.
target_array = [] //All current targets.