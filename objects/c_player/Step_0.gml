depth = -y;

mouse_dir = point_direction(x, y, mouse_x, mouse_y);
dir = point_direction(0, 0, move_x, move_y)

switch (state) {
    case STATE_IDLE:
        if (move_x != 0 || move_y != 0) {
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

        if (knockback_speed > 0) {
            knockback_speed *= 0.8;
            x += lengthdir_x(knockback_speed, knockback);
            y += lengthdir_y(knockback_speed, knockback);
        }

        if (state_timer >= 10) {
            knockback_speed = 0;
            if (move_x != 0 || move_y != 0) {
                state = STATE_WALK;
            } else {
                state = STATE_IDLE;
            }
        }
        break;
}

if (mouse_check_button(mb_left)) {

    if (current_ammo > 0) {
        shoot_timer++;
        if (shoot_timer > current_weapon[? "fire_rate"]) {
            var xx = lengthdir_x(14, point_direction(x, y, mouse_x, mouse_y));
            var yy = lengthdir_y(6, point_direction(x, y, mouse_x, mouse_y));
            var muzzle = instance_create(x + xx, y + yy, c_muzzle);
            create_projectile(xx, yy, current_weapon_index);
            shoot_timer = 0;

            muzzle.depth = -y;
            show_debug_message(current_weapon[? "name"]);
            if (current_weapon_index != 0) {
                current_weapon[? "current_ammo"] -= 1;
                current_ammo = current_weapon[? "current_ammo"];
                current_ammo = clamp(current_ammo, 0, max_ammo);
            }
        }
    }

} else {
    shoot_timer = max(0, shoot_timer - 0.5);
}

previous_state = state;