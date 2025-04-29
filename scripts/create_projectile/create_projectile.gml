// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_projectile(_xoffset, _yoffset, type){
	switch(type){
		case 0: // pistol
		case 1: //LMG
			var bullet = instance_create(x + _xoffset, y + _yoffset, c_bullet);
            bullet.direction = point_direction(x, y, mouse_x, mouse_y);
            bullet.speed = 7;
		break;
		
		case 2: // shotgun
			repeat(6){
				var bullet = instance_create(x + _xoffset, y + _yoffset, c_bullet);
	            bullet.direction = point_direction(x, y, mouse_x, mouse_y) + random(30);
	            bullet.speed = 7;
			}
		break;
		
		case 3: // rocket launcher
			var missile = instance_create(x + _xoffset, y + _yoffset, c_missile);
	            missile.target_x = mouse_x;
				missile.target_y = mouse_y;
				missile.homing_speed = 3;
		break;
	}
}