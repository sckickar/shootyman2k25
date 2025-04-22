sprite_direction = round(dir / 45) mod 8;
slide_speed = clamp(slide_speed, 0, 10);
if (slide_speed > 0 && should_slide) {
    slide_speed *= 0.8;
    x += lengthdir_x(slide_speed, direction);
    y += lengthdir_y(slide_speed, direction);
    if (slide_speed % 2) {
        repeat(5) {
            instance_create_layer(x + random(6), y + random(6), "Surfaces", c_blood);
        }
    }
    instance_create_layer(x + random_range(-4, 4), y + random_range(-4, 4), "Surfaces", c_blood);
}



if (slide_speed <= 2) {
    instance_destroy();
}