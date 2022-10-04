///fx_sprite_projectile(sprite,imagespeed,x,y,direction,speed,angle,anglerotation,gravity,friction,lifetime,donescript,target)
function fx_sprite_projectile(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {
	var n = instance_create_depth(argument2,argument3,depth-1,obj_spritefx_projectile);
	n.sprite_index = argument0
	n.image_speed  = argument1
	n.speed        = argument5//Set speed first so direction is well-defined (it isn't if speed is zero)
	n.direction    = argument4
	n.image_angle  = argument6
	n.angchang     = argument7
	n.gravity      = argument8
	n.friction     = argument9
	n.lifetime     = argument10
	n.done_script  = argument11
	n.target	   = argument12
	return n


}
