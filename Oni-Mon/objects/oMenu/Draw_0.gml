/// @description menu
draw_set_font(Primary_Font);
if menu = 1 {
    if page = -1 {
        draw_border(20,6,0,104,c_black,c_white,0);
        draw_set_color(c_black);
        var s = "";
		var ss = ""; 
        if select = 0 { s = "Bestiary"; ss = "catalogue"; }
        if select = 1 { s = "Current"; ss = "Oni"; }
        if select = 2 { s = "Manage"; ss = "items"; }
        if select = 3 { s = "Use apps"; }
        if select = 4 { s = "Personal"; ss = "info" }
        if select = 5 { s = "Save your"; ss = "progress" }
        if select = 6 { s = "Change"; ss = "settings" }
        if select = 7 { s = "Close menu"; }
        draw_text(__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )-4+112,string_hash_to_newline(s));
        draw_text(__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )-4+128,string_hash_to_newline(ss));
        draw_border(10,18,80,0,c_black,c_white,2);
        draw_set_color(c_black);
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+16,string_hash_to_newline("Bestiary"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+32,string_hash_to_newline("Oni"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+48,string_hash_to_newline("Pack"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+64,string_hash_to_newline("Phone"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+80,string_hash_to_newline("Me"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+96,string_hash_to_newline("Save"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+112,string_hash_to_newline("Options"));
        draw_text(__view_get( ViewWindow.XView, 0 )+100,__view_get( ViewWindow.YView, 0 )-8+128,string_hash_to_newline("Exit"));
        //select
        draw_sprite_ext(sPointer,0,__view_get( ViewWindow.XView, 0 )+88,__view_get( ViewWindow.YView, 0 )-6+16+select*16,1,1,0,c_black,1)
        }
    }

///catalog
if menu = 1 {
	if page = 0 {
    draw_set_color(c_black)
    draw_rectangle(__view_get( ViewWindow.XView, 0 ),__view_get( ViewWindow.YView, 0 ),__view_get( ViewWindow.XView, 0 )+160,__view_get( ViewWindow.YView, 0 )+144,0)
    if subpage = 0 {
        //select
        draw_sprite_ext(sPointer,1,__view_get( ViewWindow.XView, 0 )+72,__view_get( ViewWindow.YView, 0 )-4+16+select*16,1,1,0,c_white,1)
        //names
        draw_set_font(Primary_Font); draw_set_color(c_white);
        for(i=0;i<7;i+=1) {
            draw_text(__view_get( ViewWindow.XView, 0 )+78,__view_get( ViewWindow.YView, 0 )+8+(i)*16,string_hash_to_newline(catalog[i+scroll,0]))
            }
        //preview
        for(i=0;i<56;i+=1) {
            if i%2==0 { //irandom(ceil(fade)) {
                draw_sprite_part_ext(catalog[select+scroll,1],0,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(20, 70, 90),1)
                draw_sprite_part_ext(catalog[select+scroll,1],1,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(15, 115, 115),1)
                draw_sprite_part_ext(catalog[select+scroll,1],2,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(15, 165, 105),1)
                draw_sprite_part_ext(catalog[select+scroll,1],3,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(65, 205, 115),1)
                }
            else {
                draw_sprite_part_ext(catalog[select+scroll,1],0,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(15, 115, 115),1)
                draw_sprite_part_ext(catalog[select+scroll,1],1,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(15, 165, 105),1)
                draw_sprite_part_ext(catalog[select+scroll,1],2,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(65, 205, 115),1)
                draw_sprite_part_ext(catalog[select+scroll,1],3,0,0+i,56,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+8+i,1,1,make_colour_rgb(115, 255, 115),1)
                }
            }
    }
    else {
        //color image
        draw_sprite_ext(catalog[select+scroll,1],0,__view_get( ViewWindow.XView, 0 )+36,__view_get( ViewWindow.YView, 0 )+36,1,1,0,catalog[select+scroll,2],1)
        draw_sprite_ext(catalog[select+scroll,1],1,__view_get( ViewWindow.XView, 0 )+36,__view_get( ViewWindow.YView, 0 )+36,1,1,0,catalog[select+scroll,3],1)
        draw_sprite_ext(catalog[select+scroll,1],2,__view_get( ViewWindow.XView, 0 )+36,__view_get( ViewWindow.YView, 0 )+36,1,1,0,catalog[select+scroll,4],1)
        draw_sprite_ext(catalog[select+scroll,1],3,__view_get( ViewWindow.XView, 0 )+36,__view_get( ViewWindow.YView, 0 )+36,1,1,0,c_white,1)
        //footprint
        draw_sprite_ext(S_Footprint,select+scroll,__view_get( ViewWindow.XView, 0 )+136,__view_get( ViewWindow.YView, 0 )+8,1,1,0,c_white,1)
        //name
        draw_set_font(Primary_Font); draw_set_color(c_white);
        draw_text(__view_get( ViewWindow.XView, 0 )+70,__view_get( ViewWindow.YView, 0 )+8,string_hash_to_newline(catalog[select+scroll,0]));
        //blurb
        draw_text(__view_get( ViewWindow.XView, 0 )+70,__view_get( ViewWindow.YView, 0 )+24,string_hash_to_newline(catalog[select+scroll,8]));
        //number
        var zeros; zeros = "";
        if select+scroll+1 < 100 { zeros = "0" }
        if select+scroll+1 < 10 { zeros = "00" }
        draw_set_halign(fa_right);
        draw_text(__view_get( ViewWindow.XView, 0 )+65,__view_get( ViewWindow.YView, 0 )+62,string_hash_to_newline(zeros+string(select+scroll+1)));
        draw_set_halign(fa_left);
        //subpage
        draw_set_font(F_SmallFont)
        draw_text(__view_get( ViewWindow.XView, 0 )+16,__view_get( ViewWindow.YView, 0 )+73,string_hash_to_newline(string(subpage)));
        //description
        draw_set_font(Primary_Font)
        draw_text_ext(__view_get( ViewWindow.XView, 0 )+10,__view_get( ViewWindow.YView, 0 )+82,string_hash_to_newline(catalog[select+scroll,8+subpage]),10,142);
        //bottom bar
        draw_text(__view_get( ViewWindow.XView, 0 )+14,__view_get( ViewWindow.YView, 0 )+124,string_hash_to_newline("PAGE"))
        draw_sprite(sPointer,1,__view_get( ViewWindow.XView, 0 )+8,__view_get( ViewWindow.YView, 0 )+128)
        }
    //layout
    draw_sprite(S_Catalog,subpage,__view_get( ViewWindow.XView, 0 ),__view_get( ViewWindow.YView, 0 ))
    }
}