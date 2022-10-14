gml_pragma("global", "MACROS()");

#macro TILE_SIZE 16
#macro RESOLUTION_W 160
#macro RESOLUTION_H 144

enum directions {
	down,
	left,
	up,
	right,
	idle,
	locked
}

global.playerLastDir = directions.down;

global.componets = [];
global.componets[directions.right] = [1,0];
global.componets[directions.up] = [0,-1];
global.componets[directions.left] = [-1,0];
global.componets[directions.down] = [0,1];


global.playerSprite = []
global.playerSprite[directions.right] = sPlayerRight;
global.playerSprite[directions.up] = sPlayerUp;
global.playerSprite[directions.left] = sPlayerLeft;
global.playerSprite[directions.down] = sPlayerDown;