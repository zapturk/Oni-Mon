///inventory_lose_item(item,[qty])
function inventory_lose_item() {
	var iid = argument[0], qty = 1;
	if(argument_count > 1){
		qty = argument[1]
	}
	for(var c = 0; c < global.inventory_items; c++){
		if(global.inventory_item[c] == iid){
			global.inventory_qty[c] = max(0,global.inventory_qty[c] - qty)
			if(global.inventory_qty[c] <= 0){
				//We hit zero! Remove this entry from the inventory entirely.
				for(var d = c; d < global.inventory_items-1; d++){
					global.inventory_item[d] = global.inventory_item[d+1]
					global.inventory_qty[d] = global.inventory_qty[d+1]
				}
				global.inventory_items--
			}
			//There's no duplicate entries allowed, so we can quit once we found one.
			break
		}
	}


}
