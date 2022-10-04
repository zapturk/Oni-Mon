/// @description Go to a door
if(global.door_transit != ""){
	if(DEBUG_MODE){
		show_debug_message(tsprintf("Came through a door, jump to %",global.door_transit))
	}
	with(obj_door){
		if(door_label == global.door_transit){
			with(other){
				x = other.x + sprite_xoffset
				y = other.y + sprite_yoffset
				var c, xx, yy, foundone = false;
				for(c = 0; c < 360; c += 90){
					xx = other.x + lengthdir_x(TILESIZE,c + 270) + TILESIZE*0.5
					yy = other.y + lengthdir_y(TILESIZE,c + 270) + TILESIZE - 1
					if(character_walkable(xx,yy) && !place_meeting(xx,yy,obj_door)){
						x = xx
						y = yy
						drawdir = c + 270
						show_debug_message(tsprintf("Direction % works, go to %,%",c+270,xx,yy))
						foundone = true
						break
					}
					if(!foundone){
						show_debug_message("No valid position for player!")
					}
				}
			}
			break
		}
	}
	
	global.door_transit = ""
}