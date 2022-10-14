function __init_global() {
	gml_pragma( "global", "__init_global();");

	// set any global defaults
	//layer_force_draw_depth(true,0);		// force all layers to draw at depth 0
	//draw_set_colour( c_black );
	
	// Enum
	enum directions{
		down,
		left,
		up,
		right,
		idle,
		locked
	}
	
	// global 
	global.playerLastDir = directions.down;
	global.gameStart = true;
	global.tileSize = 16;
	global.nextRoomX = 0;
	global.nextRoomY = 0;
	//global.confermButton = vk_
	//global.inventory = 
	
}
