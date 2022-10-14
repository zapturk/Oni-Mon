/// @description menu
if able = 1 {
    if keyboard_check(vk_enter) = 1 {
        able = 0;
        if(menu = 0){ 
				menu = 1; 
			} 
			else { 
				menu = 0; 
			}
        }
    }
//select
if menu = 1 {
    if page = -1 {
        if able = 1 {
            if keyboard_check(vk_down) = 1 {
                able = 0;
                if select < 7 { select += 1 }
                }
            }
        if able = 1 {
            if keyboard_check(vk_up) = 1 {
                able = 0;
                if select > 0 { select -= 1 }
                }
            }
        }
    if page = 0 { //catalog
        if subpage = 0 {
            if able = 1 {
                if keyboard_check(vk_down) = 1 {
                    fade = 1;
                    able = 0;
                    if select < 3 { select += 1 }
                    else { if scroll < 100 { scroll += 1 } }
                    }
                }
            if able = 1 {
                if keyboard_check(vk_up) = 1 {
                    fade = 1;
                    able = 0;
                    if scroll = 0 { if select > 0 { select -= 1 } }
                    else { scroll -= 1 }
                    }
                }
            }
        }
    }
else {
    select = 0; scroll = 0; page = -1; subpage = 0;
    }
    
//make selection
if menu = 1 {
    if page = -1 {
        if able = 1 {
            if keyboard_check(ord("A")) = 1 {
                able = 0;
                if select = 7 { menu = 0 }
                else { page = select }
                }
            }
        if able = 1 {
            if keyboard_check(ord("S")) = 1 {
                able = 0;
                menu = 0;
                }
            }
        }
    if page = 0 { //catalog
        if able= 1 {
            if keyboard_check(ord("A")) = 1 {
                fade = 1;
                able = 0;
                if catalog[select+scroll,0] != "----" { 
                    if subpage < 2 { subpage += 1 }
                    else { subpage = 1 }
                    }
                }
            }
        if able= 1 {
            if keyboard_check(ord("S")) = 1 {
                fade = 1;
                able = 0;
                if subpage > 0 { subpage = 0 }
                else { page = -1; scroll = 0; select = 0; }
                }
            }
        }
    }
    
//reset
if keyboard_check(vk_enter) = 0 && keyboard_check(vk_down) = 0 && keyboard_check(vk_up) = 0
&& keyboard_check(ord("A")) = 0 && keyboard_check(ord("S")) = 0 {
    able = 1;
    }

///fade
if fade > 0 {
    fade -=.4
    }
else {
    fade = 0
    }

