///read_real_protected(file)
function read_real_protected(argument0) {
	var s = read_real(argument0) ^ global.xorval;
	global.xorval      = ((global.xorval << 4) | irandom_range(0,$f)) & $fffffff
	global.checktime++
	global.checksum = (global.checksum + s) & $fffffff
	if(global.checktime>9){
	    global.checktime = 0
	    var cs = read_real(argument0);
	    if(cs <> global.checksum){
	        global.hacked = true
	        //show_debug_message(tsprintf("Hacked: expected %, got %",cs,global.checksum))
	    }
	}
	return s



}
