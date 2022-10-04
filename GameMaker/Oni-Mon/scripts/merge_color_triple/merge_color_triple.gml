///merge_color_triple(zerocol,middlecol,onecol,amount)
function merge_color_triple(argument0, argument1, argument2, argument3) {
	if(argument3 > 0.5){
		return merge_color(argument1,argument2,2*(argument3-0.5))
	}
	else{
		return merge_color(argument0,argument1,2*argument3)
	}


}
