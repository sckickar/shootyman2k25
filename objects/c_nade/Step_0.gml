depth = -y;

// Calculate distance to mouse
var dist_to_mouse = point_distance(x, y, mouse_x, mouse_y);
var max_slow_distance = 150; // Distance at which slowdown begins

// Apply slowdown effect based on proximity to mouse
var slowdown_factor = 1;
if (dist_to_mouse < max_slow_distance) {
    // This creates a gradual slowdown effect, becoming stronger as it gets closer
    slowdown_factor = max(0.1, dist_to_mouse / max_slow_distance);
}

// Calculate current speed based on distance
var current_speed = move_speed * slowdown_factor;

// Only move if we're not extremely close to the target
if (dist_to_mouse > 5) {
    // Get direction to mouse
    var dir = point_direction(x, y, mouse_x, mouse_y);
    
    // Move toward mouse with consistent speed
    x += lengthdir_x(current_speed, dir);
    y += lengthdir_y(current_speed, dir);
}

// Update vertical position (z-axis)
zspeed += zgrav;
z += zspeed;

if (z <= 0 || dist_to_mouse < 5) {
    instance_destroy();
}
