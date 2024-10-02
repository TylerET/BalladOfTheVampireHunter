/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) 
{
    // Calculate the angle between the player and the mouse
    var angle = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
    
    // Distance sword is from the player
    var distance = 80;

    // Set the sword's position relative to the player
    x = obj_player.x + lengthdir_x(distance, angle);
    y = obj_player.y + lengthdir_y(distance, angle);
    
    // Set the sword's rotation (including angle of sprite)
    image_angle = angle - 45;
}
