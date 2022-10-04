///ggui_menu_add_option_text_dislocated(mev,text,desc,dx,dy,framexscale,frameyscale)
function ggui_menu_add_option_text_dislocated(argument0, argument1, argument2, argument3, argument4, argument5, argument6) {
	//Add basic text option
	var ll, tt, rr, bb, xx, yy;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx             /menu_w) + argument3
	rr = lerp(0.05,0.95,(xx+1*argument5)/menu_w) + argument3
	tt = lerp(0.05,0.95, yy             /menu_h) + argument4
	bb = lerp(0.05,0.95,(yy+1*argument6)/menu_h) + argument4

	ggui_element_text(ll,tt,argument1)
	ggui_menu_region(xx,yy,argument0,ll,tt,rr,bb)
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	menu_added_options_tail++


}
