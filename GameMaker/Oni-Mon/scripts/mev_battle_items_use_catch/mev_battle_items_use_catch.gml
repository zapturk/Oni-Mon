///mev_battle_items_use_catch()
function mev_battle_items_use_catch() {
	action_slate(obj_battlecontrol.action_monster,[my_target[menuvalue_y].amp_id],battleaction_ITEM,my_item,monster_get_spd(obj_battlecontrol.action_monster.amp_id) + BATTLEACTION_SPEEDBONUS_ITEM)

	//Alright, done!
	battle_menu_done_proceed()


}
