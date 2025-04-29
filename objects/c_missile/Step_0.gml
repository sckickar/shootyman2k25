var _dir = point_direction(x, y, mouse_x, mouse_y)

var _spd = homing_speed;

x += lengthdir_x(_spd, _dir);
y += lengthdir_y(_spd, _dir);

image_angle = _dir;

if (!variable_instance_exists(id, "smoke_timer")) {
    smoke_timer = 0;
}

smoke_timer += 1;
if (smoke_timer >= 5) {
    instance_create_layer(x + 5, y, "Instances", c_explosion);
    smoke_timer = 0;
}

if (point_distance(mouse_x, mouse_y, x, y) < 20) {
    instance_create_layer(x, y, "Instances", c_explosion_2);
    instance_destroy();
}