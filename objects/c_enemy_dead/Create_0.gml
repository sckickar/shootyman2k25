image_speed = 0;
sprite_direction = 0;
dir = point_direction(x, y, c_player.x, c_player.y);
slide_speed = 10 + random(2);


repeat(5){
    instance_create(x, y, c_blood_splat);
}

