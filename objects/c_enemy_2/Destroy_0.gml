var corpse = instance_create_layer(x, y, "Instances", c_enemy_2_dead);

corpse.direction = point_direction(c_player.x, c_player.y, x, y);

if(previous_state == STATE_FLYING){
	corpse.should_slide = false;
}