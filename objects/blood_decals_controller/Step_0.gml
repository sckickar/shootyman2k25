for (var i = 0; i < pPoolSize; i++) {
    if (!pActive[i]) continue;
    
    var p = pPool[i];
    
    // Update position
    p.x += lengthdir_x(p.speed, p.direction);
    p.y += lengthdir_y(p.speed, p.direction);
    
    // Update vertical movement
    p.zspeed += p.zgrav;
    p.z += p.zspeed;
    
    // Check if particle hit ground
    if (p.z <= 0) {
        // Create a blood decal where it landed
        add_decal(s_blood, irandom(7), random(360), p.x, p.y);
        
        // Deactivate particle
        pActive[i] = false;
    }
}