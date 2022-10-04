///fx_animate(sprite,imagespeed,x,y)
function fx_animate(argument0, argument1, argument2, argument3) {
	var n = instance_create_depth(argument2,argument3,depth-1,obj_anifx);
	n.sprite_index = argument0
	n.image_speed  = argument1
	return n


}
