///cc_intro_startermonsternickname()
function cc_intro_startermonsternickname() {
	with(msh_areyousure(mev_intro_starternickname,"Give your first monster a nickname")){
		script_destroy = csc_proceed
		my_monster = AMP_FIRST_ACTIVE
		//HACK: change the "are you sure" string directly (copied from the monster-catching code's nicknaming question)
		ggui_frame_element_string[0,0] = tsprintf("Give % a nickname?",amp_get_monster_name(my_monster))
		ggui_frame_resize(0,400,100,VIEW_W*0.5-200,VIEW_H*0.5-50)
		ggui_frame_element_x[0,0] += 0.05
		ggui_frame_element_y[0,0] += 0.1
		ggui_frame_element_x[0,1] += 0.15
		ggui_frame_element_x[0,2] += 0.15
		menuvalue_x = 0
	}


}
