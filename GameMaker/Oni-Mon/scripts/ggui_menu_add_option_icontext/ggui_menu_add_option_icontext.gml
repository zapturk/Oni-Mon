///ggui_menu_add_option_icontext(mev,text,desc,sprite,image)
function ggui_menu_add_option_icontext(argument0, argument1, argument2, argument3, argument4) {
	//Add basic text with a little icon on the left
	var ll, tt, rr, bb, xx, yy, dx;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx   /menu_w)
	rr = lerp(0.05,0.95,(xx+1)/menu_w)
	tt = lerp(0.05,0.95, yy   /menu_h)
	bb = lerp(0.05,0.95,(yy+1)/menu_h)

	if(argument3 != NONE){
	    dx = sprite_get_width(argument3)/ggui_frame_w[ggui_frames-1]
	    ggui_element_sprite(ll,tt,argument3,argument4)
	}
	else{
	    dx = 0
	}
	ggui_element_text(ll + dx,tt,argument1)

	ggui_menu_region(xx,yy,argument0,ll,tt,rr,bb)
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	menu_added_options_tail++



}
