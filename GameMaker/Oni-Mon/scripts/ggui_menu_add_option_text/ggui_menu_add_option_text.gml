///ggui_menu_add_option_text(mev,text,desc)
function ggui_menu_add_option_text(argument0, argument1, argument2) {
	//Add basic text option
	var ll, tt, rr, bb, xx, yy;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx   /menu_w)
	rr = lerp(0.05,0.95,(xx+1)/menu_w)
	tt = lerp(0.05,0.95, yy   /menu_h)
	bb = lerp(0.05,0.95,(yy+1)/menu_h)

	ggui_element_text(ll + 0.15*(rr-ll),tt + 0.5*(bb-tt) - 0.45*ggui_frame_get_coord_y(string_height(argument1)),argument1)
	ggui_menu_region(xx,yy,argument0,ll+0.1*(rr-ll),tt+0.1*(bb-tt),rr-0.1*(rr-ll),bb-0.1*(bb-tt))
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	menu_added_options_tail++


}
