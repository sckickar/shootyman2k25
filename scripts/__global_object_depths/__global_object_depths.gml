function __global_object_depths() {
	// Initialise the global array that allows the lookup of the depth of a given object
	// GM2.0 does not have a depth on objects so on import from 1.x a global array is created
	// NOTE: MacroExpansion is used to insert the array initialisation at import time
	gml_pragma( "global", "__global_object_depths()");

	// insert the generated arrays here
	global.__objectDepths[0] = 0; // c_player
	global.__objectDepths[1] = 0; // p_wall
	global.__objectDepths[2] = 0; // p_enemies
	global.__objectDepths[3] = 0; // p_enemy_projectiles
	global.__objectDepths[4] = 0; // c_bullet
	global.__objectDepths[5] = 0; // c_enemy_projectile
	global.__objectDepths[6] = 200000; // c_muzzle
	global.__objectDepths[7] = 0; // c_blood
	global.__objectDepths[8] = 0; // c_blood_splat
	global.__objectDepths[9] = 0; // c_enemy
	global.__objectDepths[10] = 0; // c_enemy_dead
	global.__objectDepths[11] = 0; // c_enemy_2_dead
	global.__objectDepths[12] = 0; // c_enemy_2
	global.__objectDepths[13] = 0; // c_wall
	global.__objectDepths[14] = 0; // c_camera
	global.__objectDepths[15] = -2; // blood_decals_controller
	global.__objectDepths[16] = -1; // general_decals_controller
	global.__objectDepths[17] = 0; // game_controller
	global.__objectDepths[18] = 0; // c_road
	global.__objectDepths[19] = 0; // c_ui


	global.__objectNames[0] = "c_player";
	global.__objectNames[1] = "p_wall";
	global.__objectNames[2] = "p_enemies";
	global.__objectNames[3] = "p_enemy_projectiles";
	global.__objectNames[4] = "c_bullet";
	global.__objectNames[5] = "c_enemy_projectile";
	global.__objectNames[6] = "c_muzzle";
	global.__objectNames[7] = "c_blood";
	global.__objectNames[8] = "c_blood_splat";
	global.__objectNames[9] = "c_enemy";
	global.__objectNames[10] = "c_enemy_dead";
	global.__objectNames[11] = "c_enemy_2_dead";
	global.__objectNames[12] = "c_enemy_2";
	global.__objectNames[13] = "c_wall";
	global.__objectNames[14] = "c_camera";
	global.__objectNames[15] = "blood_decals_controller";
	global.__objectNames[16] = "general_decals_controller";
	global.__objectNames[17] = "game_controller";
	global.__objectNames[18] = "c_road";
	global.__objectNames[19] = "c_ui";


	// create another array that has the correct entries
	var len = array_length_1d(global.__objectDepths);
	global.__objectID2Depth = [];
	for( var i=0; i<len; ++i ) {
		var objID = asset_get_index( global.__objectNames[i] );
		if (objID >= 0) {
			global.__objectID2Depth[ objID ] = global.__objectDepths[i];
		} // end if
	} // end for


}
