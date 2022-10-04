///itemuse_healailment(amp_id,whichail)
function itemuse_healailment(argument0, argument1) {
	//Ailment = NONE will cure any ailment
	var monamp = argument0;
	if(amp_read_var(monamp,amp_AILMENT) != NONE && (amp_read_var(monamp,amp_AILMENT) == argument1 || argument1 == NONE)){
	
		var ail = global.active_monster_party[monamp,amp_AILMENT];
		global.active_monster_party[monamp,amp_AILMENT] = NONE 
		msh_itemuse_show_party_effects(tsprintf("% recovered from %!",amp_get_monster_name(monamp),global.ailment_name[ail]))
	
		inventory_lose_item(my_item,1)
		sfx(snd_healitem)
	}
	else{
		msh_itemuse_show_party_effects("It wouldn't have any effect.")
	}


}
