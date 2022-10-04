///monster_get_next_level_exp(species,level)
function monster_get_next_level_exp(argument0, argument1) {
	//Check EXP group for curve amplitude
	if(argument1 < 1){
		return 0
	}
	else{
		var factors = global.exp_group_factors[global.monster_data[argument0,mond_EXPGROUP]];
		var factor_linear = factors[0], factor_quad = factors[1];

		return ceil(25 + 22.8*power(argument1,2)*factor_linear + 0.125*power(argument1,3)*factor_quad)
	}


}
