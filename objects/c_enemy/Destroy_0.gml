var corpse = instance_create(x, y, c_enemy_dead);
corpse.direction = point_direction(c_player.x, c_player.y, x, y);

if(previous_state == STATE_FLYING){
	corpse.should_slide = false;
	repeat(5){
		instance_create(x + random(6), y + random(6), c_blood);
	}
}

