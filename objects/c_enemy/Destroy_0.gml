var corpse = instance_create(x, y, c_enemy_dead);

corpse.direction = point_direction(c_player.x, c_player.y, x, y);

