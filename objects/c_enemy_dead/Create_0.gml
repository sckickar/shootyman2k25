image_speed = 0;
sprite_direction = 0;
dir = point_direction(x, y, c_player.x, c_player.y);
should_slide = true;

if(should_slide == true){
	slide_speed = 10 + random(2);
} else {
	slide_speed = 0;
}


repeat(5){
    instance_create_layer(x, y, "Instances", c_blood_splat);
}
