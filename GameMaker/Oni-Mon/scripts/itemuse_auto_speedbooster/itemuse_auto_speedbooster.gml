///itemuse_auto_speedbooster([userobj,targetobj,actiontype,action,speed],arg)
function itemuse_auto_speedbooster(argument0, argument1) {
	var ret = argument0;

	if(argument0[battleaction_COMM_TYPE] == battleaction_ATTACK){
		var mv = argument0[battleaction_COMM_COMMAND];
		if(mv != NONE){
			if(global.move_data[mv,mvd_CATEGORY] == argument1){
				ret[battleaction_COMM_SPEEDPRIO] += 100
			}
		}
	}

	return ret;


}
