repeat(3){
	instance_create(x + random_range(-4, 4), y + random_range(-4, 4), c_explosion_2);
}

repeat(5){
	instance_create(x + random_range(-4, 4), y + random_range(-4, 4), c_explosion);
}

instance_create(x, y, c_crater);