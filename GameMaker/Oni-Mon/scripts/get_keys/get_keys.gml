///get_keys()
function get_keys() {
	//Read keys and updates the 'how long it has been pressed' status
	p_u = (p_u + 1)*k_u
	p_d = (p_d + 1)*k_d
	p_l = (p_l + 1)*k_l
	p_r = (p_r + 1)*k_r

	p_a = (p_a + 1)*k_a
	p_b = (p_b + 1)*k_b
	p_c = (p_c + 1)*k_c
	p_st= (p_st+ 1)*k_st
	p_sl= (p_sl+ 1)*k_sl

	//Reads key variables
	k_u = keyboard_check(global.input_key[input_U])
	k_d = keyboard_check(global.input_key[input_D])
	k_r = keyboard_check(global.input_key[input_R])
	k_l = keyboard_check(global.input_key[input_L])

	k_a = keyboard_check(global.input_key[input_A])
	k_b = keyboard_check(global.input_key[input_B])
	k_c = keyboard_check(global.input_key[input_C])
	k_st= keyboard_check(global.input_key[input_ST])
	k_sl= keyboard_check(global.input_key[input_SL])




}
