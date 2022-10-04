///init_type(id,name,color,strong_against_array,ineffective_against_array,no_effect_on_array)
function init_type(argument0, argument1, argument2, argument3, argument4, argument5) {
	global.type_name[argument0] = argument1
	global.type_color[argument0] = argument2

	//Strong array
	for(c = 0;c < array_length_1d(argument3);c++){
		global.type_matchup_factor[argument0,argument3[c]] = typefactor_SUPEREFFECTIVE
	}

	//Ineffective array
	for(c = 0;c < array_length_1d(argument4);c++){
		global.type_matchup_factor[argument0,argument4[c]] = typefactor_INEFFECTIVE
	}

	//Useless array
	for(c = 0;c < array_length_1d(argument5);c++){
		global.type_matchup_factor[argument0,argument5[c]] = typefactor_USELESS
	}


}
