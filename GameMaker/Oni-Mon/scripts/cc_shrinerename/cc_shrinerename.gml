///cc_shrinerename()
function cc_shrinerename() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_monster_list(mev_shrine_rename)
	}


}
