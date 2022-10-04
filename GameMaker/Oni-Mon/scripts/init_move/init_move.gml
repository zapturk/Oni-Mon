///init_move(id,name,type,category,power,accuracy,mp,target,spfx[chance-type-detail-severity],aniobject,usableflags,flavor)
function init_move(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11) {
	//Note that the move side effect chance parameter should be an integer between 0-100.
	global.move_data[argument0,mvd_NAME]				= argument1
	global.move_data[argument0,mvd_TYPE]				= argument2
	global.move_data[argument0,mvd_CATEGORY]			= argument3
	global.move_data[argument0,mvd_POWER]				= argument4
	global.move_data[argument0,mvd_ACCURACY]			= argument5
	global.move_data[argument0,mvd_MP]					= argument6
	global.move_data[argument0,mvd_TARGET]				= argument7
	if(array_length_1d(argument8) >= 4){
	global.move_data[argument0,mvd_SIDEEFFECT_CHANCE]	= argument8[0]
	global.move_data[argument0,mvd_SIDEEFFECT_TYPE]		= argument8[1]
	global.move_data[argument0,mvd_SIDEEFFECT_SUBTYPE]	= argument8[2]
	global.move_data[argument0,mvd_SIDEEFFECT_SEVERITY] = argument8[3]
	}else{ //Fill with harmless placeholder values
	global.move_data[argument0,mvd_SIDEEFFECT_CHANCE]	= 0
	global.move_data[argument0,mvd_SIDEEFFECT_TYPE]		= NONE
	global.move_data[argument0,mvd_SIDEEFFECT_SUBTYPE]	= NONE
	global.move_data[argument0,mvd_SIDEEFFECT_SEVERITY] = 0
	}
	global.move_data[argument0,mvd_ANIMATIONOBJECT]		= argument9
	global.move_data[argument0,mvd_USABLEFLAGS]			= argument10
	global.move_data[argument0,mvd_DESC]				= argument11


}
