var anim_state_str = "chase"; // Default
var current_anim_map = ds_map_find_value(animation_data, anim_state_str);
var start_frame = ds_map_find_value(current_anim_map, sprite_direction);


var frame_index = start_frame + floor(frame);

draw_sprite(body_sprite, frame_index, x, y);

