///itemuse_healHP(amp_id,amount)
function itemuse_healHP(argument0, argument1) {
	var monamp = argument0;
	if(amp_read_var(monamp,amp_HP) < monster_get_mhp(monamp) && amp_read_var(monamp,amp_HP) > 0){
		var diff = monster_get_mhp(monamp) - global.active_monster_party[monamp,amp_HP];
		global.active_monster_party[monamp,amp_HP] = min(monster_get_mhp(monamp),global.active_monster_party[monamp,amp_HP] + argument1)
		msh_itemuse_show_party_effects(tsprintf("% recovered % HP!",amp_get_monster_name(monamp),min(argument1,diff)))
		inventory_lose_item(my_item,1)
		sfx(snd_healitem)
	}
	else{
		msh_itemuse_show_party_effects("It wouldn't have any effect.")
	}


}
