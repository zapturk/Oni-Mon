///file_protection_init()
function file_protection_init() {
	random_set_seed($27b311a)
	global.xorval   = irandom_range(0,$fffffff)
	global.hacked   = false
	global.checksum = 0
	global.checktime= 0



}
