/// @description Insert description here
// You can write your code in this editor

enum state{
	out,
	in,
	delay
}

duration = 60;
targetRoom = room;
color = make_color_rgb(248, 248, 248);

timer = 0;
alpha = 0;
curState = state.out;

mPlayerX = 0;
mPlayerY = 0;
mPlayerDir = directions.down;
