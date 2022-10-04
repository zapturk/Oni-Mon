///mev_pause_items_use()
function mev_pause_items_use() {
	if(global.item_data[my_item,id_VALIDFLAGS] & itemvalidflag_FIELD){
		with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
			daddy	= other.id
			my_item = other.my_item
			msh_spawn_monster_list(mev_pause_items_use_actually_use)
		}
	}
	else{
		message_spawn("Can't use that right now!")
	}


}
