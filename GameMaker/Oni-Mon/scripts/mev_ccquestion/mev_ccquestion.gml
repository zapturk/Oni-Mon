///mev_ccquestion()
function mev_ccquestion() {
	with(obj_cutscenecontrol){
		instance_destroy()
	}
	if(my_proceeding_script[menuvalue_y] != NONE){
		script_execute(my_proceeding_script[menuvalue_y])
	}
	else{
		show_debug_message("Question alternative had NONE value, not executing.")
	}
	instance_destroy()


}
