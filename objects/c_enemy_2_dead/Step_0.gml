sprite_direction = round(dir / 45) mod 8;

if(slide_speed > 0){
  slide_speed *= 0.4;
  x += lengthdir_x(slide_speed, direction);
  y += lengthdir_y(slide_speed, direction);
  instance_create_layer(x + random(4), y + random(4), "Instances", c_blood);
}

if(slide_speed % 2){
	repeat(5){
		instance_create_layer(x + random(6), y + random(6), "Instances", c_blood);
	}
}

if(slide_speed <= 2){
   
    instance_destroy();
}

