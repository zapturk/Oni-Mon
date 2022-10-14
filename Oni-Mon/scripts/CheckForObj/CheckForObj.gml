function CheckForObj(obj, checkX, checkY){
	//Script to return id of object on point
	with(obj){
	    if(x == checkX && y == checkY) {
	        return id;
	    }
	}
	return noone;
}