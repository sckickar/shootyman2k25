if (state == "onair") {
    y += zspeed;
	sway_angle += sway_speed;
	if (current_scale > target_scale) {
    current_scale -= shrink_speed;
    if (current_scale < target_scale) {
        current_scale = target_scale;
    }
	}
    if (y >= target_y) {
        state = "landed";
		sway_angle = 0;
    }
}