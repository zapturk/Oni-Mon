///mev_shop_buyitem()
function mev_shop_buyitem() {

	//Add menu for selection of up to 99 items,
	//but cap out early if money or qty doesn't allow for such a big purchase.
	with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
	    with(other){
	        other.unit_cost = shop_cost[menuvalue_y]
	        other.unit_item = shop_item[menuvalue_y]
	        other.daddy     = id
	    }
    
	    var bw = 200;
	    var bh = 100;
	    ggui_frame(VIEW_W*0.5 - bw*0.5,VIEW_H*0.5 - bh*0.5,bw,bh,spr_messagebox)
	    ggui_menu_preallocate(100,1)
	    ggui_frame_set_scrolling(true,false,1,1,false,false)
    
	    ggui_element_text_settings(font_mainmsg,c_white,1,0)
	    ggui_element_text(0.5,ggui_frame_get_coord_y(8),"How many?\n<           >")
	    ggui_element_text_settings(font_mainmsg,c_white,1,0)
	    ggui_element_arbtext_scrollable(0.5,ggui_frame_get_coord_y(8),0,0,0)
	    ggui_element_text_settings(font_n,c_white,2,0)
	    ggui_element_arbtext_scrollable(0.85,1 - ggui_frame_get_coord_y(24),0,0,1)
	    ggui_element_text_settings(font_n,c_white,0,0)
	    ggui_element_text(0.15,1 - ggui_frame_get_coord_y(24),"Total Cost:")

	    for(var c = 0; c <= 99; c++){
	        if(c == 0){
	            //Quantity zero is a null operation
	            ggui_menu_region(c,0,mev_cancel,              NONE,NONE,NONE,NONE)
	        }
	        else if(
	            global.player_money >= unit_cost*c
	        ){
	            //This purchase is possible
	            ggui_menu_region(c,0,mev_shop_buyitem_confirm,NONE,NONE,NONE,NONE)
	        }
	        else{
	            //This purchase isn't possible, abort
	            ggui_menu_resize(c,1)
	            if(c == 1){
	                //Only the "00" was valid...
	                if(global.player_money >= unit_cost){
	                    //We can afford it, so the failure was since it's sold out. Convey this.
	                    ggui_fill_arbtext(0,0,0,"\nSOLD\nOUT")
	                }
	                else{
	                    //We can't afford it, and just a 00 looks weird... add in explanatory text.
	                    ggui_fill_arbtext(0,0,0,"\nCAN'T\nAFFORD")
	                }
	            }
	            break
	        }
	        ggui_fill_arbtext(c,0,0,"\n" + string_fix(c,2))
	        ggui_fill_arbtext(c,0,1,string(unit_cost*c))
	    }
	}


}
