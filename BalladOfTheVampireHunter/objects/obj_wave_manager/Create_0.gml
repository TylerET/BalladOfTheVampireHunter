/// @description Insert description here
// You can write your code in this editor

// Wave system variables
wave_number = 0;
enemies_to_spawn = 5;  // Number of enemies per wave
flyer_count = 2;       // Number of obj_enemy_flyer to spawn
ghoul_count = 3;       // Number of obj_enemy_ghoul to spawn
spawn_distance = 1200;  // Distance from player for enemy spawn
spawn_delay = 60;      // Time between waves (in steps)
wave_active = false;   // Controls if a wave is currently active