///autoflags_get(room,x,y)
function autoflags_get(argument0, argument1, argument2) {
	//Gets the autoflag value. If flag hasn't been set, returns NONE.
	var key = tsprintf("%:%:%",room_get_name(argument0),argument1,argument2);
	var v = global.autoflags[? key];
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Read autoflag %, has value %",key,v))
	}
	if(is_undefined(v)){
		return NONE
	}
	else{
		return v
	}


}
