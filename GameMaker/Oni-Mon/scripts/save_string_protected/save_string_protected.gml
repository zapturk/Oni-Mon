///save_string_protected(file,string)
function save_string_protected(argument0, argument1) {
	var l = string_length(argument1);
	save_real_protected(argument0,l)
	for(var c = 0; c < l;c++){
	    save_real_protected(argument0,ord(string_char_at(argument1,c+1)))//GM strings are one-indexed for some reason
	}



}
