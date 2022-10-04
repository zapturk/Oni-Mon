/// @description Do things
image_angle -= 5
if(lifetime < 60){
	image_alpha = max(0,image_alpha - 1/60)
	image_xscale += 0.02
	image_yscale += 0.02
}
else{
	image_alpha = min(1,image_alpha + 1/60)
}


lifetime--
if(!lifetime){
	instance_destroy()
	csc_proceed()
}