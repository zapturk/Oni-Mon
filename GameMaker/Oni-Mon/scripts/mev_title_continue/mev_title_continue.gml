///mev_title_continue()
function mev_title_continue() {

	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
		//Setup list of 5 items
	ggui_menu_preallocate(1,SAVEFILES_MAX_ALLOWED + 1)
	ggui_frame(VIEW_W*0.3,VIEW_H*0.1,VIEW_W*0.6,VIEW_H*0.8,spr_messagebox)
	dfmax = 5
	ggui_frame_set_scrolling(false,true,1,5,false,true)
	var c;

	hh = 0.9/dfmax
	for(c = 0;c < dfmax;c++){
	    yy = lerp(0.05,0.95,c/dfmax)
	    xxa= 0
	    yya= c
	    //Icon
	    ggui_element_sprite_scrollable(0.1,yy + 0.1*hh,xxa,yya)
	    //0 - Name (bigger text)
	    ggui_element_text_settings(font_nfat,c_white,0,0)
	    ggui_element_arbtext_scrollable(0.1 + ggui_frame_get_coord_x(40),yy + 0.1*hh,xxa,yya,0)
    
	    //1 - Class, level, 2 - playtime, 3 - saved area
	    ggui_element_text_settings(font_n,c_white,0,0)
	    ggui_element_arbtext_scrollable(0.1 + ggui_frame_get_coord_x(40),yy + 0.5*hh,xxa,yya,1)
	    ggui_element_text_settings(font_n,c_white,2,0)
	    ggui_element_arbtext_scrollable(0.9,                             yy + 0.1*hh,xxa,yya,2)
	    ggui_element_arbtext_scrollable(0.9,                             yy + 0.5*hh,xxa,yya,3)
    
	    //4 - Error message in center
	    ggui_element_text_settings(font_nfat,c_white,1,1)
	    ggui_element_arbtext_scrollable(0.5,yy + 0.5*hh,xxa,yya,4)
	}

	//Fill scrollable things with up to 99 files
	files_found = 0

	for(c = 0; c < SAVEFILES_MAX_ALLOWED; c++){
	    yy = lerp(0.05,0.95,files_found/dfmax)
    
	    fn = filenameify_savefile(c)
	    if(file_exists(fn)){
	        //This loads ALL the data... maybe could be sped up somehow, but we want
	        //to verify files aren't tampered with, so we need to read the entire thing.
	        //If this isn't a concern for you, you could save the display data at the
	        //beginning of the file and only load those lines, then abort the read.
	        savefile_load(fn)
        
	        if(global.hacked){
	            mev = NONE
	            ggui_fill_arbtext(0,files_found,0,"")
	            ggui_fill_arbtext(0,files_found,1,"")
	            ggui_fill_arbtext(0,files_found,2,"")
	            ggui_fill_arbtext(0,files_found,3,"")
	            ggui_fill_arbtext(0,files_found,4,"File corrupt#(Cannot load)")
	        }
	        else{
	            mev = mev_title_continue_fileselected
            
				var badges = 0;
				for(var b = 0;b < NUMBER_OF_BADGES; b++){
					badges += global.player_badges[b]
				}
			
	            ggui_fill_meta(   0,files_found,spr_characterfilesymbol,0, "","")
	            ggui_fill_arbtext(0,files_found,0,global.player_name)
	            ggui_fill_arbtext(0,files_found,1,tsprintf("Seen: %  Caught: %",global.monsters_seen_total,global.monsters_caught_total))
	            ggui_fill_arbtext(0,files_found,2,string_fix_hhmmss(global.playtime_steps))
	            ggui_fill_arbtext(0,files_found,3,tsprintf("League Emblems: %",badges))
	            ggui_fill_arbtext(0,files_found,4,"")
	        }
        
	        ggui_menu_region(0,files_found,mev,0.05,yy,0.95,yy+hh)
	        selected_filename[files_found] = fn
	        files_found++
	    }
	}
	//Add another at the end
	ggui_fill_arbtext(0,files_found,0,"")
	ggui_fill_arbtext(0,files_found,1,"")
	ggui_fill_arbtext(0,files_found,2,"")
	ggui_fill_arbtext(0,files_found,3,"")
	ggui_fill_arbtext(0,files_found,4,"Cancel")
	ggui_menu_region(0,files_found,mev_cancel,0.05,yy,0.95,yy+hh)

	ggui_menu_resize(1,files_found + 1)
	}


}
