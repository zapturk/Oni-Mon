///ggui_frame(l,t,w,h,background)
function ggui_frame(argument0, argument1, argument2, argument3, argument4) {
	//Add an empty GUI frame. Width and height are in pixels.
	ggui_frame_l[ ggui_frames] = argument0;
	ggui_frame_t[ ggui_frames] = argument1;
	ggui_frame_w[ ggui_frames] = argument2;
	ggui_frame_h[ ggui_frames] = argument3;
	ggui_frame_bg[ggui_frames] = argument4;

	ggui_frame_elements[ggui_frames]    = 0;
	ggui_frame_separators[ggui_frames]  = 0;

	ggui_frames++;



}
