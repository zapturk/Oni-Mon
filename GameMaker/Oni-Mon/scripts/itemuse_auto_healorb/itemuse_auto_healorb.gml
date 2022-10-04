///itemuse_auto_healorb(amp_id,arg)
function itemuse_auto_healorb(argument0, argument1) {
	var unused = argument1; unused++;
	var mhp = monster_get_mhp(argument0);
	if(amp_read_var(argument0,amp_HP) < mhp){
		action_enqueue_prio(battle_amp_get_monobj(argument0),[-ceil(0.10*mhp),"The healing orb refills %'s HP!"],battleaction_ARBSCRIPT,barbs_setdamage)
	}


}
