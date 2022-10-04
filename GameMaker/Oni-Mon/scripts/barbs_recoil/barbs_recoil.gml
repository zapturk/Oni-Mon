///barbs_recoil()
function barbs_recoil() {

	//Damage
	var pow = 0.25*global.move_data[a_targ,mvd_POWER];
	if(pow > 0){
		var dmgdata = compute_damage(a_user,a_user,a_targ);

		n = instance_create_depth(a_user.x,a_user.y,depth,obj_damageapply)
		n.my_dmg = dmgdata[0]
		n.my_mul = dmgdata[1]
		n.my_eff = dmgdata[2]
		n.my_mon = a_user
		n.my_user= a_user
	}

	//Message about it
	battle_message(tsprintf("% took damage from the attack's recoil!",a_user.name))


}
