image_speed = 0;
type = irandom_range(0, 4);
depth = -999999;
// gravity shit
zgrav = 0.2;
zspeed = 1;
z = 0;
// speed = random(0.5) + 0.25;
direction = random(360);

state = "onair";

target_y = y + 160;

target_y = clamp(target_y, (y + 160), room_height - 32);

current_scale = 1.0;  // Start at full size
target_scale = 0.6;   // End at half size
shrink_speed = 0.5;   // How fast to shrink
sway_angle = 0;
sway_speed = 6;  // How fast it sways back and forth
sway_amplitude = 10;  // How far it sways