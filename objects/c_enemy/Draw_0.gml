var anim_state_str = "idle"; // Default

switch(state) {
    case STATE_IDLE:   anim_state_str = "idle";   break;
    case STATE_WALK:   anim_state_str = "walk";   break;
    case STATE_HURT:   anim_state_str = "hurt";   break;
    //case STATE_DEAD:  anim_state_str = "death";  break;
    case STATE_ATTACK:  anim_state_str = "attack";  break;
}

var current_anim_map = ds_map_find_value(animation_data, anim_state_str);
var start_frame = ds_map_find_value(current_anim_map, sprite_direction);


var frame_index = start_frame + floor(frame);

// For the body it should always be a static 1 frame sprite
draw_sprite(body_sprite, frame_index, x, y);

