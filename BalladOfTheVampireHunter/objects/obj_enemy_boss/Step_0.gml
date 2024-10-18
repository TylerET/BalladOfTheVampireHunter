/// @description
/// Boss logic to stop near the player, attack, and ensure the attack animation finishes with a cooldown.

if (instance_exists(obj_player)) 
{
    if (isMeleeMode) {
        // Point towards the player
        direction = point_direction(x, y, obj_player.x, obj_player.y);
    
        // Calculate distance to player
        var dist_to_player = distance_to_object(obj_player);
    
        // Set attack range and movement speed
        var attack_range = 50;  // Distance at which the boss stops to attack
        var max_speed = 5;      // Boss speed

        // Check if currently attacking, let the animation finsish
        if (sprite_index == spr_enemy_boss_attack_1 || sprite_index == spr_enemy_boss_attack_2) {
            // If the attack animation is still playing, do nothing else
            if (image_index < image_number - 1) {
                return;
            } else {
                // Attack animation finished, start cooldown
                alarm[2] = 120;
            }
        }

        if (dist_to_player > attack_range) {
            // Move towards the player if not already in attack range
            sprite_index = spr_enemy_boss_run;  // Use running animation

            if (speed < max_speed) {
                speed += 0.15;
                speed = min(speed, max_speed);
            }
        } else {
            // In range: only stop to attack if alarm[2] is 0 (cooldown period)
            if (alarm[2] <= 0) {
                speed = 0;
            
                // Randomly choose an attack animation if no attack is ongoing
                if (sprite_index != spr_enemy_boss_attack_1 && sprite_index != spr_enemy_boss_attack_2) {
                    if (choose(1, 2) == 1) {
                        sprite_index = spr_enemy_boss_attack_1;
                    } else {
                        sprite_index = spr_enemy_boss_attack_2;
                    }

                    // Reset animation frame
                    image_index = 0;

                    // Perform the attack logic (e.g., dealing damage)
                    if (distance_to_object(obj_player) <= attack_range) {
                        obj_player.hp -= 1;
                    }
                }
            } else {
                // While on cooldown, use idle animation but continue moving if needed
                sprite_index = spr_enemy_boss_idle;
            }
        }
    }
    else {
            var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);

    if (distance_to_player < min_distance) 
	{
        direction = point_direction(obj_player.x, obj_player.y, x, y);
        speed = 3 / 2;
		
		if (can_attack)
		{
			
            // Perform ranged attack
			sprite_index = spr_enemy_boss_attack_3;
            instance_create_layer(x, y, "Instances", obj_bullet_boss);
            can_attack = false;
            alarm[4] = attack_cooldown;
        }
    } 
	else if (distance_to_player > range)
	{
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        speed = 3 / 2;
    } 
	else 
	{
        speed = 0;
        
        if (can_attack)
		{
            // Perform ranged attack
            instance_create_layer(x, y, "Instances", obj_bullet_boss);
            can_attack = false;
            alarm[4] = attack_cooldown;
        }
    }
    }
}
else
{
    // If the player is dead, stop moving and go idle
    speed = 0;
    sprite_index = spr_enemy_boss_idle;
}

