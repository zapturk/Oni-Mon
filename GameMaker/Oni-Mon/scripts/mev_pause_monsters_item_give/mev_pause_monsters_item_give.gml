///mev_pause_monsters_item_give()
function mev_pause_monsters_item_give() {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_inventory(mev_pause_monsters_item_select_give)
		daddy = other.id
		granddad = other.daddy
		my_monster = other.my_monster
	}


}
