///mev_pause_monsters()
function mev_pause_monsters() {
	with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
		msh_spawn_monster_list(mev_pause_monsters_select)
	}


}
