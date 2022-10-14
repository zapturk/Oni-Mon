function draw_border(width, height, bgx, bgy, color, backColor, backIndex) {
	var w,h,bx,by,c,bc,bi;
	w = width; h = height; bx = bgx; by = bgy; c = color; bc = backColor; bi = backIndex;

	draw_set_color(bc);
	draw_rectangle(__view_get( ViewWindow.XView, 0 )+bx,__view_get( ViewWindow.YView, 0 )+by,__view_get( ViewWindow.XView, 0 )+bx+w*8-1,__view_get( ViewWindow.YView, 0 )+by+h*8-1,0);
	//corners
	draw_sprite_part_ext(S_Border,bi,00,00,8,8,__view_get( ViewWindow.XView, 0 )+bx/*//*/,__view_get( ViewWindow.YView, 0 )+by/*//*/,1,1,c,1);
	draw_sprite_part_ext(S_Border,bi,16,00,8,8,__view_get( ViewWindow.XView, 0 )+bx+w*8-8,__view_get( ViewWindow.YView, 0 )+by/*//*/,1,1,c,1);
	draw_sprite_part_ext(S_Border,bi,00,16,8,8,__view_get( ViewWindow.XView, 0 )+bx/*//*/,__view_get( ViewWindow.YView, 0 )+by+h*8-8,1,1,c,1);
	draw_sprite_part_ext(S_Border,bi,16,16,8,8,__view_get( ViewWindow.XView, 0 )+bx+w*8-8,__view_get( ViewWindow.YView, 0 )+by+h*8-8,1,1,c,1);
	//width
	for(i=1;i<w-1;i+=1) {
	    draw_sprite_part_ext(S_Border,bi,8,00,8,8,__view_get( ViewWindow.XView, 0 )+bx+i*8,__view_get( ViewWindow.YView, 0 )+by/*//*/,1,1,c,1);
	    draw_sprite_part_ext(S_Border,bi,8,16,8,8,__view_get( ViewWindow.XView, 0 )+bx+i*8,__view_get( ViewWindow.YView, 0 )+by+h*8-8,1,1,c,1);
	    }
	//height
	for(i=1;i<h-1;i+=1) {
	    draw_sprite_part_ext(S_Border,bi,00,8,8,8,__view_get( ViewWindow.XView, 0 )+bx/*//*/,__view_get( ViewWindow.YView, 0 )+by+i*8,1,1,c,1);
	    draw_sprite_part_ext(S_Border,bi,16,8,8,8,__view_get( ViewWindow.XView, 0 )+bx+w*8-8,__view_get( ViewWindow.YView, 0 )+by+i*8,1,1,c,1);
	    }



}
