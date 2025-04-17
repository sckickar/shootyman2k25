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

function scale_ui_native() {
	var view_w = __view_get( e__VW.WView, 0 );

	var gui_x = view_w - gui_width + 2;
	var gui_y = 0;

	draw_sprite(gui_sprite, 0, gui_x, gui_y);
	var health_height = (health_current / health_max) * health_bar_height;
	var stamina_height = (stamina_current / stamina_max) * stamina_bar_height;
	var mana_height = (mana_current / mana_max) * mana_bar_height;
	draw_set_color(c_red);
	draw_rectangle(gui_x + health_bar_x_offset,
	    gui_y + health_bar_y_offset + (health_bar_height - health_height),
	    gui_x + health_bar_x_offset + health_bar_width,
	    gui_y + health_bar_y_offset + health_bar_height,
	    false);

	draw_set_color(make_color_rgb(255, 204, 0)); // Gold/brown color
	draw_rectangle(gui_x + stamina_bar_x_offset,
	    gui_y + stamina_bar_y_offset + (stamina_bar_height - stamina_height),
	    gui_x + stamina_bar_x_offset + stamina_bar_width,
	    gui_y + stamina_bar_y_offset + stamina_bar_height,
	    false);
	draw_set_color(c_blue);
	draw_rectangle(gui_x + mana_bar_x_offset,
	    gui_y + mana_bar_y_offset + (mana_bar_height - mana_height),
	    gui_x + mana_bar_x_offset + mana_bar_width,
	    gui_y + mana_bar_y_offset + mana_bar_height,
	    false);

	draw_set_color(make_color_rgb(255, 204, 0));
	
	var filled_width = gun_meter_width * (1 - meter_fill);

	draw_rectangle(
	        gui_x + gun_x_offset,
	        gui_y + gun_y_offset,
	        gui_x + gun_x_offset + filled_width,
	        gui_y + gun_y_offset + sprite_get_height(gun_sprite) - 4,
	        false
	);
	draw_sprite(gun_sprite, gun_type, gui_x + gun_x_offset, gui_y + gun_y_offset);
	draw_set_color(c_white);
}

function scale_ui_browser() {
	// Calculate GUI position
	global.gui_scale_x = 2;
	global.gui_scale_y = 2;

	var gui_x = display_get_gui_width() - apply_scale_x(gui_width) + 2;
	var gui_y = 0;

	// Draw GUI sprite with scaling
	draw_sprite_ext(gui_sprite, 0, gui_x, gui_y, global.gui_scale_x, global.gui_scale_y, 0, c_white, 1);

	// Calculate bar heights based on current values
	var health_height = (health_current / health_max) * apply_scale_y(health_bar_height);
	var stamina_height = (stamina_current / stamina_max) * apply_scale_y(stamina_bar_height);
	var mana_height = (mana_current / mana_max) * apply_scale_y(mana_bar_height);


	// Draw health bar
	draw_set_color(c_red);
	draw_rectangle(
	    gui_x + apply_scale_x(health_bar_x_offset),
	    gui_y + apply_scale_y(health_bar_y_offset) + (apply_scale_y(health_bar_height) - health_height),
	    gui_x + apply_scale_x(health_bar_x_offset) + apply_scale_x(health_bar_width),
	    gui_y + apply_scale_y(health_bar_y_offset) + apply_scale_y(health_bar_height),
	    false
	);

	// Draw stamina bar
	draw_set_color(make_color_rgb(255, 204, 0)); // Gold/brown color
	draw_rectangle(
	    gui_x + apply_scale_x(stamina_bar_x_offset),
	    gui_y + apply_scale_y(stamina_bar_y_offset) + (apply_scale_y(stamina_bar_height) - stamina_height),
	    gui_x + apply_scale_x(stamina_bar_x_offset) + apply_scale_x(stamina_bar_width),
	    gui_y + apply_scale_y(stamina_bar_y_offset) + apply_scale_y(stamina_bar_height),
	    false
	);

	// Draw mana bar
	draw_set_color(c_blue);
	draw_rectangle(
	    gui_x + apply_scale_x(mana_bar_x_offset),
	    gui_y + apply_scale_y(mana_bar_y_offset) + (apply_scale_y(mana_bar_height) - mana_height),
	    gui_x + apply_scale_x(mana_bar_x_offset) + apply_scale_x(mana_bar_width),
	    gui_y + apply_scale_y(mana_bar_y_offset) + apply_scale_y(mana_bar_height),
	    false
	);

	// Draw gun meter
	draw_set_color(make_color_rgb(255, 204, 0));
	
	var filled_width = apply_scale_x(gun_meter_width) * (1 - meter_fill);

	draw_rectangle(
	    gui_x + apply_scale_x(gun_x_offset),
	    gui_y + apply_scale_y(gun_y_offset),
	    gui_x + apply_scale_x(gun_x_offset) + filled_width,
	    gui_y + apply_scale_y(gun_y_offset) + apply_scale_y(sprite_get_height(gun_sprite) - 4),
	    false
	);

	// Draw gun sprite
	draw_sprite_ext(
	    gun_sprite, gun_type, 
	    gui_x + apply_scale_x(gun_x_offset), 
	    gui_y + apply_scale_y(gun_y_offset), 
	    global.gui_scale_x, global.gui_scale_y, 0, c_white, 1
	);

	draw_set_color(c_white);
}