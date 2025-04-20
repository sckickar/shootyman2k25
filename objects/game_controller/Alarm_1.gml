if (random(1) < spawn_chance && instance_number(enemy_object) < max_enemies) {
	enemy_object = choose(c_enemy_3, c_enemy); 
    var view_x = __view_get(e__VW.XView, 0);
    var view_y = __view_get(e__VW.YView, 0);
    var view_w = __view_get(e__VW.WView, 0);
    var view_h = __view_get(e__VW.HView, 0);
    
    var spawn_x, spawn_y;
    var spawn_edge = irandom(3);
    
    switch(spawn_edge) {
        case 0: // Top edge
            spawn_x = view_x + random(view_w);
            spawn_y = view_y - spawn_distance;
            break;
        case 1: // Right edge
            spawn_x = view_x + view_w + spawn_distance;
            spawn_y = view_y + random(view_h);
            break;
        case 2: // Bottom edge
            spawn_x = view_x + random(view_w);
            spawn_y = view_y + view_h + spawn_distance;
            break;
        case 3: // Left edge
            spawn_x = view_x - spawn_distance;
            spawn_y = view_y + random(view_h);
            break;
    }
    
    spawn_x = clamp(spawn_x, 0, room_width);
    spawn_y = clamp(spawn_y, 0, room_height);
    
    if (place_meeting(spawn_x, spawn_y, p_wall)) {
        var view_center_x = view_x + (view_w / 2);
        var view_center_y = view_y + (view_h / 2);
        var dir_to_center = point_direction(spawn_x, spawn_y, view_center_x, view_center_y);
        
        var max_attempts = 10;
        var attempt = 0;
        var found_valid_position = false;
        
        while (!found_valid_position && attempt < max_attempts) {
            attempt++;
            
            var adjusted_distance = spawn_distance - (attempt * 10);
            
            adjusted_distance = max(adjusted_distance, 32);
            
            switch(spawn_edge) {
                case 0: // Top edge
                    spawn_y = view_y - adjusted_distance;
                    break;
                case 1: // Right edge
                    spawn_x = view_x + view_w + adjusted_distance;
                    break;
                case 2: // Bottom edge
                    spawn_y = view_y + view_h + adjusted_distance;
                    break;
                case 3: // Left edge
                    spawn_x = view_x - adjusted_distance;
                    break;
            }
            
            spawn_x = clamp(spawn_x, 0, room_width);
            spawn_y = clamp(spawn_y, 0, room_height);
            
            if (!place_meeting(spawn_x, spawn_y, p_wall)) {
                with(enemy_object){
					instance_destroy();
				}
            }
        }
        
        if (found_valid_position) {
            instance_create(spawn_x, spawn_y, enemy_object);
        }
    } else {
        // Original position is fine, create enemy
        instance_create(spawn_x, spawn_y, enemy_object);
    }
}

alarm[1] = 1;