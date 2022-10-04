///mev_shop_buyitem_confirm()
function mev_shop_buyitem_confirm() {
	global.player_money -= unit_cost*menuvalue_x
	inventory_obtain_item(unit_item,menuvalue_x)
	sfx(snd_shoppurchase)
	instance_destroy()

	with(daddy){
		//Hack: rewrite an element's string manually
		ggui_frame_element_string[my_money_frame,my_money_element] = tsprintf("Money: ¤%",global.player_money)
	}


}
