last_x = 0;
last_y = 0;

follow = c_player;
cam_width = 400;
cam_height = 300;

x_to = room_width / 2;
y_to = room_height / 2;

gui_sprite = s_ui;
gui_width = sprite_get_width(gui_sprite);
gui_height = sprite_get_height(gui_sprite);
gun_sprite = s_ui_gun;
gun_x_offset = 2;
gun_y_offset = 0;
gun_meter_width = sprite_get_width(gun_sprite);
gun_meter_height = sprite_get_height(gun_sprite);
gun_type = 0;
meter_fill = 0;

nades = c_player.grenades;

nade_sprite = s_ui_nades;
nade_meter_width = sprite_get_width(nade_sprite);
nade_meter_height = sprite_get_height(nade_sprite);

// UI data
health_max = c_player.hp;
health_current = c_player.hp;
stamina_max = c_player.max_ammo;
stamina_current = c_player.current_ammo;
mana_max = 100;
mana_current = 60;
pills_count = 10;
time_remaining = 60; // in seconds
kills_count = 0;

health_bar_x_offset = 2;
health_bar_y_offset = 34;
health_bar_width = 28;
health_bar_height = 79;

stamina_bar_x_offset = 34;
stamina_bar_y_offset = 34;
stamina_bar_width = 28;
stamina_bar_height = 79;

mana_bar_x_offset = 68;
mana_bar_y_offset = 34;
mana_bar_width = 28;
mana_bar_height = 79;