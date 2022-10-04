///init_item(id,name,type,validflags,use_script,use_arg,price,desc)
function init_item(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	global.item_data[argument0,id_NAME]			= argument1
	global.item_data[argument0,id_ITEMTYPE]		= argument2
	global.item_data[argument0,id_VALIDFLAGS]	= argument3
	global.item_data[argument0,id_USESCRIPT]	= argument4
	global.item_data[argument0,id_USEARG]		= argument5
	global.item_data[argument0,id_PRICE]		= argument6
	global.item_data[argument0,id_DESC]			= argument7


}
