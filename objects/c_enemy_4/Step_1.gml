var bullet = instance_place(x, y, c_bullet);
var explosion = instance_place(x, y, p_explosion);

if(bullet != noone && state != STATE_HURT && state != STATE_FLYING){
    knockback = point_direction(bullet.x, bullet.y, x, y);
    knockback_speed = 4;
        
    x += lengthdir_x(knockback_speed, knockback);
    y += lengthdir_y(knockback_speed, knockback);
        
    state = STATE_HURT;
        
    state_timer = 0;
    
    with(bullet){
        instance_destroy();
    }
}


if(explosion != noone && state != STATE_FLYING){
    knockback = point_direction(explosion.x, explosion.y, x, y);
    
    var dist = point_distance(explosion.x, explosion.y, x, y);
    var max_knockback = 12;
    var knockback_radius = 100;
    
    if(dist < knockback_radius) {
        knockback_speed = max_knockback * (1 - (dist / knockback_radius));
        knockback_speed = max(knockback_speed, 4);
    } else {
        knockback_speed = 4;
    }
    
    hp = 0;
    
    x += lengthdir_x(knockback_speed, knockback);
    y += lengthdir_y(knockback_speed, knockback);
    
    state = STATE_FLYING;
    z = min(20, 8 + (knockback_speed - 4) * 1.5);
    state_timer = 0;
}


