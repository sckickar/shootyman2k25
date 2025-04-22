depth = -y;

zspeed += zgrav;
z += zspeed;
image_angle += 2;
if(z <= 0){
    instance_destroy();
}