image_speed = 0;
hp = 10;
collision_object = p_wall;
max_speed = 2;

body_sprite = s_player;
feet_sprite = s_player_feet;

frame = 0;
frame_speed = 0.3;
is_hurt = false;

animation_data = ds_map_create();
anim_lengths = ds_map_create();

ds_map_add(anim_lengths, "idle", 1);
ds_map_add(anim_lengths, "walk", 4);
ds_map_add(anim_lengths, "hurt", 1);

generate_player_sprite_ds();

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
state_duration = 10;

// Knockback tingz
knockback = 0;
knockback_speed = 4;

// shoot tingz
shoot_timer = 10;
shoot_duration = 10;

current_ammo = 10;
max_ammo = current_ammo;

