function generate_suicidal_enemy_sprite_ds(){
	chase_map = ds_map_create();

	ds_map_add(chase_map, 0, 0);  // East
	ds_map_add(chase_map, 1, 4);  // Northeast
	ds_map_add(chase_map, 2, 8);  // North
	ds_map_add(chase_map, 3, 12);  // Northwest
	ds_map_add(chase_map, 4, 16);  // West
	ds_map_add(chase_map, 5, 20);  // Southwest
	ds_map_add(chase_map, 6, 24);  // South
	ds_map_add(chase_map, 7, 28);  // Southeast
}