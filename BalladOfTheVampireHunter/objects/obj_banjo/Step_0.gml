/// @description 

// image_xscale = obj_player.image_xscale

if (instance_exists(obj_player)) 
{   
    // Set the sword's position relative to the player
	
    x = obj_player.x + lengthdir_x(dist_from_player, initial_angle);
    y = obj_player.y + lengthdir_y(dist_from_player, initial_angle);
    
    // Swing the banjo
    // image_angle = lerp(image_angle, (obj_player.mouse_direction * 90), 0.1)
	image_angle += swing_vel
	swing_vel -= sign(swing_vel) - abs(swing_vel / 4)
}