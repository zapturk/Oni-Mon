///ggui_separator_line(l1,t1,l2,t2)
function ggui_separator_line(argument0, argument1, argument2, argument3) {
	//Add a separator line to the last added GUI frame.
	//Coordinates are in percent of frame's size.
	var gf = ggui_frames - 1;
	ggui_frame_separator_x1[gf,ggui_frame_separators[gf]] = argument0;
	ggui_frame_separator_y1[gf,ggui_frame_separators[gf]] = argument1;
	ggui_frame_separator_x2[gf,ggui_frame_separators[gf]] = argument2;
	ggui_frame_separator_y2[gf,ggui_frame_separators[gf]] = argument3;
	ggui_frame_separators[gf]++;



}
