/// @description Instance deactivation
alarm[0] = 10;//Make sure it happens regularly


//Since we use tiles for terrain collision, we only need one activation region - no need to have
//a bigger region for terrain objects to prevent offscreen objects from getting stuck in suddenly
//materializing walls.
var regionsize = 96;
var cam = view_get_camera(0);
var tlc_x = camera_get_view_x(cam), tlc_y = camera_get_view_y(cam);

instance_deactivate_all(true)
instance_activate_region(tlc_x - regionsize,tlc_y - regionsize,VIEW_W + regionsize*2,VIEW_H + regionsize*2,true)
instance_activate_object(parent_active)