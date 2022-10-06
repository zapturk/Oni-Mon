///ggui_menu_add_option_shop(mev,item)
function ggui_menu_add_option_shop(argument0, argument1) {
	var ll, tt, rr, bb, xx, yy, s;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx   /menu_w)
	rr = lerp(0.05,0.95,(xx+1)/menu_w)
	tt = lerp(0.05,0.95, yy   /menu_h)
	bb = lerp(0.05,0.95,(yy+1)/menu_h)

	shop_cost[xx,yy] = global.item_data[argument1,id_PRICE]
	shop_item[xx,yy] = argument1

	ggui_element_text_settings(font_mainmsg,c_black,0,0)
	draw_set_font(font_mainmsg)
	s = global.item_data[argument1,id_NAME]
	ggui_element_text(ll + 0.15*(rr-ll),tt + 0.5*(bb-tt) - 0.45*ggui_frame_get_coord_y(string_height(s)),s)
	ggui_element_text_settings(font_n,c_black,2,2)
	draw_set_font(font_n)
	s = string(global.item_data[argument1,id_PRICE])
	ggui_element_text(ll + 0.85*(rr-ll),tt + 0.5*(bb-tt) - 0.45*ggui_frame_get_coord_y(string_height(s)),s)
	ggui_menu_region(xx,yy,argument0,ll+0.1*(rr-ll),tt+0.1*(bb-tt),rr-0.1*(rr-ll),bb-0.1*(bb-tt))
	ggui_fill_meta(xx,yy,NONE,NONE,s = global.item_data[argument1,id_NAME],s = global.item_data[argument1,id_DESC])

	menu_added_options_tail++


}
