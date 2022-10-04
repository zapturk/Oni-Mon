///autoflags_set(room,x,y,value)
function autoflags_set(argument0, argument1, argument2, argument3) {
	var key = tsprintf("%:%:%",room_get_name(argument0),argument1,argument2);
	global.autoflags[? key] = argument3;
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Set autoflag % to %",key,argument3))
	}


}
