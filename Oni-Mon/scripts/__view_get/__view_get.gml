function __view_get(prop, index) {
	var __prop = prop;
	var __index = index;

	var __res = -1;

	switch(__prop)
	{
	case ViewWindow.XView: var __cam = view_get_camera(__index); __res = camera_get_view_x(__cam); break;
	case ViewWindow.YView: var __cam = view_get_camera(__index); __res = camera_get_view_y(__cam); break;
	case ViewWindow.WView: var __cam = view_get_camera(__index); __res = camera_get_view_width(__cam); break;
	case ViewWindow.HView: var __cam = view_get_camera(__index); __res = camera_get_view_height(__cam); break;
	case ViewWindow.Angle: var __cam = view_get_camera(__index); __res = camera_get_view_angle(__cam); break;
	case ViewWindow.HBorder: var __cam = view_get_camera(__index); __res = camera_get_view_border_x(__cam); break;
	case ViewWindow.VBorder: var __cam = view_get_camera(__index); __res = camera_get_view_border_y(__cam); break;
	case ViewWindow.HSpeed: var __cam = view_get_camera(__index); __res = camera_get_view_speed_x(__cam); break;
	case ViewWindow.VSpeed: var __cam = view_get_camera(__index); __res = camera_get_view_speed_y(__cam); break;
	case ViewWindow.Object: var __cam = view_get_camera(__index); __res = camera_get_view_target(__cam); break;
	case ViewWindow.Visible: __res = view_get_visible(__index); break;
	case ViewWindow.XPort: __res = view_get_xport(__index); break;
	case ViewWindow.YPort: __res = view_get_yport(__index); break;
	case ViewWindow.WPort: __res = view_get_wport(__index); break;
	case ViewWindow.HPort: __res = view_get_hport(__index); break;
	case ViewWindow.Camera: __res = view_get_camera(__index); break;
	case ViewWindow.SurfaceID: __res = view_get_surface_id(__index); break;
	default: break;
	};

	return __res;
}
