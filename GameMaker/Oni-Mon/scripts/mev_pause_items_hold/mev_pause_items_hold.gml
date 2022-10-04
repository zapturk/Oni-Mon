///mev_pause_items_hold()
function mev_pause_items_hold() {
	if(global.item_data[my_item,id_PRICE] > 0){
		with(instance_create_depth(x,y,depth - 1,obj_gguimenu)){
			my_item = other.my_item
			daddy   = other.id
			granddad= other.daddy
			msh_spawn_monster_list(mev_pause_items_hold_actually_confirm)
		}
	}
	else{
		message_spawn("No! It's too important to entrust to a monster!")
	}


}
