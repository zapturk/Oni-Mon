///read_real(file)
function read_real(argument0) {
	var r = file_text_read_string(argument0)
	file_text_readln(argument0)
	return real(r)



}
