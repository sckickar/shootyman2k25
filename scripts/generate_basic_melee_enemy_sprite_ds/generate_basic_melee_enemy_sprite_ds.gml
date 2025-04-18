function generate_basic_melee_enemy_sprite_ds() {
	idle_map = ds_map_create();
	walk_map = ds_map_create();
	hurt_map = ds_map_create();
	attack_map = ds_map_create();
	fly_map = ds_map_create();

	ds_map_add(idle_map, 0, 0);  // East
	ds_map_add(idle_map, 1, 4);  // Northeast
	ds_map_add(idle_map, 2, 8);  // North
	ds_map_add(idle_map, 3, 12);  // Northwest
	ds_map_add(idle_map, 4, 16);  // West
	ds_map_add(idle_map, 5, 20);  // Southwest
	ds_map_add(idle_map, 6, 24);  // South
	ds_map_add(idle_map, 7, 28);  // Southeast

	ds_map_add(walk_map, 0, 0);  // East
	ds_map_add(walk_map, 1, 4);  // Northeast
	ds_map_add(walk_map, 2, 8);  // North
	ds_map_add(walk_map, 3, 12);  // Northwest
	ds_map_add(walk_map, 4, 16);  // West
	ds_map_add(walk_map, 5, 20);  // Southwest
	ds_map_add(walk_map, 6, 24);  // South
	ds_map_add(walk_map, 7, 28);  // Southeast

	ds_map_add(attack_map, 0, 31);  // East
	ds_map_add(attack_map, 1, 33);  // Northeast
	ds_map_add(attack_map, 2, 36);  // North
	ds_map_add(attack_map, 3, 38);  // Northwest
	ds_map_add(attack_map, 4, 40);  // West
	ds_map_add(attack_map, 5, 42);  // Southwest
	ds_map_add(attack_map, 6, 44);  // South
	ds_map_add(attack_map, 7, 46);  // Southeast

	ds_map_add(hurt_map, 0, 48);  // East
	ds_map_add(hurt_map, 1, 50);  // Northeast
	ds_map_add(hurt_map, 2, 52);  // North
	ds_map_add(hurt_map, 3, 54);  // Northwest
	ds_map_add(hurt_map, 4, 56);  // West
	ds_map_add(hurt_map, 5, 58);  // Southwest
	ds_map_add(hurt_map, 6, 60);  // South
	ds_map_add(hurt_map, 7, 62);  // Southeast
	
	ds_map_add(fly_map, 0, 65);  // East
	ds_map_add(fly_map, 1, 65);  // Northeast
	ds_map_add(fly_map, 2, 65);  // North
	ds_map_add(fly_map, 3, 65);  // Northwest
	ds_map_add(fly_map, 4, 65);  // West
	ds_map_add(fly_map, 5, 65);  // Southwest
	ds_map_add(fly_map, 6, 65);  // South
	ds_map_add(fly_map, 7, 65);  // Southeast
	
}
