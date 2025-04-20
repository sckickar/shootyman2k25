image_speed = 0;
sprite_direction = 0;
dir = point_direction(x, y, c_player.x, c_player.y);
should_slide = true;
depth = -14;
slide_speed = 10 + random(2);

alarm[0] = 5;

repeat(5){
    instance_create_layer(x, y, "Instances", c_blood_splat);
}
