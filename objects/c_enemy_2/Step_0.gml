depth = -y;

get_target();

switch (state) {
    case STATE_IDLE:
        state_timer++;
        speed = 0;
        if (state_timer >= state_duration) {
            state = STATE_WALK;
            state_timer = 0;


            if (target > 0) {
                var dist = point_distance(x, y, target.x, target.y);

                if (dist < 100) {
                    if (collision_line(x, y, target.x, target.y, p_wall, 0, 0) < 0) {
                        state = STATE_ATTACK;
                        shots_fired = 0;
                        shoot_delay = 0;
                    } else {
                        dir = random(360);
                    }
                } else {
                    dir = random(360);
                }
            }
        }
        break;

    case STATE_ATTACK:
        speed = 0;
        state_timer++;
        if (target > 0) {
            dir = point_direction(x, y, target.x, target.y);
            sprite_direction = round(dir / 45) mod 8;
        }

        if (state_timer >= state_duration) {
            if (target > 0) {
                var dist = point_distance(x, y, target.x, target.y);

                if (dist < 100 && collision_line(x, y, target.x, target.y, p_wall, 0, 0) < 0) {
                    state_timer = 0;
                    frame = 0;

                    shots_fired = 0;
                    shoot_delay = 0;
                }
            } else {
                state = STATE_IDLE;
                state_timer = 0;
            }
        }
        
        if (shots_fired < 4) {
            if(shoot_delay > 0){
                shoot_delay--;
            } else {
                if(target > 0){
                    var bullet = instance_create(x, y, c_enemy_projectile);
                    bullet.speed = 7 + random(4);
                    bullet.direction = point_direction(x, y, target.x, target.y);
                    shots_fired++;
                    shoot_delay = 20;
                }
            }
        }
        break;

    case STATE_WALK:
        state_timer++;

        if (previous_state != STATE_WALK || speed < 0.2) {
            motion_add(dir, 1);
        }

        if (speed > 1) speed = 1;

        sprite_direction = round(direction / 45) mod 8;
        frame += frame_speed;
        if (frame >= ds_map_find_value(anim_lengths, "walk")) {
            frame = 0;
        }

        if (state_timer >= state_duration) {
            state = STATE_IDLE;
            state_timer = 0;
            frame = 0;
        }
        break;

    case STATE_HURT:
        state_timer++;
        hp -= 1;
        if (knockback_speed > 0) {
            knockback_speed *= 0.8;
            x += lengthdir_x(knockback_speed, knockback);
            y += lengthdir_y(knockback_speed, knockback);
            instance_create(x, y, c_blood);
        }


        sprite_direction = round(point_direction(x, y, c_player.x, c_player.y) / 45) mod 8;
        frame += frame_speed;
        if (frame >= ds_map_find_value(anim_lengths, "hurt")) {
            frame = 0;
        }

        instance_create(x, y, c_blood_splat);

        if (state_timer >= 5) {
            knockback_speed = 0;
            if (hp <= 0) {
                state = STATE_DEAD;
            } else {
                state = STATE_ATTACK;
            }

        }
        break;

    case STATE_DEAD:
        instance_destroy();
        break;
}

previous_state = state;

