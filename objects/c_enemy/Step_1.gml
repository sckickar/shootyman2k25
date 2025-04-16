var bullet = instance_place(x, y, c_bullet);

if(bullet != noone && state != STATE_HURT){
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

