///barbs_debuff()
function barbs_statbuff() {
	//Expects a_targ to contain an array as follows:
	//[0]: stat ID to alter
	//[1]: debuff severity, in tiers +/-.
	//[2]: true if the buff had no effect because we're already at the cap, false otherwise.

	var ns = "", snh = "", spritefx;

	if(a_targ[2]){
		if(a_targ[1] > 0){
			ns = "can't rise any higher..."
		}
		else{
			ns = "can't fall any lower..."
		}
	}
	else{
		switch(a_targ[1]){
			case  1: ns = "increased."; break
			case  2: ns = "greatly increased!"; break
			case  3:
			case  4:
			case  5:
			case  6: ns = "dramatically increased!!"; break
	
			case -1: ns = "fell."; break
			case -2: ns = "greatly fell!"; break
			case -3:
			case -4:
			case -5: 
			case -6: ns = "dramatically fell!"; break
		}
	}

	snh = global.stat_name[a_targ[0]]

	if(a_targ[1] > 0){
		spritefx = spr_fx_buff
	}
	else{
		spritefx = spr_fx_debuff
	}

	with(a_user){
		fx_animate(spritefx,1,x,y - sprite_height*0.5)
	}

	battle_message(tsprintf("%'s % %",a_user.name,snh,ns))


}
