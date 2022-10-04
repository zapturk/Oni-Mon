///mev_battle_mons()
function mev_battle_mons() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_monster_list(mev_battle_mons_select)
	}


}
