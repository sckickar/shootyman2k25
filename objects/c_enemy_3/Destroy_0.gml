repeat(3){
	instance_create(x + random_range(-4, 4), y + random_range(-4, 4), c_explosion_2);
}

repeat(3){
	instance_create(x + random_range(-4, 4), y + random_range(-4, 4), c_guts);
}
instance_create_layer(x, y, "Instances", c_crater);