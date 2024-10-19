/// @description spawn banjo
alarm[0] = 30

visible = true

swing_angle = obj_player.banjo_angle

x = obj_player.x + lengthdir_x(dist_from_player, swing_angle);
y = obj_player.y + lengthdir_y(dist_from_player, swing_angle);
image_angle = swing_angle

swing_vel = -obj_persistent_controller.banjo_flipflop * 27