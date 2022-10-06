function ggui_draw() {
	//ggui_draw()
	//Setup scrolling element coordinates
	if(!menu_scrollh || menu_scrollxsz > menu_w){
	    drawmenux = 0
	}
	else{
	    drawmenux = clamp(menuvalue_x - floor(menu_scrollxsz*0.5),0,menu_w - menu_scrollxsz)
	}
	if(!menu_scrollv || menu_scrollysz > menu_h){
	    drawmenuy = 0
	}
	else{
	    drawmenuy = clamp(menuvalue_y - floor(menu_scrollysz*0.5),0,menu_h - menu_scrollysz)
	}

	for(c = 0; c < ggui_frames;c++){
	    //Draw frame background
	    if(ggui_frame_bg[c] != NONE){
	        draw_guibox(    ggui_frame_l[ c],
	                        ggui_frame_t[ c],
	                        ggui_frame_l[ c] + ggui_frame_w[ c],
	                        ggui_frame_t[ c] + ggui_frame_h[ c],
	                        ggui_frame_bg[c]);
	    }

	    //Draw elements in this frame
    
	    //Actual draw loop
	    for(d = 0;d < ggui_frame_elements[c];d++){
	        xx = lerp(ggui_frame_l[c],ggui_frame_l[c] + ggui_frame_w[c],ggui_frame_element_x[c,d]);
	        yy = lerp(ggui_frame_t[c],ggui_frame_t[c] + ggui_frame_h[c],ggui_frame_element_y[c,d]);
	        switch(ggui_frame_element_type[c,d]){
	            //Static text
	            case gguielt_TEXT:
	                draw_font_settings(
	                    ggui_frame_element_font[    c,d],
	                    ggui_frame_element_color[   c,d],
	                    ggui_frame_element_halign[  c,d],
	                    ggui_frame_element_valign[  c,d]
	                    );
	                draw_text(xx,yy,ggui_frame_element_string[c,d]);
	            break;

	            //Static sprite
	            case gguielt_SPRITE:
	                draw_sprite(
	                    ggui_frame_element_sprite[  c,d],
	                    ggui_frame_element_image[   c,d],
	                    xx,
	                    yy
	                    );
	            break
			
				case gguielt_EXTSPRITE:
	                draw_sprite_ext(
	                    ggui_frame_element_sprite[  c,d],
	                    ggui_frame_element_image[   c,d],
	                    xx,
	                    yy,
						ggui_frame_element_arrdx[	c,d],
						ggui_frame_element_arrdy[	c,d],
						0,
						ggui_frame_element_halign[  c,d],
	                    ggui_frame_element_valign[  c,d]
	                    );
	            break
            
	            //Scrollable sprite
	            case gguielt_SCSPRITE:
	                xps = drawmenux + ggui_frame_element_arrdx[c,d]
	                yps = drawmenuy + ggui_frame_element_arrdy[c,d]
	                xpto= min(menu_w,drawmenux + menu_scrollxsz)
	                ypto= min(menu_h,drawmenuy + menu_scrollysz)
	                if( xps < xpto &&
	                    yps < ypto &&
	                    xps >= 0   &&
	                    yps >= 0)
	                {
	                    s = menu_sprite[xps,yps]
	                    if(s != NONE){
	                        draw_sprite(s,menu_image[xps,yps],xx,yy);
	                    }
	                }
	            break
			
				case gguielt_CURRSPRITE:
					xps = drawmenux + ggui_frame_element_arrdx[c,d]
	                yps = drawmenuy + ggui_frame_element_arrdy[c,d]
	                xpto= min(menu_w,drawmenux + menu_scrollxsz)
	                ypto= min(menu_h,drawmenuy + menu_scrollysz)
	                if( xps < xpto &&
	                    yps < ypto &&
	                    xps >= 0   &&
	                    yps >= 0)
	                {
						if(menuvalue_x < menu_w && menuvalue_y < menu_h){
		                    s = menu_sprite[menuvalue_x,menuvalue_y]
		                    if(s != NONE){
		                        draw_sprite(s,menu_image[menuvalue_x,menuvalue_y],xx,yy);
		                    }
						}
	                }
				break
            
	            //Scrollable text
	            case gguielt_SCTEXT:
	            case gguielt_SCDESC:
	            case gguielt_SCARBTEXT:
	            case gguielt_ARBTEXT:
	            case gguielt_CURRTEXT:
	            case gguielt_CURRDESC:
	                xps = drawmenux + ggui_frame_element_arrdx[c,d]
	                yps = drawmenuy + ggui_frame_element_arrdy[c,d]
	                xpto= min(menu_w,drawmenux + menu_scrollxsz)
	                ypto= min(menu_h,drawmenuy + menu_scrollysz)
	                if( xps < xpto &&
	                    yps < ypto &&
	                    xps >= 0   &&
	                    yps >= 0)
	                {
	                    s = ""
	                    if(ggui_frame_element_type[c,d] == gguielt_SCTEXT){
	                        if(xps < menu_w && yps < menu_h){
	                            s = menu_text[xps,yps]
	                        }
	                    }
	                    else if(ggui_frame_element_type[c,d] == gguielt_SCDESC){
	                        if(xps < menu_w && yps < menu_h){
	                            s = menu_desc[xps,yps]
	                        }
	                    }
	                    else if(ggui_frame_element_type[c,d] == gguielt_SCARBTEXT){
	                        if(xps < menu_w && yps < menu_h){
	                            s = menu_arbtxt[ggui_frame_element_arbind[c,d],(xps) + (yps)*menu_w]//Yes, y pos * menu w is correct (+1 y pos = full row)
	                        }
	                    }
	                    else if(ggui_frame_element_type[c,d] == gguielt_ARBTEXT){
	                        if(menuvalue_x < menu_w && menuvalue_y < menu_h){
	                            s = menu_arbtxt[ggui_frame_element_arbind[c,d],(menuvalue_x) + (menuvalue_y)*menu_w]
	                        }
	                    }
	                    else if(ggui_frame_element_type[c,d] == gguielt_CURRTEXT){
	                        if(menuvalue_x < menu_w && menuvalue_y < menu_h){
	                            s = menu_text[menuvalue_x,menuvalue_y]
	                        }
	                    }
	                    else if(ggui_frame_element_type[c,d] == gguielt_CURRDESC){
	                        if(menuvalue_x < menu_w && menuvalue_y < menu_h){
	                            s = menu_desc[menuvalue_x,menuvalue_y]
	                        }
	                    }
	                    draw_font_settings(
	                        ggui_frame_element_font[    c,d],
	                        ggui_frame_element_color[   c,d],
	                        ggui_frame_element_halign[  c,d],
	                        ggui_frame_element_valign[  c,d]
	                        );
	                    draw_text(xx,yy,s);
	                }
	            break
            
	            //Scrollbar
	            case gguielt_SCROLLBAR:
	                xx2 = lerp(ggui_frame_l[c],ggui_frame_l[c] + ggui_frame_w[c],ggui_frame_element_arrdx[c,d]);
	                yy2 = lerp(ggui_frame_t[c],ggui_frame_t[c] + ggui_frame_h[c],ggui_frame_element_arrdy[c,d]);
	                if(ggui_frame_element_valign[c,d]){
	                    //Vertical scrollbar
	                    if(menu_h <= menu_scrollv){continue} //No need for a scrollbar
	                    scb_pos= menuvalue_y/(menu_h-1)
	                }
	                else{
	                    //Horizontal scrollbar
	                    if(menu_w <= menu_scrollh){continue} //No need for a scrollbar
	                    scb_pos= menuvalue_x/(menu_w-1)
	                }
	                gpu_set_texfilter(true)
	                draw_set_color(c_gray)
	                draw_line(xx,yy,xx2,yy2)
	                draw_set_color(c_white)
	                draw_circle(lerp(xx,xx2,scb_pos),lerp(yy,yy2,scb_pos),5,false)
	                gpu_set_texfilter(false)
	            break
            
	            //Page dots
	            case gguielt_PAGEDOTS:
	                xx2 = lerp(ggui_frame_l[c],ggui_frame_l[c] + ggui_frame_w[c],ggui_frame_element_arrdx[c,d]);
	                eto = ggui_frame_element_sprite[c,d]
	                gpu_set_texfilter(true)
	                for(e = 0;e < eto;e++){
	                    if(e == ggui_frame_element_image[c,d]){
	                        draw_circle(lerp(xx,xx2,e/eto),yy,6,false)
	                    }
	                    else{
	                        draw_circle(lerp(xx,xx2,e/eto),yy,4,true)
	                    }
	                }
	                gpu_set_texfilter(false)
	            break
            
	            //Input button
	            case gguielt_INPUTBUTTON:
	                draw_buttonicon(xx,yy,ggui_frame_element_valign[c,d],global.input_key[ggui_frame_element_halign[c,d],ggui_frame_element_valign[c,d]])
	            break;
            
	            //Input button (scrollable in array)
	            case gguielt_SCINPUTBUTTON:
	                xps = drawmenux + ggui_frame_element_arrdx[c,d]
	                yps = drawmenuy + ggui_frame_element_arrdy[c,d]
	                xpto= min(menu_w,drawmenux + menu_scrollxsz)
	                ypto= min(menu_h,drawmenuy + menu_scrollysz)
	                if( xps < xpto &&
	                    yps < ypto &&
	                    xps >= 0   &&
	                    yps >= 0)
	                {
	                    if(xps < menu_w && yps < menu_h){
	                        s = real(menu_arbtxt[ggui_frame_element_arbind[c,d],(xps) + (yps)*menu_w])
	                        if(s != NONE){
	                            draw_buttonicon(xx,yy,ggui_frame_element_valign[c,d],global.input_key[s,ggui_frame_element_valign[c,d]])
	                        }
	                    }
	                }
	            break;
			
				//Healthbar
				case gguielt_HEALTHBAR:
					var mon = ggui_frame_element_valign[c,d];
					if(mon >= 0 && mon < AMP_TOTAL_MONSTERS && global.active_monster_party[mon,amp_MONID] != NONE){
						var hpa = amp_read_var(mon,amp_HP), hpm = monster_get_mhp(mon);
						var hpp = hpa/hpm;
						var ccc = merge_color_triple(c_red,c_yellow,c_green,hpp)
						draw_healthbar(xx,yy,xx + lerp(0,ggui_frame_w[c],ggui_frame_element_halign[c,d]),yy + 12,hpp*100,c_black,ccc,ccc,0,true,true)
						//Draw current health as text as well
						draw_font_settings(font_n,c_black,1,0)
						draw_text(xx + lerp(0,ggui_frame_w[c],ggui_frame_element_halign[c,d]*0.5),yy + 14,tsprintf("HP: % / %",hpa,hpm))
					}
				break
			
				//Healthbar (scrollable/current)
				case gguielt_SCHEALTHBAR:
					var mon = menu_first_monster + ggui_frame_element_arrdx[c,d] + ggui_frame_element_arrdy[c,d]*menu_w;
					if(mon >= 0 && mon < AMP_TOTAL_MONSTERS && global.active_monster_party[mon,amp_MONID] != NONE){
						var hpa = amp_read_var(mon,amp_HP), hpm = monster_get_mhp(mon);
						var hpp = hpa/hpm;
						var ccc = merge_color_triple(c_red,c_yellow,c_green,hpp)
						draw_healthbar(xx,yy,xx + lerp(0,ggui_frame_w[c],ggui_frame_element_halign[c,d]),yy + 12,hpp*100,c_black,ccc,ccc,0,true,true)
						//Draw current health as text as well
						draw_font_settings(font_n,c_black,1,0)
						draw_text(xx + lerp(0,ggui_frame_w[c],ggui_frame_element_halign[c,d]*0.5),yy + 14,tsprintf("HP: % / %",hpa,hpm))
					}
				break
	        }
	    }

	    //Draw separators in this frame
	    draw_set_color(c_white);
	    for(d = 0;d < ggui_frame_separators[c];d++){
	        draw_line(
	            lerp(ggui_frame_l[c],ggui_frame_l[c] + ggui_frame_w[c],ggui_frame_separator_x1[c,d]),
	            lerp(ggui_frame_t[c],ggui_frame_t[c] + ggui_frame_h[c],ggui_frame_separator_y1[c,d]),
	            lerp(ggui_frame_l[c],ggui_frame_l[c] + ggui_frame_w[c],ggui_frame_separator_x2[c,d]),
	            lerp(ggui_frame_t[c],ggui_frame_t[c] + ggui_frame_h[c],ggui_frame_separator_y2[c,d])
	            )
	    }
	}
	//Draw currently active region
	if(menu_scrollh){
	    mvx = menuvalue_x-drawmenux
	}
	else{
	    mvx = menuvalue_x
	}
	if(menu_scrollv){
	    mvy = menuvalue_y-drawmenuy
	}
	else{
	    mvy = menuvalue_y
	}
	if(mvx < menu_w && mvy < menu_h){
	    frame = menu_frame[mvx,mvy];
	    if(frame != NONE){
	        if(active){
	            draw_set_alpha(0.5 + lengthdir_x(0.25,current_time*0.3));
	        }
	        else{
	            draw_set_alpha(0.25)
	        }
	        draw_set_color(c_white);
	        draw_rectangle(
	            lerp(ggui_frame_l[frame],ggui_frame_l[frame] + ggui_frame_w[frame],menu_reg_l[mvx,mvy]),
	            lerp(ggui_frame_t[frame],ggui_frame_t[frame] + ggui_frame_h[frame],menu_reg_t[mvx,mvy]),
	            lerp(ggui_frame_l[frame],ggui_frame_l[frame] + ggui_frame_w[frame],menu_reg_r[mvx,mvy]),
	            lerp(ggui_frame_t[frame],ggui_frame_t[frame] + ggui_frame_h[frame],menu_reg_b[mvx,mvy]),
	            false
	            );
	        draw_set_alpha(1);
	    }
	}




}
