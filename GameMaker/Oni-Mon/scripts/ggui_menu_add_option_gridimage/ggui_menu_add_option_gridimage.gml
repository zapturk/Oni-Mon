///ggui_menu_add_option_gridimage(mev,text,desc,sprite,image)
function ggui_menu_add_option_gridimage(argument0, argument1, argument2, argument3, argument4) {
	//Add sprite that will fit into a grid, potentially with text below it
	//Text is aligned to bottom right corner (overriding current alignment settings, but without touching font)
	var ll, tt, rr, bb, xx, yy, dy;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx   /menu_w)
	rr = lerp(0.05,0.95,(xx+1)/menu_w)
	tt = lerp(0.05,0.95, yy   /menu_h)
	bb = lerp(0.05,0.95,(yy+1)/menu_h)

	if(argument3 != NONE){
	    dy = sprite_get_height(argument3)/ggui_frame_w[ggui_frames-1]
	    ggui_element_sprite(ll,tt,argument3,argument4)
	}
	ggui_halign = fa_right;
	ggui_valign = fa_bottom;
	ggui_element_text(rr,bb,argument1)

	ggui_menu_region(xx,yy,argument0,ll,tt,rr,bb)
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	menu_added_options_tail++



}
