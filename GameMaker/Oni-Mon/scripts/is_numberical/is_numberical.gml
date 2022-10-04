///is_numberical(value)
function is_numberical(argument0) {
	//Intentionally misspelled so that in the event Yoyo adds an is_numerical() function later,
	//this script won't break. (angle_difference() caused weird issues in the past for that reason)
	return is_real(argument0) || is_bool(argument0) || is_int64(argument0) || is_int32(argument0)


}
