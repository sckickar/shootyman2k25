surface_set_target(decalSurf);
for(i=0; i<dIndex; i++) {
    if dList[i,0] != noone {
        draw_sprite_ext(dList[i,0], dList[i,1], dList[i,3], dList[i,4], 1, 1, dList[i,2], -1, 1);
        dList[i,0] = noone;
    }
}
dIndex = 0;
surface_reset_target();

alarm[0] = 60;

