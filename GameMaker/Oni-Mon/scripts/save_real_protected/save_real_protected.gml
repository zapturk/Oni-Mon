///save_real_protected(file,real)
function save_real_protected(argument0, argument1) {
	var v = round(argument1) ^ global.xorval;
	global.xorval      = ((global.xorval << 4) | irandom_range(0,$f)) & $fffffff
	global.checktime++
	global.checksum = (global.checksum + round(argument1)) & $fffffff
	save_real(argument0,v)
	if(global.checktime>9){
	    global.checktime = 0
	    save_real(argument0,global.checksum)
	}



}
