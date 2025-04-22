globalvar dList, dIndex, decalSurface;

dIndex = 0;

for(i = 0; i < MAX_DECAL_SIZE; i++){
    dList[i, 0] = noone;
    dList[i, 1] = 0;
    dList[i, 2] = 0;
    dList[i, 3] = 0;
    dList[i, 4] = 0;
}

decalSurf = surface_create(room_width, room_height);
alarm[0] = 60;