var x_to, y_to;

last_x = c_player.x;
last_y = c_player.y;

move_towards_point(mouse_x, mouse_y, 0);

x_to = last_x + lengthdir_x(min(96, distance_to_point(mouse_x, mouse_y)), direction);
y_to = last_y + lengthdir_y(min(96, distance_to_point(mouse_x, mouse_y)), direction);

x += (x_to - x) / 25;
y += (y_to - y) / 25;

__view_set( e__VW.XView, 0, (-(__view_get( e__VW.WView, 0 ) / 2) + x) );
__view_set( e__VW.YView, 0, (-(__view_get( e__VW.HView, 0 ) / 2) + y) );


__view_set( e__VW.XView, 0, clamp(__view_get( e__VW.XView, 0 ), 0, room_width - __view_get( e__VW.WView, 0 )) );
__view_set( e__VW.YView, 0, clamp(__view_get( e__VW.YView, 0 ), 0, room_height - __view_get( e__VW.HView, 0 )) );

stamina_current = c_player.current_ammo;


