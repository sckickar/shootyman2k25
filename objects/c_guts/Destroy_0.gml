add_decal(sprite_index, image_index, image_angle, x, y);

repeat(5){
    instance_create_layer(x, y, "Surfaces", c_blood_splat);
}
