///room_goto_fade(room,steps)
function room_goto_fade(argument0, argument1) {
	var n = instance_create_depth(x,y,depth,obj_roomchangefade);
	n.my_room = argument0
	n.steps = argument1
	instance_destroy()
	return n


}
