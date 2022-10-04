/// @description Change rooms!
if(alarm[1] <= 0){
	if(other.target_room != NONE){
		global.door_transit = other.door_label
	
		n = instance_create_depth(x,y,-15500,obj_battletransitioneffect)
		n.sprite_index = spr_doortransitioneffect
	
		room_goto_fade(other.target_room,30)
	}
}