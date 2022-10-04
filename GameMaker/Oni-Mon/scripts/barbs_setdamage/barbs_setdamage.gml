///barbs_setdamage()
function barbs_setdamage() {
	//a_targ[0]: damage to take
	//a_targ[1]: display string to use for the message

	//Damage
	n = instance_create_depth(a_user.x,a_user.y,depth,obj_damageapply)
	n.my_dmg = a_targ[0]
	n.my_mul = 1
	n.my_eff = 1
	n.my_mon = a_user
	n.my_user= a_user

	//Message about it
	var mystring = a_targ[1];
	battle_message(tsprintf(mystring,a_user.name))


}
