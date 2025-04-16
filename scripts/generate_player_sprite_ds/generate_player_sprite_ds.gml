function generate_player_sprite_ds() {
	idle_map = ds_map_create();
	walk_map = ds_map_create();
	hurt_map = ds_map_create();

	ds_map_add(idle_map, 0, 0);  // East
	ds_map_add(idle_map, 1, 1);  // Northeast
	ds_map_add(idle_map, 2, 2);  // North
	ds_map_add(idle_map, 3, 3);  // Northwest
	ds_map_add(idle_map, 4, 4);  // West
	ds_map_add(idle_map, 5, 5);  // Southwest
	ds_map_add(idle_map, 6, 6);  // South
	ds_map_add(idle_map, 7, 7);  // Southeast

	ds_map_add(walk_map, 0, 8);   // East
	ds_map_add(walk_map, 1, 12);   // Northeast
	ds_map_add(walk_map, 2, 16);  // North
	ds_map_add(walk_map, 3, 20);  // Northwest
	ds_map_add(walk_map, 4, 24);  // West
	ds_map_add(walk_map, 5, 28);  // Southwest
	ds_map_add(walk_map, 6, 32);  // South
	ds_map_add(walk_map, 7, 36);  // Southeast

	ds_map_add(hurt_map, 0, 40);  // East
	ds_map_add(hurt_map, 1, 41);  // Northeast
	ds_map_add(hurt_map, 2, 42);  // North
	ds_map_add(hurt_map, 3, 43);  // Northwest
	ds_map_add(hurt_map, 4, 44);  // West
	ds_map_add(hurt_map, 5, 45);  // Southwest
	ds_map_add(hurt_map, 6, 46);  // South
	ds_map_add(hurt_map, 7, 47);  // Southeast



}
