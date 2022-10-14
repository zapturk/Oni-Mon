/// @description Insert description here
// You can write your code in this editor

enum states {
	idle,
	walking
}

state = states.idle;

xPos = x div TILE_SIZE;
yPos = y div TILE_SIZE;

xFrom = xPos;
yFrom = yPos;

xTo = xPos;
yTo = yPos;

walkAnimLen = 0.5;
walkAnimTime = 0;

dir = directions.down;

image_speed = 0;
image_index = 1;

sprite = global.playerSprite;