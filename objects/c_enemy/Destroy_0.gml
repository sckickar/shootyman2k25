var corpse = instance_create_layer(x, y, "Surfaces", c_enemy_dead);
if(state == STATE_FLYING){
	corpse.should_slide = random(5) < 1 ? false : true;
	repeat(5){
		instance_create_layer(x + random(6), y + random(6), "Surfaces", c_blood);
	}
}
corpse.direction = point_direction(c_player.x, c_player.y, x, y);


