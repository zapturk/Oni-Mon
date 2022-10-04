///compute_buff_factor(buff_levels)
function compute_buff_factor(argument0) {
	switch(argument0){
		case  0: return 1.000;
		case  1: return 1.500;
		case  2: return 2.000;
		case  3: return 2.500;
		case  4: return 3.000;
		case  5: return 3.500;
		case  6: return 4.000;
		case -1: return 0.750;
		case -2: return 0.500;
		case -3: return 0.375;
		case -4: return 0.250;
		case -5: return 0.190;
		case -6: return 0.125;
		default: return 1.000;
	}


}
