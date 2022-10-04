/// @description Draw HUD things
if(instance_exists(monster)){
	if(
		 monster.state == bmonsterstate_NORMAL ||
		(monster.state >= bmonsterstate_DAMAGE && monster.state <= bmonsterstate_DAMAGE + 10) //HACK: relying on the 10-steps for states.
	){
		var xx, yy, sz = 120;
		xx = x + xscale*deltax - sz*0.5
		yy = y + deltay*(32 + 16*fullhp)
		var amp = monster.amp_id;
		draw_font_settings(font_nfat,c_white,0,2)
		draw_text(xx,yy,monster_get_name(amp))
		
		draw_font_settings(font_n,c_white,2,2)
		draw_text(xx + sz,yy,tsprintf("Lv.%",global.active_monster_party[amp,amp_LEVEL]))
		
		var mhp = monster_get_mhp(amp), hpc = global.active_monster_party[amp,amp_HP];
		var hpa = hpc/mhp;
		currhp = max(hpa,currhp-0.05)
		
		var ccccc;
		ccccc = merge_color_triple(c_red,c_yellow,c_green,hpa)
		
		if(currhp > hpa){
			//Healthbar ghost!
			draw_healthbar(xx,yy,xx + sz,yy + 12,currhp*100,$323232,c_red,	 c_red,0,true,true)
			draw_healthbar(xx,yy,xx + sz,yy + 12,   hpa*100,$323232,ccccc,   ccccc,0,false,true)
		}
		else{
			//Just healthbar
			draw_healthbar(xx,yy,xx + sz,yy + 12,currhp*100,$323232,ccccc,   ccccc,0,true,true)
		}
		if(fullhp){
			draw_font_settings(font_nfat,c_white,0,0)
			draw_text(xx,yy + 15,tsprintf("HP: %/%",hpc,mhp))
		}
		
		//Draw ailment icon, if any
		if(global.active_monster_party[amp,amp_AILMENT] != NONE){
			draw_sprite(spr_ailmenticons,global.active_monster_party[amp,amp_AILMENT],xx + sz-16,yy+14)
		}
	}
	else{
		//Lowball draw amount when not drawing to avoid ghosting immediately
		currhp = 0.00
	}
}