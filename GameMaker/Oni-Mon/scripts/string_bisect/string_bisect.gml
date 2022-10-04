///string_bisect(str,splitchar)
function string_bisect(argument0, argument1) {
	//Returns an array with two strings: the string before the bisection point, and the string after.
	//Bisection point is assumed to be a single character.
	//Bisection point is in neither of the returned strings.
	//If the bisection point isn't found in the input string, the returned first string is the entire input
	//string and the second returned string is empty.
	var ss, str, num, ssl;
	ss = string_pos(argument1,argument0)
	ssl= string_length(argument1)
	if(ss > 0){
	    argument0 = string_delete(argument0,ss,ssl)
	    num = string_copy(argument0,ss,string_length(argument0)-(ss-1))
	    str = string_copy(argument0,1,ss-1)

	    return [str,num]
	}
	else{
	    return [argument0,""]
	}



}
