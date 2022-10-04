///mev_pause_items_discard()
function mev_pause_items_discard() {
	if(global.item_data[my_item,id_PRICE] > 0){
		with(instance_create_depth(x,y,depth-1,obj_gguimenu)){
			daddy = other.id
			my_item = other.daddy.my_item_id[other.daddy.menuvalue_y]
			var qty = other.daddy.my_item_qty[other.daddy.menuvalue_y]
    
		    var bw = 200;
		    var bh = 80;
		    ggui_frame(VIEW_W*0.5 - bw*0.5,VIEW_H*0.5 - bh*0.5,bw,bh,spr_messagebox)
		    ggui_menu_preallocate(qty+1,1)
		    ggui_frame_set_scrolling(true,false,1,1,false,false)
    
		    ggui_element_text_settings(font_mainmsg,c_white,1,0)
		    ggui_element_text(0.5,ggui_frame_get_coord_y(12),"How many?\n<           >")
		    ggui_element_text_settings(font_mainmsg,c_white,1,0)
		    ggui_element_arbtext_scrollable(0.5,ggui_frame_get_coord_y(12),0,0,0)

		    for(var c = 0; c <= qty; c++){
		        if(c == 0){
		            //Quantity zero is a null operation
		            ggui_menu_region(c,0,mev_cancel,								NONE,NONE,NONE,NONE)
		        }
		        else{
		            //This discard is possible
		            ggui_menu_region(c,0,mev_pause_items_discard_actually_discard,	NONE,NONE,NONE,NONE)
		        }
		        ggui_fill_arbtext(c,0,0,"\n" + string_fix(c,2))
		    }
		}
	}
	else{
		message_spawn("No! It's too important to throw away!")
	}


}
