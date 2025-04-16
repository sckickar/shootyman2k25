event_inherited();

image_speed = 0;
hp = 10;

body_sprite = s_enemy_2;

frame = 0;
frame_speed = 0.3;

animation_data = ds_map_create();
anim_lengths = ds_map_create();

ds_map_add(anim_lengths, "idle", 1);
ds_map_add(anim_lengths, "walk", 4);
ds_map_add(anim_lengths, "hurt", 1);
generate_ranged_enemy_sprite_ds();

ds_map_add_map(animation_data, "idle", idle_map);
ds_map_add_map(animation_data, "walk", walk_map);
ds_map_add_map(animation_data, "hurt", hurt_map);

sprite_direction = 0;
sub_image = 0;
sprite_direction = 0;

dir = 0;
mouse_dir = 0;

// State tingz
state = STATE_IDLE;
previous_state = STATE_IDLE;

state_timer = 0;
state_duration = 30 + random(10);

// IT CAN SHOOT
shoot_delay = 0;
shots_fired = 0;



