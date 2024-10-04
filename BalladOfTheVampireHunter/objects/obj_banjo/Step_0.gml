/// @description 

// image_xscale = obj_player.image_xscale

if (instance_exists(obj_player)) 
{   
    // Distance sword is from the player
    var _distance = 80;

    // Set the sword's position relative to the player
	
    x = obj_player.x + lengthdir_x(_distance, obj_player.mouse_angle);
    y = obj_player.y + lengthdir_y(_distance, obj_player.mouse_angle);
    
	
    // Set the sword's rotation (including angle of sprite)
    // image_angle = lerp(image_angle, (obj_player.mouse_direction * 90), 0.1)
	image_angle = obj_player.mouse_angle
}