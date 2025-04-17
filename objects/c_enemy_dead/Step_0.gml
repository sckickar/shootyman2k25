depth -= 3
sprite_direction = round(dir / 45) mod 8;

if(slide_speed > 0){
  slide_speed *= 0.8;
  x += lengthdir_x(slide_speed, direction);
  y += lengthdir_y(slide_speed, direction);
  instance_create(x + random_range(-4, 4), y + random_range(-4, 4), c_blood);
}

if(slide_speed <= 0){
    instance_destroy();
}

