/// @description 

// image_xscale = obj_player.image_xscale

if (instance_exists(obj_player)) 
{   
	//velocity handler
	swing_angle += swing_vel
    swing_vel -= sign(swing_vel)*(abs(swing_vel / 7))
	
    // Set the sword's position relative to the player
    x = obj_player.x + lengthdir_x(dist_from_player, swing_angle);
    y = obj_player.y + lengthdir_y(dist_from_player, swing_angle);
    image_angle = swing_angle
}