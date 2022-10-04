/// @description Mon-itor
if(instance_exists(my_monobj)){
	if(my_monobj.state == bmonsterstate_NORMAL){
		instance_destroy()
	}
}
else{
	instance_destroy()
}