///battle_item_might_affect_this(amp,flag)
function battle_item_might_affect_this(argument0, argument1) {
	var it = amp_read_var(argument0,amp_HELDITEM);
	if(it != NONE){
		if(global.item_data[it,id_VALIDFLAGS] & argument1){
			return true;
		}
	}
	return false;


}
