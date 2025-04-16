idle_map = ds_map_find_value(animation_data, "idle");
walk_map = ds_map_find_value(animation_data, "walk");
hurt_map = ds_map_find_value(animation_data, "hurt");

ds_map_destroy(idle_map);
ds_map_destroy(walk_map);
ds_map_destroy(hurt_map);

ds_map_destroy(animation_data);
ds_map_destroy(anim_lengths);

