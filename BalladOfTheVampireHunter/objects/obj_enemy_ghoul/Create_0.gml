/// @description Insert description here
// You can write your code in this editor
depth = -9999;

// Inherit the parent event
event_inherited();
enum ENEMY_STATES {
    IDLE,
    RUN,
    ATTACK,
    HURT,
    SPAWN,
    DEATH
}

state = ENEMY_STATES.IDLE;


/// @description Reverse death animation on spawn
sprite_index = spr_enemy_ghoul_death;  // Set to death animation
image_speed = -0.2;  // Play the animation in reverse, adjust speed if necessary
image_index = image_number - 1;  // Start at the last frame of the animation

// After the reverse animation finishes, switch to normal ghoul sprite
alarm[2] = image_number * abs(1 / image_speed);  // Set alarm[0] to trigger after the reverse animation ends


