if (!surface_exists(decalSurf)) {
    decalSurf = surface_create(room_width, room_height);
} else {
    draw_surface(decalSurf, 0, 0);
}

for(i=0; i<dIndex; i++) {
     draw_sprite_ext(dList[i,0], dList[i,1], dList[i,3], dList[i,4], 1, 1, dList[i,2], -1, 1);
}

