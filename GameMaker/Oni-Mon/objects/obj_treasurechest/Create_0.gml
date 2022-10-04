/// @description Check flag and stuff
event_inherited()
if(autoflags_get(room,x,y) != NONE){
	instance_create_depth(x,y,depth,obj_treasurechest_empty)
	instance_destroy()
}