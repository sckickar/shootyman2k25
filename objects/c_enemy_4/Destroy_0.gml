var corpse = instance_create_layer(x, y, "Instances", c_enemy_4_dead);
if(state == STATE_FLYING){
	corpse.should_slide = false;
	repeat(5){
		instance_create_layer(x + random(6), y + random(6), "Instances", c_blood);
	}
}
corpse.direction = point_direction(c_player.x, c_player.y, x, y);


