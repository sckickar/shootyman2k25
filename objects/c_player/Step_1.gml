current_weapon = weapons[| current_weapon_index];
max_ammo = current_weapon[? "max_ammo"];
current_ammo = current_weapon[? "current_ammo"];

if(current_ammo <= 0){
    current_weapon_index = 0;
    current_weapon = weapons[| current_weapon_index];
    max_ammo = current_weapon[? "max_ammo"];
    current_ammo = current_weapon[? "current_ammo"];
}

var enemy = instance_place(x, y, p_enemies);
var enemy_bullet = instance_place(x, y, p_enemy_projectiles);
var pickups = instance_place(x, y, c_pickups)
move_x = keyboard_check(ord("D")) - keyboard_check(ord("A"));
move_y = keyboard_check(ord("S")) - keyboard_check(ord("W"));
var final_x = x + (move_x * max_speed);
var final_y = y + (move_y * max_speed);

if (!place_meeting(final_x, y, collision_object)) {
    x = final_x;
}

if (!place_meeting(x, final_y, collision_object)) {
    y = final_y;
}

if (enemy != noone && state != STATE_HURT) {
    if (enemy.state == STATE_ATTACK && enemy.frame > 0) {
        knockback = point_direction(enemy.x, enemy.y, x, y);
        knockback_speed = 4;

        x += lengthdir_x(knockback_speed, knockback);
        y += lengthdir_y(knockback_speed, knockback);

        state = STATE_HURT;

        state_timer = 0;
    }
}

if (enemy_bullet != noone && state != STATE_HURT) {
    knockback = point_direction(enemy_bullet.x, enemy_bullet.y, x, y);
    knockback_speed = 4;

    x += lengthdir_x(knockback_speed, knockback);
    y += lengthdir_y(knockback_speed, knockback);

    state = STATE_HURT;

    state_timer = 0;

    with(enemy_bullet) {
        instance_destroy();
    }
}

if(pickups != noone){
	with(pickups){
		if(state == "landed"){
			switch(type){
				case 0:
					other.grenades = 5;
				break;
				case 1:
				case 2:
				case 3:
					other.current_weapon_index = type;
		            other.current_weapon = other.weapons[| other.current_weapon_index];
		            other.current_weapon[? "current_ammo"] = other.current_weapon[? "max_ammo"];
		            other.current_ammo = other.current_weapon[? "current_ammo"];
		            other.max_ammo = other.current_weapon[? "max_ammo"];
					
				break;
			}
			instance_destroy();
		}
    
	}
}