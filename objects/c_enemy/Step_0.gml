depth = -y;

get_target();

switch(state){
    case STATE_IDLE:
        state_timer++;
        speed = 0;
        if(state_timer >= state_duration){
            state = STATE_WALK;
            state_timer = 0;
            
            
            if(target > 0){
                state = STATE_CHASE;
            } else {
				dir = random(360);
			}
        }
    break;
    
    case STATE_CHASE: 
        state_timer++;
        
        if(target > 0){
            var dist = point_distance(x, y, target.x, target.y);
            dir = point_direction(x, y, target.x, target.y);
            
            if(dist < 5){
                state_timer = 0;
                state = STATE_ATTACK;
            }
			
            
            if(dist < 120){
            
                if(collision_line(x, y, target.x, target.y, p_wall, 0, 0) < 0){
                    
                    motion_add(dir + random(20) + 10, 1.5);
                    
                    speed = clamp(speed, 0, 1.5);
                    state_timer = 0;
                    
                } else {
                    if(state_timer > 20){
                        state = STATE_WALK;
                        state_timer = 0;
                    }
                }
            } else {
                state = STATE_WALK;
                state_timer = 0;
            }
        }
        
        sprite_direction = round(direction / 45) mod 8;
        frame += frame_speed * 1.5;
        if (frame >= ds_map_find_value(anim_lengths, "walk")) {
            frame = 0;
        }
    break;
    
    case STATE_ATTACK:
        speed = 0;
        state_timer++;
        if (target > 0) {
            dir = point_direction(x, y, target.x, target.y);
            sprite_direction = round(dir / 45) mod 8;
        }
        
        frame += frame_speed;
        
        if(frame >= ds_map_find_value(anim_lengths, "attack")){
            if(state_timer >= state_duration){
                if(target > 0){
                    var dist = point_distance(x, y, target.x, target.y);
                    
                    if(dist < 1 && collision_line(x, y, target.x, target.y, p_wall, 0, 0) < 0){
                        state_timer = 0;
                        frame = 0;
                    } else {
                        state = STATE_CHASE;
                        state_timer = 0;
                    }
                } else {
                    state = STATE_IDLE;
                    state_timer = 0;
                }
            }
            
            frame = 0;
        }
    break;
    
    case STATE_WALK:
        state_timer++;
        
        if(previous_state != STATE_WALK || speed < 0.2){
            motion_add(dir, 1);
        }
        
        if(speed > 1) speed = 1;
        
        sprite_direction = round(direction / 45) mod 8;
        frame += frame_speed;
        if (frame >= ds_map_find_value(anim_lengths, "walk")) {
            frame = 0;
        }
        
        if(state_timer >= state_duration){
            state = STATE_IDLE;
            state_timer = 0;
            frame = 0;
        }
    break;
    
    case STATE_HURT:
        state_timer++;
        hp -= 1;
        if(knockback_speed > 0){
            knockback_speed *= 0.8;
            x += lengthdir_x(knockback_speed, knockback);
            y += lengthdir_y(knockback_speed, knockback);
            instance_create_layer(x, y, "Instances", c_blood);
        }
        
        
        sprite_direction = round(point_direction(x, y, c_player.x, c_player.y) / 45) mod 8;
        frame += frame_speed;
        if (frame >= ds_map_find_value(anim_lengths, "hurt")) {
            frame = 0;
        }
        
        instance_create_layer(x, y, "Instances", c_blood_splat);
        
        if(state_timer >= 5){
            knockback_speed = 0;
            if(hp <= 0){
                state = STATE_DEAD;
            } else {
                state = STATE_CHASE;
            }
            
        }
    break;
	
	case STATE_FLYING:
        depth = -y;

		zspeed += zgrav;
		z += zspeed;

		if(z <= 0){
		    instance_destroy();
		}
    break;
    
    case STATE_DEAD:
        instance_destroy();
    break;
}

previous_state = state;

