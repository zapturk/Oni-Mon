// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function InitConstants(){
	
	#region Miscellaneous

	#macro NONE -12341

	#macro TILESIZE 16
	#macro TILES_PER_ROW 20
	#macro TILES_WALKABLE_COLUMNS 10
	#macro TILES_SOLID_COLUMNS 10

	#macro VIEW_W 640
	#macro VIEW_H 360

	//Move sprites upwards a bit so they overlap with buildings even when their collision mask prevents it... makes them pop out more from the background.
	#macro CHARACTER_FOOT_PROTRUSION 4


	#macro SAVEFILES_MAX_ALLOWED 99

	#endregion

}