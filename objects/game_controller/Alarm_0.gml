if(instance_number(c_pickups) < 5){
	var margin_x = room_width * 0.25;
	var margin_y = room_height * 0.25;


	var min_x = margin_x;
	var max_x = room_width - margin_x;
	var min_y = margin_y;
	var max_y = room_height - margin_y;

	var spawn_x = irandom_range(min_x, max_x);
	var spawn_y = irandom_range(min_y, max_y);
	instance_create(spawn_x, spawn_y, c_pickups);
	
}

alarm[0] = 60;