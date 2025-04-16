globalvar gdList, gdIndex, gdecalSurface;

depth = -1;

gdIndex = 0;

for(i = 0; i < 200; i++){
    gdList[i, 0] = noone;
    gdList[i, 1] = 0;
    gdList[i, 2] = 0;
    gdList[i, 3] = 0;
    gdList[i, 4] = 0;
}

gdecalSurf = surface_create(room_width, room_height);
alarm[0] = 60;

