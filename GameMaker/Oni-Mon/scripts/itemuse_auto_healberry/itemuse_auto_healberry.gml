///itemuse_auto_healberry([my_amp,offender_amp,damagetotal,move],arg)
function itemuse_auto_healberry(argument0) {
	var newhp = amp_read_var(argument0[0],amp_HP) - argument0[2];
	if(newhp > 0 && newhp < 0.35*monster_get_mhp(argument0[0])){
		action_enqueue_prio(battle_amp_get_monobj(argument0[0]),[-30,"% ate the berry! HP was restored!"],battleaction_ARBSCRIPT,barbs_setdamage)
		global.active_monster_party[argument0[0],amp_HELDITEM] = NONE//Om nom
	}


}
