/// @description Insert description here
// You can write your code in this editor

if (!wave_active) {
    // Start the wave after a delay
    if (spawn_delay <= 0) {
        start_wave();
        spawn_delay = 60;  // Reset delay for the next wave
    } else {
        spawn_delay--;
    }
}

// Function to start a new wave
function start_wave() {
    // Spawn flyers
    for (var i = 0; i < flyer_count; i++) {
        spawn_enemy(obj_enemy_flyer);
    }

    // Spawn ghouls
    for (var i = 0; i < ghoul_count; i++) {
        spawn_enemy(obj_enemy_ghoul);
    }

    // Increase the wave number and adjust counts for the next wave (optional)
    wave_number++;
    enemies_to_spawn += 2;  // Increase the number of enemies each wave (optional)
    flyer_count++;          // Increase flyer count (optional)
    ghoul_count++;          // Increase ghoul count (optional)
    
    wave_active = true;  // Set wave as active
}

// Function to spawn an enemy at a specific distance from the player
function spawn_enemy(enemy_type) {
    var player_x = obj_player.x;
    var player_y = obj_player.y;

    // Random angle in degrees (0 to 360)
    var angle = irandom_range(0, 360);

    // Calculate spawn coordinates based on the distance from the player
    var spawn_x = player_x + lengthdir_x(spawn_distance, angle);
    var spawn_y = player_y + lengthdir_y(spawn_distance, angle);

    // Create the enemy at the calculated position
    var enemy = instance_create_layer(spawn_x, spawn_y, "Instances", enemy_type);
	enemy.max_speed += 0.5 * wave_number;
}

// Reset the wave if no enemies remain
if (instance_number(obj_enemy_flyer) == 0 && instance_number(obj_enemy_ghoul) == 0) {
    wave_active = false;  // Set wave to inactive, so the next wave can begin
}
