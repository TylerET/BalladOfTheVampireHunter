/// @description Insert description here
// You can write your code in this editor
event_inherited();

if (instance_exists(obj_player)) 
{
    var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    if (distance_to_player < min_distance) 
	{
        direction = point_direction(obj_player.x, obj_player.y, x, y);
        speed = max_speed / 2;
		
		if (can_attack)
		{
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
            // Perform ranged attack
            instance_create_layer(x, y, "Instances", obj_bullet);
            can_attack = false;
            alarm[1] = attack_cooldown;
        }
    }
}
