depth = -y;

mouse_dir = point_direction(x, y, mouse_x, mouse_y);
dir = point_direction(0, 0, move_x, move_y)

switch(state){
    case STATE_IDLE:
        if(move_x != 0 || move_y != 0){
            state = STATE_WALK;
            frame = 0;
        }
    break;
    
    case STATE_WALK:
        frame += frame_speed;
        if (frame >= ds_map_find_value(anim_lengths, "walk")) {
            frame = 0;
        }
        if (move_x == 0 && move_y == 0) {
            state = STATE_IDLE;
        }
        sprite_direction = round(dir / 45) mod 8;
    break;
    
    case STATE_HURT:
        state_timer++;
        
        if(knockback_speed > 0){
            knockback_speed *= 0.8;
            x += lengthdir_x(knockback_speed, knockback);
            y += lengthdir_y(knockback_speed, knockback);
        }
        
        if(state_timer >= 10){
            knockback_speed = 0;
            if(move_x != 0 || move_y != 0){
                state = STATE_WALK;
            } else {
                state = STATE_IDLE;
            }
        }
    break;
}

if(mouse_check_button(mb_left)){
    shoot_timer++;
    if(shoot_timer > shoot_duration){
        var xx = lengthdir_x(14, point_direction(x, y, mouse_x, mouse_y));
        var yy = lengthdir_y(6, point_direction(x, y, mouse_x, mouse_y));
        var muzzle = instance_create(x + xx, y + yy, c_muzzle);
        var bullet = instance_create(x + xx, y + yy, c_bullet);
        
        bullet.speed = 7;
        bullet.direction = point_direction(x, y, mouse_x, mouse_y);
        shoot_timer = 0;
        
        muzzle.depth = -y;
        current_ammo -= 2;
        current_ammo = clamp(current_ammo, 0, max_ammo);
    }

}else {
    shoot_timer = max(0, shoot_timer - 0.5);
}



previous_state = state;

