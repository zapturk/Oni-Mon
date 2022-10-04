///init_input()
function init_input() {
#macro input_U 0
#macro input_D 1
#macro input_L 2
#macro input_R 3
#macro input_A 4
#macro input_B 5
#macro input_C 6
#macro input_ST 7
#macro input_SL 8
#macro INPUT_MAX 9

	global.input_key[input_U] = vk_up
	global.input_key[input_D] = vk_down
	global.input_key[input_R] = vk_right
	global.input_key[input_L] = vk_left

	global.input_key[input_A] = ord("X")
	global.input_key[input_B] = ord("Z")
	global.input_key[input_C] = vk_space
	global.input_key[input_ST]= vk_enter
	global.input_key[input_SL]= vk_shift



}
