function generate_player_weapons() {
	weapons = ds_list_create();
	
	var pistol = ds_map_create();
	
	ds_map_add(pistol, "name", "Desert Eagle");
	ds_map_add(pistol, "fire_rate", 10);
	ds_map_add(pistol, "current_ammo", 1);
	ds_map_add(pistol, "max_ammo", 1);
	ds_map_add(pistol, "ammo_cost", 1);
	ds_map_add(pistol, "damage", 1);
	ds_list_add(weapons, pistol);
	
	var machine_gun = ds_map_create();
	ds_map_add(machine_gun, "name", "Machine Gun");
	ds_map_add(machine_gun, "fire_rate", 5);  // Frames between shots
	ds_map_add(machine_gun, "current_ammo", 30);
	ds_map_add(machine_gun, "max_ammo", 30);
	ds_map_add(machine_gun, "ammo_cost", 1);
	ds_map_add(machine_gun, "damage", 1);
	ds_list_add(weapons, machine_gun);
	
	var shotgun = ds_map_create();
	ds_map_add(shotgun, "name", "Shotgun");
	ds_map_add(shotgun, "fire_rate", 25);  // Frames between shots
	ds_map_add(shotgun, "current_ammo", 8);
	ds_map_add(shotgun, "max_ammo", 8);
	ds_map_add(shotgun, "ammo_cost", 1);
	ds_map_add(shotgun, "damage", 1);
	ds_list_add(weapons, shotgun);
	
}
