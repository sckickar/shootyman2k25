surface_set_target(gdecalSurf);
for(i=0; i<gdIndex; i++) {
    if gdList[i,0] != noone {
        draw_sprite_ext(gdList[i,0], gdList[i,1], gdList[i,3], gdList[i,4], 1, 1, gdList[i,2], -1, 1);
        gdList[i,0] = noone;
    }
}
gdIndex = 0;
surface_reset_target();

alarm[0] = 60;

