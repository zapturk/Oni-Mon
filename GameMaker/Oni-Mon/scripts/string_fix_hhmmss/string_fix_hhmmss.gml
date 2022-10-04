///string_fix_hhmmss(steps)
function string_fix_hhmmss(argument0) {
	//Takes a value of steps and returns formatted hh:mm:ss
	var framerate = 60, hours = 0, minutes = 0, seconds = 0, hundredths = 0;
	seconds    = floor(argument0/framerate);
	minutes    = floor(seconds/60);
	hours      = floor(minutes/60);
	hundredths = string_fix(clamp(floor(100*((argument0 mod framerate)/framerate)),0,99),2)
	return string_fix(hours,2) + ":" + string_fix(minutes mod 60,2) + "." + string_fix(seconds mod 60,2)


}
