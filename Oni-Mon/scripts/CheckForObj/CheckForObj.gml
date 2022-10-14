// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CheckForObj(obj, checkX, checkY){
	//Script to return id of object on point
	with(obj){
	    if(x == checkX && y == checkY) {
	        return id;
	    }
	}
	return noone;
}