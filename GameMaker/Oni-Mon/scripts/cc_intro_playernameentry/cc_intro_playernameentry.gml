///cc_intro_playernameentry()
function cc_intro_playernameentry() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_namingmenu(mev_nameentry_confirm_player,spr_playernamingicon,"What is your name?")
	}


}
