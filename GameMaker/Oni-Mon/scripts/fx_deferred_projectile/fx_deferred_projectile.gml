function fx_deferred_projectile(argument0, argument1) {
	//fx_deferred_projectile(sprite,hit_effect_script)
	//Used in event_user[0] of a battle-effect only.
	//Shorthand to create a projectile effect that might spawn another effect in turn when it's destroyed.
	var trg = other.id, n;
	with(user){
		var dir = point_direction(x,y,trg.x,trg.y), len = point_distance(x,y,trg.x,trg.y)
		n = fx_sprite_projectile(argument0,1,x,y,dir,8,dir,0,0,0,len/8,argument1,trg)
		n.depth = depth + 1
	}
	return n


}
