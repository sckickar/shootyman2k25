show_debug_message("DESTROY!");
add_decal(sprite_index, sprite_direction, 0, x, y);

repeat(5){
    instance_create_layer(x, y, "Instances", c_blood_splat);
}
