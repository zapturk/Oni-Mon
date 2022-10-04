///cis_lootitem()
function cis_lootitem() {
	csc_init()
	csc_enqueue(cc_message,tsprintf("% found %%%!",global.player_name,my_amount == 1 ? "a " : string(my_amount) + " ",global.item_data[my_item,id_NAME],my_amount == 1 ? "" : "s"))

	sfx(jingle_monupgrade)

	inventory_obtain_item(my_item,my_amount)
	autoflags_set(room,x,y,true)
	instance_create_depth(x,y,depth,obj_treasurechest_empty)
	instance_destroy()


}
