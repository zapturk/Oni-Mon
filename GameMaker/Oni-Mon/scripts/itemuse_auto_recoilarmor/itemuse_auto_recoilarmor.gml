///itemuse_auto_recoilarmor([my_amp,offender_amp,damagetotal,move],arg)
function itemuse_auto_recoilarmor(argument0, argument1) {
	var mv = argument0[3],;
	if(global.move_data[mv,mvd_CATEGORY] == argument1){
		var dstr = tsprintf("The target's held % damaged % a bit!",global.item_data[amp_read_var(argument0[0],amp_HELDITEM),id_NAME])
		action_enqueue_prio(battle_amp_get_monobj(argument0[1]),[ceil(0.125*argument0[2]),dstr],battleaction_ARBSCRIPT,barbs_setdamage)
	}


}
