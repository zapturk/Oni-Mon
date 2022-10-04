///character_walkable(x,y)
function character_walkable(argument0, argument1) {
	return
	pixel_walkable(argument0-4,argument1)		&& 
	pixel_walkable(argument0+4,argument1)		&&
	pixel_walkable(argument0-4,argument1-12)	&&
	pixel_walkable(argument0+4,argument1-12)


}
