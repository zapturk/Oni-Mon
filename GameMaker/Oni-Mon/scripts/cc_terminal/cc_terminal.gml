///cc_terminal()
function cc_terminal() {
	with(instance_create_depth(x,y,depth,obj_terminalmenu)){
		//Spawn the complicated menu!
		msh_spawn_terminal()
		script_drawgui = msh_terminal_draw
	}
	csc_proceed()//End the cutscene event


}
