/// @description Look for player

if(aggrodistance <= 0){
	//No point in checking if we don't have an aggro distance
	exit
}

//Change collision mask (changing sprite directly is the easiest way to take scale/angle into account)
mask_index		= spr_trainervisioncone
image_angle		= drawdir
image_xscale	= TILESIZE*aggrodistance
image_yscale    = 1

//Actually check for player
if(place_meeting(x,y,obj_player)){
	event_user(1)
}

//Don't forget to change back afterwards
mask_index		= spr_placeholdercharacter
image_angle		= 0
image_xscale	= 1
image_yscale    = 1