///init_types()
function init_types() {

	//Setup defaults
	for(c = TYPE_MAX;c >= 0; c--){
		for(d = TYPE_MAX;d >= 0; d--){
			global.type_matchup_factor[c,d] = typefactor_NORMAL
		}
	
		global.type_name[c]		= ""
		global.type_color[c]	= c_black
	}

	//Explicit definitions
	init_type(type_NORMAL,			"Normal",			c_dkgray,		[],													[],													[type_GHOST])
	init_type(type_FIRE,			"Fire",				c_red,			[type_PLANT],										[type_WATER],										[])
	init_type(type_WATER,			"Water",			c_blue,			[type_FIRE,type_GROUND],							[type_PLANT],										[])
	init_type(type_PLANT,			"Plant",			c_green,		[type_WATER,type_GROUND],							[type_FIRE,type_AIR],								[])
	init_type(type_AIR,				"Air",				c_aqua,			[type_PLANT],										[],													[])
	init_type(type_MAGIC,			"Magic",			c_fuchsia,		[type_NORMAL],										[type_GHOST],										[])
	init_type(type_GROUND,			"Ground",			c_maroon,		[type_FIRE],										[type_PLANT],										[type_AIR])
	init_type(type_GHOST,			"Ghost",			c_black,		[type_MAGIC],										[],													[type_NORMAL])

	if(DEBUG_MODE){
		show_debug_message("Type matchup factors: \n" + string(global.type_matchup_factor))
	}


}
