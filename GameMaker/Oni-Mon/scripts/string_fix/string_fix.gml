///string_fix(number,places)
function string_fix(argument0, argument1) {
	//Returns a zero-padded (or cut) string of the number so that it gets desired number of places.
	var del;
	argument0 = string(floor(argument0))
	del       = string_length(argument0) - argument1
	if(del>0){
	    return string_delete(argument0,1,del)
	}
	else if(del<0){
	    return string_repeat("0",-del) + argument0
	}
	else{
	    return argument0
	}



}
