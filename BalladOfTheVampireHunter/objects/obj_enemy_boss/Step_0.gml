/// @description
/// Boss logic to stop near the player, attack, and ensure the attack animation finishes with a cooldown.
function get_boss_mode_string(mode) {
    switch (mode) {
        case BossMode.MeleeMode: 
            return "Melee Mode";
        case BossMode.RangeMode: 
            return "Range Mode";
        case BossMode.SummoningMode: 
            return "Summoning Mode";
        default:
            return "Unknown Mode";
    }
}

function show_toast(msg, duration) {
	toast_message = msg;
    toast_timer = duration;
}



if (instance_exists(obj_player)) 
{
    // MeleeMode logic
    if (current_mode == BossMode.MeleeMode) {
        show_toast(get_boss_mode_string(BossMode.MeleeMode), 60);
        direction = point_direction(x, y, obj_player.x, obj_player.y);
        var dist_to_player = distance_to_object(obj_player);
        var attack_range = 50;  
        var max_speed = 5;

        if (sprite_index == spr_enemy_boss_attack_1 || sprite_index == spr_enemy_boss_attack_2) {
            if (image_index < image_number - 1) return;
            alarm[2] = 120;
        }

        if (dist_to_player > attack_range) {
            sprite_index = spr_enemy_boss_run; 
            if (speed < max_speed) {
                speed += 0.15;
                speed = min(speed, max_speed);
            }
        } else {
            if (alarm[2] <= 0) {
                speed = 0;
                if (sprite_index != spr_enemy_boss_attack_1 && sprite_index != spr_enemy_boss_attack_2) {
                    sprite_index = choose(spr_enemy_boss_attack_1, spr_enemy_boss_attack_2);
                    image_index = 0;
                    if (distance_to_object(obj_player) <= attack_range) obj_player.trigger_custom_event();

                }
            } else {
                sprite_index = spr_enemy_boss_idle;
            }
        }
    }

    // RangeMode logic
    else if (current_mode == BossMode.RangeMode) {
        var distance_to_player = point_distance(x, y, obj_player.x, obj_player.y);
        if (distance_to_player < min_distance) {
            direction = point_direction(obj_player.x, obj_player.y, x, y);
            speed = 3 / 2;
            if (can_attack) {
                sprite_index = spr_enemy_boss_attack_3;
                instance_create_layer(x, y, "Instances", obj_bullet_boss);
                can_attack = false;
                alarm[4] = attack_cooldown;
            }
        } else if (distance_to_player > range) {
            direction = point_direction(x, y, obj_player.x, obj_player.y);
            speed = 3 / 2;
        } else {
            speed = 0;
            if (can_attack) {
                instance_create_layer(x, y, "Instances", obj_bullet_boss);
                can_attack = false;
                alarm[4] = attack_cooldown;
            }
        }
    }

    // SummoningMode logic
    else if (current_mode == BossMode.SummoningMode) {
        show_toast(get_boss_mode_string(BossMode.SummoningMode), 60);

        // Set to summoning animation and make boss stationary
        sprite_index = spr_enemy_boss_summon;
        speed = 0;

        // Check if summoning cooldown (alarm[5]) has expired
        if (alarm[5] <= 0) {
            var cam_x1 = camera_get_view_x(view_camera[0]);
            var cam_y1 = camera_get_view_y(view_camera[0]);
            var cam_x2 = cam_x1 + camera_get_view_width(view_camera[0]);
            var cam_y2 = cam_y1 + camera_get_view_height(view_camera[0]);

            // Generate a random position within the camera view
            var summon_x = random_range(cam_x1, cam_x2); 
            var summon_y = random_range(cam_y1, cam_y2);

            // Summon the ghoul at the random position
            instance_create_layer(summon_x, summon_y, "Instances", obj_enemy_summoned_ghoul);

            // Reset summoning cooldown to 3 seconds (180 frames)
            alarm[5] = 180;
        }
    }
}
else {
    // If the player is dead, stop moving and go idle
    speed = 0;
    sprite_index = spr_enemy_boss_idle;
}
