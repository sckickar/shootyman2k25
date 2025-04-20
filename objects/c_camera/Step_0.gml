var x_to, y_to;

if(follow != noone){
	x_to = follow.x;
	y_to = follow.y;
}

x += (x_to - x) / 25;
y += (y_to - y) / 25;

// Get the current camera
var cam = view_camera[0];

// Set camera position (centered on the object)
var cam_width = camera_get_view_width(cam);
var cam_height = camera_get_view_height(cam);
var cam_x = x - (cam_width / 2);
var cam_y = y - (cam_height / 2);

// Clamp camera position within room boundaries
cam_x = clamp(cam_x, 0, room_width - cam_width);
cam_y = clamp(cam_y, 0, room_height - cam_height);

// Update camera position
camera_set_view_pos(cam, cam_x, cam_y);

stamina_current = c_player.current_ammo;
stamina_max = c_player.max_ammo;


gun_type = clamp(c_player.current_weapon_index, 0, 4);