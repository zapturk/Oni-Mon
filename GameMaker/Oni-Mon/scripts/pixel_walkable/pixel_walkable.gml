///pixel_walkable(x,y)
function pixel_walkable(argument0, argument1) {
	if(position_meeting(argument0,argument1,parent_overworldobject)){
		return false
	}
	var lay_id = layer_get_id("Tiles");
	var map_id = layer_tilemap_get_id(lay_id);
	var mx = tilemap_get_cell_x_at_pixel(map_id, argument0, argument1);
	var my = tilemap_get_cell_y_at_pixel(map_id, argument0, argument1);
	var data = tilemap_get(map_id, mx, my);
	var ind = tile_get_index(data);
	if(ind > 0){
		//Tile existed (note that index 0 is reserved as the "erase" tile so it's invalid)
		var column = ind mod TILES_PER_ROW;
		if(column < TILES_WALKABLE_COLUMNS){
			//This tile is walkable
			return true;
		}
		else if(column < TILES_WALKABLE_COLUMNS + TILES_SOLID_COLUMNS){
			//This tile is solid
			return false;
		}
	}
	else{
		//No tile - this is offscreen or the void or somesuch
		return false
	}


}
