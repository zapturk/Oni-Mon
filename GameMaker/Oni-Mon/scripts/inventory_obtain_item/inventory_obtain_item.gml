///inventory_obtain_item(itemid,qty)
function inventory_obtain_item(argument0, argument1) {
	var found = false;
	for(var c = 0; c < global.inventory_items; c++){
		if(global.inventory_item[c] == argument0){
			global.inventory_qty[c] += argument1
			found = true
			break
		}
	}
	if(!found){
		global.inventory_item[global.inventory_items] = argument0
		global.inventory_qty[ global.inventory_items] = argument1
		global.inventory_items++
	}


}
