///init_monster(id,name,sprite[battle,map],type1,type2,statarray[total-mhp-atk-def-mag-res-spd],expgroup,movelist[lv-move-...],evolutionlist[type-arg-mon,...],desc)
function init_monster(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	var c;
	global.monster_data[argument0,mond_NAME]			= argument1
	global.monster_data[argument0,mond_SPRITE_BATTLE]	= argument2[0]
	global.monster_data[argument0,mond_SPRITE_SMALL]	= argument2[1]
	global.monster_data[argument0,mond_TYPE1]			= argument3
	global.monster_data[argument0,mond_TYPE2]			= argument4
	var statotal = argument5[1] + argument5[2] + argument5[3] + argument5[4] + argument5[5] + argument5[6];//Normalize stats
	global.monster_data[argument0,mond_BASESTAT_HP]		= (argument5[1]/statotal)*argument5[0]
	global.monster_data[argument0,mond_BASESTAT_ATK]	= (argument5[2]/statotal)*argument5[0]
	global.monster_data[argument0,mond_BASESTAT_DEF]	= (argument5[3]/statotal)*argument5[0]
	global.monster_data[argument0,mond_BASESTAT_MAG]	= (argument5[4]/statotal)*argument5[0]
	global.monster_data[argument0,mond_BASESTAT_RES]	= (argument5[5]/statotal)*argument5[0]
	global.monster_data[argument0,mond_BASESTAT_SPD]	= (argument5[6]/statotal)*argument5[0]
	global.monster_data[argument0,mond_EXPGROUP]		= argument6
	global.monster_data[argument0,mond_TOTALINNATEMOVES]= array_length_1d(argument7)

	//Register EV stat based on original maxima
	global.monster_data[argument0,mond_EVBONUS_STAT] = stat_MHP
	var maxima = 0;
	for(c = 0; c < STAT_MAX_DATABASE; c++){
		if(argument5[1+c] > maxima){
			global.monster_data[argument0,mond_EVBONUS_STAT] = stat_MHP + c
			maxima = argument5[1+c]
		}
	}

	//Moves are an array of tuples [level_learned, move_id]
	for(c = 0; c < global.monster_data[argument0,mond_TOTALINNATEMOVES]; c++){
		var mv = argument7[c];
		if(is_array(mv) && array_length_1d(mv) > 0){
			global.monster_innatemove_level[argument0,c] = mv[0]
			global.monster_innatemove_move[ argument0,c] = mv[1]
		}
		else{
			//We ran out of valid data, abort and resize.
			global.monster_data[argument0,mond_TOTALINNATEMOVES] = c
			break
		}
	}

	//Evolutions are an array of tuples [type, arg, mon_id].
	//For levelup type, argument is what level it evolves on.
	//For item type, argument is what item is necessary.
	global.monster_data[argument0,mond_TOTALEVOLUTIONS] =  array_length_1d(argument8)
	for(c = 0; c < global.monster_data[argument0,mond_TOTALEVOLUTIONS]; c++){
		var evo = argument8[c];
		if(is_array(evo) && array_length_1d(mv) > 0){
			global.monster_evolution_type[argument0,c] = evo[0]
			global.monster_evolution_arg[ argument0,c] = evo[1]
			global.monster_evolution_mon[ argument0,c] = evo[2]
		}
		else{
			//We ran out of valid data, abort and resize.
			global.monster_data[argument0,mond_TOTALEVOLUTIONS] = c
			break
		}
	}
	global.monster_data[argument0,mond_DESC] = argument9


}
