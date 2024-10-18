/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
if (instance_exists(obj_player)) 
{
    var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    if (distance_to_player < min_distance) 
    {
        direction = point_direction(obj_player.x, obj_player.y, x, y);
        speed = max_speed / 2;
        
        if (can_attack)
        {
            // Switch to attack sprite
            sprite_index = spr_enemy_flyer_attack;  
            image_index = 0;  
            image_speed = 0.2;  

            // Perform ranged attack
            instance_create_layer(x, y, "Instances", obj_bullet);
            can_attack = false;
            alarm[1] = attack_cooldown;
        }
    } 
    else if (distance_to_player > range)
    {
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        speed = max_speed / 2;
    } 
    else 
    {
        speed = 0;
        
        if (can_attack)
        {
            // Switch to attack sprite
            sprite_index = spr_enemy_flyer_attack;
            image_index = 0;  // Reset animation to the beginning
            image_speed = 0.2;  // Set animation speed

            // Perform ranged attack
            instance_create_layer(x, y, "Instances", obj_bullet);
            can_attack = false;
            alarm[1] = attack_cooldown;
        }
    }
}

// Switch back to idle or movement sprite after the attack animation completes
if (sprite_index == spr_enemy_flyer_attack && image_index >= image_number - 1) 
{
    // Switch back to the movement or idle sprite
    sprite_index = spr_enemy_flyer_run;  // Replace with your idle or movement sprite
    image_speed = 1;  // Reset the animation speed if necessary
}
