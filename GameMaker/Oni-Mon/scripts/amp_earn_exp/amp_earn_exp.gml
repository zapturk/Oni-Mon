///amp_earn_exp(amp,exp)
function amp_earn_exp(argument0, argument1) {
	//Adds EXP to the monster.
	//Returns an array with special contents:
	//[0] - Number of levelups
	//[1] - New level
	//[2] - IDs of any moves it learned (potentially) during the levelup. Array. Empty array if no moves.
	//[3] - ID of a evolution it could evolve into now (only the first one is returned) (NONE if no eligible evolution)
#macro monexprewards_NUMLEVELS 0
#macro monexprewards_NEWLEVEL 1
#macro monexprewards_NEWMOVES 2
#macro monexprewards_EVOLUTION 3
	var nol = 0, nmv = [], nevo = NONE, monid = global.active_monster_party[argument0,amp_MONID], c;

	global.active_monster_party[argument0,amp_EXP] += argument1
	while(
		global.active_monster_party[argument0,amp_EXP] >= monster_get_next_level_exp(monid,global.active_monster_party[argument0,amp_LEVEL]) &&
		global.active_monster_party[argument0,amp_LEVEL] < LEVEL_CAP
	){
		//Level up
		nol++
		global.active_monster_party[argument0,amp_LEVEL]++
	
		//Check for moves
		for(c = 0;c < global.monster_data[monid,mond_TOTALINNATEMOVES]; c++){
			//Only add moves that are direct matches! Otherwise we'd stack up moves we potentially learned years ago!
			if(global.monster_innatemove_level[monid,c] == global.active_monster_party[argument0,amp_LEVEL]){
				if(!amp_knows_move(argument0,global.monster_innatemove_move[monid,c])){//Also, don't return moves we already know, or we could know duplicates.
					nmv[array_length_1d(nmv)] = global.monster_innatemove_move[monid,c]
				}
			}
		}
	
		//Check for evos
		for(c = 0; c < global.monster_data[monid,mond_TOTALEVOLUTIONS]; c++){
			if(global.monster_evolution_type[monid,c] == evotype_LEVEL){//Only check for levelup evolutions on EXP gain
				if(global.active_monster_party[argument0,amp_LEVEL] >= global.monster_evolution_arg[ monid,c]){//Check if level is equal OR MORE to evo level
					nevo = global.monster_evolution_mon[ monid,c]
				}
			}
		}
	}

	return [nol, global.active_monster_party[argument0,amp_LEVEL], nmv, nevo]


}
