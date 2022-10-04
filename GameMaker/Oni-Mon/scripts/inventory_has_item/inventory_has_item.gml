///inventory_has_item(itemid,[qty])
function inventory_has_item() {
	var iid = argument[0], qty = 1;
	if(argument_count > 1){
		qty = argument[1]
	}
	for(var c = 0; c < global.inventory_items; c++){
		if(global.inventory_item[c] == iid && global.inventory_qty[c] >= qty){
			return true
		}
	}
	return false


}
