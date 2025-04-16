var anim_state_str = "idle"; // Default

switch(state) {
    case STATE_IDLE:   anim_state_str = "idle";   break;
    case STATE_WALK:   anim_state_str = "walk";   break;
    case STATE_HURT:   anim_state_str = "hurt";   break;
    case STATE_DEAD:  anim_state_str = "death";  break;
}

var current_anim_map = ds_map_find_value(animation_data, anim_state_str);
var start_frame = ds_map_find_value(current_anim_map, sprite_direction);


var frame_index = start_frame + floor(frame);

draw_sprite(feet_sprite, frame_index, x, y);


// For the body it should always be a static 1 frame sprite
if(state == STATE_HURT){
  draw_sprite_ext(body_sprite, round(mouse_dir / 45) mod 8, x, y, 1, 1, 0, c_red, 255);
} else {
  draw_sprite_ext(body_sprite, round(mouse_dir / 45) mod 8, x, y, 1, 1, 0, c_white, 255);
}

