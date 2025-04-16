// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scale(_bw, _bh, _cw, _ch, _center){
	var _aspect = (_bw / _bh);
	
	if((_cw / _aspect) > _ch ) {
		window_set_size((_ch * _aspect), _ch);
	} else {
		window_set_size(_cw, (_cw * _aspect));
	}
	
	if (_center) {
		window_center();
	}
	view_wport[0] = min(window_get_width(), _bw);
	view_hport[0] = min(window_get_height(), _bh);
		
	
	surface_resize(application_surface, view_wport[0], view_hport[0]);
	display_set_gui_size(view_wport[0], view_hport[0]);

	global.gui_scale_x = view_wport[0] / _bw;
	global.gui_scale_y = view_hport[0] / _bh;
}

function apply_scale_x(value) {
    return value * global.gui_scale_x;
}

function apply_scale_y(value) {
    return value * global.gui_scale_y;
}