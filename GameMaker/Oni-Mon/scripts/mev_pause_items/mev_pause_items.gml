///mev_pause_items()
function mev_pause_items() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_inventory(mev_pause_items_select)
	}


}
