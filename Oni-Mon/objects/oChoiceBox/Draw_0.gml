/// @description Insert description here
// You can write your code in this editor

//draw_border(20,6,0,96,c_black,c_white,2);
draw_self();


//draw text
draw_set_font(fMonogram);
draw_set_color(c_black);
draw_sprite_ext(sPointer, 0, x + 4, y + pointerYOffset, 1, 1, 0, c_black, 1);
for(var num = 0; num < array_length(choice); ++num){
	draw_text_ext(x + 14, y + ((12 * num) + 5), choice[num], stringHeight, boxWidth);
}
