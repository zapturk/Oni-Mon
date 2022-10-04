///cc_question([optionstr,newscene,optionstr2,newscene2,...])
function cc_question(argument0) {
	//Spawns a "question" menu (that can't be destroyed) which runs a script on each picked option.
	//The current cutscene-control is destroyed, since a new scene is meant to be started on each option.

	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		var opts = array_length_1d(argument0) div 2;
		var hh = max(VIEW_H*0.25,opts*40)
		ggui_frame(VIEW_W*0.125,VIEW_H - hh,VIEW_W*0.75,hh,spr_messagebox)
		ggui_menu_preallocate(1,opts)
		ggui_element_text_settings(font_mainmsg,c_white,0,0)
		for(var c = 0; c < opts; c++){
			ggui_menu_add_option_text(mev_ccquestion,argument0[c*2],"")
			my_proceeding_script[c] = argument0[c*2 + 1];
		}
		menu_can_destroy = false
	}


}
