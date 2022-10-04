///fx_sprite(sprite,imagespeed,x,y,direction,speed,angle,anglerotation,gravity,friction,lifetime)
function fx_sprite(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10) {
	var n = instance_create_depth(argument2,argument3,depth-1,obj_spritefx);
	n.sprite_index = argument0
	n.image_speed  = argument1
	n.speed        = argument5//Set speed first so direction is well-defined (it isn't if speed is zero)
	n.direction    = argument4
	n.image_angle  = argument6
	n.angchang     = argument7
	n.gravity      = argument8
	n.friction     = argument9
	n.lifetime     = argument10
	return n


}
