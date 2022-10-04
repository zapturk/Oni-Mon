///ggui_menu_add_option_options(mev,text,desc,optindex,subopt_str_array,daddy_resetup_callback,font[main,subopt],dislocation[dx-dy-xsc-ysc])
function ggui_menu_add_option_options(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	//Add specialized option-selection menu, which only works for the global options settings.
	var ll, tt, rr, bb, xx, yy, c;

	xx = menu_added_options_tail mod menu_w
	yy = menu_added_options_tail div menu_w
	ll = lerp(0.05,0.95, xx                /menu_w) + argument7[0]
	rr = lerp(0.05,0.95,(xx+1*argument7[2])/menu_w) + argument7[0]
	tt = lerp(0.05,0.95, yy                /menu_h) + argument7[1]
	bb = lerp(0.05,0.95,(yy+1*argument7[3])/menu_h) + argument7[1]

	ggui_element_text_settings(argument6[0],c_white,0,0)
	ggui_element_text(ll,tt,argument1)
	ggui_menu_region(xx,yy,argument0,ll,tt,rr,bb)
	ggui_fill_meta(xx,yy,NONE,NONE,argument1,argument2)

	xxyy = xx + yy*menu_w//HACK: arrays can only be 2D, linearize
	menu_optid[xxyy] = argument3
	menu_suboptions[xxyy] = global.options_maxvalue[argument3]
	menu_suboptionheader[xxyy] = argument1
	menu_subopt_optindex[xxyy] = clamp(global.options_setting[argument3],0,menu_suboptions[xxyy])
	for(c = 0;c <= menu_suboptions[xxyy];c++){ //Remember, this range is inclusive (unlike almost every other range in this engine)
	    menu_suboption_str[xxyy,c] = argument4[c]
	}
	menu_suboption_callback[xxyy] = argument5

	ggui_element_text_settings(argument6[1],c_white,2,0)
	ggui_element_text(rr,tt,menu_suboption_str[xxyy,menu_subopt_optindex[xxyy]])

	menu_added_options_tail++


}
