///ggui_separator_box(l1,t1,l2,t2)
function ggui_separator_box(argument0, argument1, argument2, argument3) {
	//Add a separator box to the last added GUI frame.
	//Adds four lines to form a box.
	ggui_separator_line(argument0,argument1,argument2,argument1);
	ggui_separator_line(argument0,argument3,argument2,argument3);
	ggui_separator_line(argument0,argument1,argument0,argument3);
	ggui_separator_line(argument2,argument1,argument2,argument3);



}
