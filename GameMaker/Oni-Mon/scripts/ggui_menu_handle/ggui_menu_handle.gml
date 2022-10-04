///ggui_menu_handle()
function ggui_menu_handle() {
	get_keys()
	menu_creation_cooldown--;
	if(!menu_creation_cooldown && active){
	    //Move around marker
	    if(menu_w > 1){
	        //Move left/right, but only if menu has at least 2 elements on that axis
	        if(k_l && !p_l){
	            if(menuvalue_x > 0){
	                menuvalue_x--;
	                sfx(snd_menu_move)
	            }
	            else{
	                menuvalue_x = menu_w - 1;
	                sfx(snd_menu_move)
	            }
	        }
	        if(k_r && !p_r){
	            if(menuvalue_x < menu_w - 1){
	                menuvalue_x++;
	                sfx(snd_menu_move)
	            }
	            else{
	                menuvalue_x = 0;
	                sfx(snd_menu_move)
	            }
	        }
	    }
	    if(menu_h > 1){
	        //Move up/down, but only if menu has at least 2 elements on that axis
	        if(k_u && !p_u){
	            if(menuvalue_y > 0){
	                menuvalue_y--;
	                sfx(snd_menu_move)
	            }
	            else{
	                menuvalue_y = menu_h - 1;
	                sfx(snd_menu_move)
	            }
	        }
	        if(k_d && !p_d){
	            if(menuvalue_y < menu_h - 1){
	                menuvalue_y++;
	                sfx(snd_menu_move)
	            }
	            else{
	                menuvalue_y = 0;
	                sfx(snd_menu_move)
	            }
	        }
	    }
	    //Activate current event
	    if(k_a && !p_a){
	        if(menu_event[menuvalue_x,menuvalue_y] != NONE){
	            sfx(snd_menu_ok)
	            script_execute(menu_event[menuvalue_x,menuvalue_y])
	        }
	        else{
	            sfx(snd_menu_buzzer)
	        }
	    }
	    //Cancel
	    if(k_b && !p_b){
	        if(menu_can_destroy){
	            sfx(snd_menu_buzzer)
	            instance_destroy();
            
	            //Stop other menus from instatriggering
	            with(parent_menu){
	                menu_creation_cooldown = 5
	            }
	        }
	    }
	}




}
