///compute_damage(user_objid,target_objid,move)
function compute_damage(argument0, argument1, argument2) {
	//Returns array with:
	//[0] total damage value used in calculations.
	//[1] final multiplier
	//[2] effectiveness multiplier (alters damage announcement)

	var atk_stat, def_stat, atk_buff, def_buff, lv, damage, multiplier, typematchup, user = argument0.amp_id, target = argument1.amp_id, move = argument2;
	var usermon = global.active_monster_party[user,  amp_MONID],
		targmon = global.active_monster_party[target,amp_MONID];
	switch(global.move_data[move,mvd_CATEGORY]){
		case movecat_SUPPORT:
			//Support moves usually don't deal damage. If they do, they're a set-damage move.
			//If you want variable-set-damage moves like Nightshade or Psy Wave, you could consider a special-case
			//side effect with 0% chance to occur normally, but is checked here.
			return [global.move_data[move,mvd_POWER], 1, 1]
		break
	
		case movecat_MELEE:
			atk_stat = monster_get_atk(user)
			def_stat = monster_get_def(target)
			atk_buff = compute_buff_factor(argument0.buff[stat_ATK])
			def_buff = compute_buff_factor(argument1.buff[stat_DEF])
		break
	
		case movecat_MAGIC:
			atk_stat = monster_get_mag(user)
			def_stat = monster_get_res(target)
			atk_buff = compute_buff_factor(argument0.buff[stat_MAG])
			def_buff = compute_buff_factor(argument1.buff[stat_RES])
		break
	}

	//Read level (used in damage calculation formula)
	lv = global.active_monster_party[user,  amp_LEVEL]

	//Start with a 1x multiplier
	multiplier = 1.00

	//Take type matchups into account
	if(global.monster_data[targmon,mond_TYPE1] != NONE){ multiplier *= global.type_matchup_factor[global.move_data[move,mvd_TYPE],global.monster_data[targmon,mond_TYPE1]] }
	if(global.monster_data[targmon,mond_TYPE2] != NONE){ multiplier *= global.type_matchup_factor[global.move_data[move,mvd_TYPE],global.monster_data[targmon,mond_TYPE2]] }
	typematchup = multiplier

	//Get same-type attack bonus if matches move's type
	if(
		global.move_data[move,mvd_TYPE] == global.monster_data[usermon,mond_TYPE1] ||
		global.move_data[move,mvd_TYPE] == global.monster_data[usermon,mond_TYPE2]
	){
		multiplier *= 1.5
	}

	//When multiplier is finalized, compute total damage
	damage = (((lv*2)/5 + 2)*global.move_data[move,mvd_POWER]*((atk_stat*atk_buff)/(def_stat*def_buff)))*0.02*multiplier

	//Return damage and multiplier.
	//Note that damage is already multiplied by the multiplier!
	return [floor(damage), multiplier, typematchup]


}
