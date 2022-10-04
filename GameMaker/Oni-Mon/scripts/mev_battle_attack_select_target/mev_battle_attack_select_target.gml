///mev_battle_attack_select_target()
function mev_battle_attack_select_target() {
	//Target confirmed!
	action_slate(obj_battlecontrol.action_monster,[my_target[menuvalue_y]],battleaction_ATTACK,my_attack,monster_get_spd(obj_battlecontrol.action_monster.amp_id))

	//Done, let's go!
	battle_menu_done_proceed()


}
