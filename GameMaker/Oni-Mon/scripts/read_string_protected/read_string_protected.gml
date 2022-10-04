///read_string_protected(file)
function read_string_protected(argument0) {
	var l = read_real_protected(argument0), ret = "";
	for(var c = 0; c < l;c++){
	    ret += chr(read_real_protected(argument0))
	}
	return ret



}
