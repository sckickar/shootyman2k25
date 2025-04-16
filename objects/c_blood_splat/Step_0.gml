depth = -y;

zspeed += zgrav;
z += zspeed;

if(z <= 0){
    instance_destroy();
}



