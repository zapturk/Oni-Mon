///itemuse_auto_power([useramp,targetamp,move],arg)
function itemuse_auto_power(argument0, argument1) {
	if(global.move_data[argument0[2],mvd_TYPE] == argument1){
		return 1.2
	}
	else{
		return 1
	}


}
