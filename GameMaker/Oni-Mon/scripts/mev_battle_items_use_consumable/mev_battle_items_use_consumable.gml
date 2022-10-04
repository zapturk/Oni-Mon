function mev_battle_items_use_consumable() {
	//mev_battle_items_use_consumable()
	action_slate(obj_battlecontrol.action_monster,[AMP_FIRST_ACTIVE + menuvalue_y],battleaction_ITEM,my_item,monster_get_spd(obj_battlecontrol.action_monster.amp_id) + BATTLEACTION_SPEEDBONUS_ITEM)

	//Alright, done!
	battle_menu_done_proceed()


}
