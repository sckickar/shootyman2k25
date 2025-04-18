if (place_meeting(x, y, p_wall)) {
    var angle = 0;
    var check_distance = 1;
    var max_check_distance = 32;
    var found_valid_position = false;
    
    while (!found_valid_position && check_distance <= max_check_distance) {
        for (angle = 0; angle < 360; angle += 45) {
            var test_x = x + lengthdir_x(check_distance, angle);
            var test_y = y + lengthdir_y(check_distance, angle);
            
            if (!place_meeting(test_x, test_y, p_wall)) {
                x = test_x;
                y = test_y;
                found_valid_position = true;
                break;
            }
        }
        
        check_distance += 4;
    }
    
    if (found_valid_position && instance_exists(c_player)) {
        direction = point_direction(x, y, c_player.x, c_player.y);
        speed = min(speed, 2);
    } else {
        direction = direction + 180;
        speed = speed * 0.8;
    }
} else {
    var ahead_x = x + lengthdir_x(sprite_width/2 + 5, direction);
    var ahead_y = y + lengthdir_y(sprite_height/2 + 5, direction);
    
    if (place_meeting(ahead_x, ahead_y, p_wall)) {
        var wall_angle = point_direction(x, y, ahead_x, ahead_y);
        var reflection_angle = wall_angle + 180;

        direction = direction + angle_difference(reflection_angle, direction) * 0.5;

        speed = speed * 0.9;
    }
}