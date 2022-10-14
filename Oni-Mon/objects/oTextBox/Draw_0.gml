/// @description Insert description here
// You can write your code in this editor

//draw_border(20,6,0,96,c_black,c_white,2);
draw_self();


//draw text
draw_set_font(fMonogram);
draw_set_color(c_black);
draw_text_ext(x + 7,y + 3, text[page], stringHeight, boxWidth);

if(hasChoice && page == choicePage){
	if(myChoiceBox == noone){
		var vx = camera_get_view_x(view_camera[0]) + 120;
		var vy = camera_get_view_y(view_camera[0]) + 63;
		myChoiceBox = instance_create_layer(vx, vy, "Choice", oChoiceBox);
		myChoiceBox.choice = choice;
		choiceOpen = true;
		textBox = self;
	}
}