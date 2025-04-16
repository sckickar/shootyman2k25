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
var meter_fill = (c_player.shoot_timer / c_player.shoot_duration);
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
    gun_sprite, 0, 
    gui_x + apply_scale_x(gun_x_offset), 
    gui_y + apply_scale_y(gun_y_offset), 
    global.gui_scale_x, global.gui_scale_y, 0, c_white, 1
);

draw_set_color(c_white);