depth = -999999;

repeat(5){
	instance_create(x + (random_range(-16, 16)), y + (random_range(-16, 16)), c_explosion);
}
