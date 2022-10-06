///msh_spawn_namingmenu(donemenuevent,facesprite,desc)
function msh_spawn_namingmenu(argument0, argument1, argument2) {

	var fcbsprsz = 80, xx, yy, mch, mwide = 13, mhigh = 6, c;

	ggui_menu_preallocate(mwide,mhigh)

	name_entry_allow_empty	= true //This can be overridden if needed (we allow empty nicknames)
	menu_can_destroy		= false
	script_step				= msh_nameentry_step //Overrides B-button functionality to allow erasing text with it
	maximal_allowed_name_length = 12

	//Face sprite
	ggui_frame(0,0,fcbsprsz,fcbsprsz,spr_messagebox)
	if(argument1 != NONE){
		var spr = argument1
		var ssc = min(1,0.9*fcbsprsz/sprite_get_width(spr),0.9*fcbsprsz/sprite_get_height(spr))
		ggui_element_sprite_ext(0.5,0.9,spr,0,ssc,ssc,c_white,1)
	}

	//Info
	ggui_frame(fcbsprsz,0,VIEW_W-fcbsprsz,fcbsprsz,spr_messagebox)
	ggui_element_text_settings(font_nfat,c_black,0,2)
	ggui_element_text(0.1,0.5,argument2)
	ggui_element_text_settings(font_mainmsg,c_black,0,0)
	name_entry_string_elm	= ggui_element_text(0.1,0.5,"")
	name_entry_string_frame	= ggui_frames - 1

	//Main box
	ggui_frame(0,fcbsprsz,VIEW_W,VIEW_H-fcbsprsz,spr_messagebox)

	//Add some stuff!

	//HACK: Manually compute index used to add menu-values so we can add more meta-data.
	//(Hinges on computation system not being changed later)
	//We do this in a lot of other places too, but in those places the menus are linear instead
	//of on a grid, making it trivial.

	ggui_element_text_settings(font_mainmsg,c_black,0,0)

	//Capital Letters
	for(c = ord("A"); c <= ord("Z"); c++){
		xx = menu_added_options_tail mod menu_w
		yy = menu_added_options_tail div menu_w
		mch= chr(c)
		my_substring[xx,yy] = mch
		ggui_menu_add_option_text(mev_nameentry_character," " + mch,"")
	}

	//Small Letters
	for(c = ord("a"); c <= ord("z"); c++){
		xx = menu_added_options_tail mod menu_w
		yy = menu_added_options_tail div menu_w
		mch= chr(c)
		my_substring[xx,yy] = mch
		ggui_menu_add_option_text(mev_nameentry_character," " + mch,"")
	}

	//Small Letters
	for(c = ord("0"); c <= ord("9"); c++){
		xx = menu_added_options_tail mod menu_w
		yy = menu_added_options_tail div menu_w
		mch= chr(c)
		my_substring[xx,yy] = mch
		ggui_menu_add_option_text(mev_nameentry_character," " + mch,"")
	}

	//Fill the rest with spaces
	for(c = menu_added_options_tail; c < mwide*mhigh - 2; c++){
		xx = menu_added_options_tail mod menu_w
		yy = menu_added_options_tail div menu_w
		mch= " "
		my_substring[xx,yy] = mch
		ggui_menu_add_option_text(mev_nameentry_character," " + mch,"")
	}

	//Override the last option with a "DONE" option
	ggui_menu_add_option_text(argument0,"Done!","")
	ggui_menu_add_option_text(argument0,"","")//Since the menu text takes up two spots since they're so narrow, let's put an invisible second spot down as well.


}
