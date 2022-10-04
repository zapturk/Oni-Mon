///mev_battle_item()
function mev_battle_item() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_inventory(mev_battle_item_select)
	}


}
