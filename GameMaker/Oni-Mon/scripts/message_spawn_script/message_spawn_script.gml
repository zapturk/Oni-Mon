///message_spawn_script(msgstring,scriptwhendone)
function message_spawn_script(argument0, argument1) {
	//Spawns a GGUI menu that holds a message, and destroys itself after showing it.
	//It will also execute a script before that point, potentially creating other menus (etc), changing rooms...
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		message_init()
		ggui_frame(NONE,NONE,0,0,spr_messagebox)
		ggui_menu_preallocate(1,1)
		ggui_menu_add_option_text(mev_nothing,"","")
		draw_set_font(font_mainmsg)
		fullstring		= string_wrap(argument0,messagebox_width-32)
		script_proceed  = argument1
		script_step		= message_menu_step
		script_destroy	= mev_messageproceed_script
		script_drawgui  = message_draw
		message_active  = true
		menu_can_destroy= false
	
		return id
	}


}
