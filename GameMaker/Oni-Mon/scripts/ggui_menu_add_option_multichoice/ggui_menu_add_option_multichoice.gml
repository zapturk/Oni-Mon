///ggui_menu_add_option_multichoice(mev,text,desc,optindex,currentvalue,subopt_str_array,daddy_resetup_callback,font[main,subopt],dislocation[dx-dy-xsc-ysc])
function ggui_menu_add_option_multichoice(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	//Add specialized option-selection menu, but not specialized for ONLY options.
	//Callbacks should take two arguments: OptID of thing that was changed, and value it was changed to (0-Nth suboption).
	var ll, tt, rr, bb, xx, yy, c;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx                /menu_w) + argument8[0]
	rr = lerp(0.05,0.95,(xx+1*argument8[2])/menu_w) + argument8[0]
	tt = lerp(0.05,0.95, yy                /menu_h) + argument8[1]
	bb = lerp(0.05,0.95,(yy+1*argument8[3])/menu_h) + argument8[1]

	ggui_element_text_settings(argument7[0],c_white,0,0)
	ggui_element_text(ll,tt,argument1)
	ggui_menu_region(xx,yy,argument0,ll,tt,rr,bb)
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	xxyy = xx + yy*menu_w//HACK: arrays can only be 2D, linearize
	menu_optid[xxyy] = argument3
	menu_suboptions[xxyy] = array_length_1d(argument5)
	menu_suboptionheader[xxyy] = argument1
	menu_subopt_optindex[xxyy] = clamp(argument4,0,menu_suboptions[xxyy])
	for(c = 0;c <= menu_suboptions[xxyy];c++){ //Remember, this range is inclusive (unlike almost every other range in this engine)
	    menu_suboption_str[xxyy,c] = argument5[c]
	}
	menu_suboption_callback[xxyy] = argument6

	ggui_element_text_settings(argument7[1],c_white,2,0)
	ggui_element_text(rr,tt,menu_suboption_str[xxyy,menu_subopt_optindex[xxyy]])

	menu_added_options_tail++


}
