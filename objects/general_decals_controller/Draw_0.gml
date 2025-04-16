if (!surface_exists(gdecalSurf)) {
    gdecalSurf = surface_create(room_width, room_height);
} else {
    draw_surface(gdecalSurf, 0, 0);
}

for(i=0; i<gdIndex; i++) {
     draw_sprite_ext(gdList[i,0], gdList[i,1], gdList[i,3], gdList[i,4], 1, 1, gdList[i,2], -1, 1);
}

