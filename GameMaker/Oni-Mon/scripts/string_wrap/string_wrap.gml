///string_wrap(string,width)
function string_wrap(argument0, argument1) {
	//Inserts newlines to string [string] so that it is max [width] pixels wide, using current font's dimensions
	var c, d, pil, sl;

	//Counter variables
	pil = 1
	sl  = string_length(argument0)

	//Loop forward
	for(c = 1;c < sl;c += 1){
	    pil += 1
	    if(string_width(string_copy(argument0,1,pil)) > argument1){
	        //Uh-oh, go back and find a space to change to newline
	        for(d = c;d > 0;d -= 1){
	            if(string_char_at(argument0,d) == " "){
	                argument0 = string_delete(argument0,d,1)
	                argument0 = string_insert("\n",argument0,d)
	                break
	            }
	        }
	    }
	}

	return argument0



}
