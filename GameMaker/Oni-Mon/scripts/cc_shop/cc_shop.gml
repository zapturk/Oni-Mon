///cc_shop([itemarray])
function cc_shop(argument0) {
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		msh_spawn_shop_list(argument0,mev_shop_buyitem)
	
		script_destroy = csc_proceed
	}


}
