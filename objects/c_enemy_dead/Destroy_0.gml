add_decal(sprite_index, sprite_direction, 0, x, y);
repeat(5){
    instance_create_layer(x, y, "Surfaces", c_blood_splat);
}
