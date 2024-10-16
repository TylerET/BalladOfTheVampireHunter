/// @description Insert description here
// You can write your code in this editor
event_inherited();
switch (state) {
    case ENEMY_STATES.IDLE:
        sprite_index = spr_enemy_ghoul_idle;
        image_speed = 0.1; 
        break;

    case ENEMY_STATES.RUN:
        sprite_index = spr_enemy_ghoul_run;
        image_speed = 0.2;
		
        break;

    case ENEMY_STATES.ATTACK:
        sprite_index = spr_enemy_ghoul_attack;
        image_speed = 0.15;
        break;

    case ENEMY_STATES.HURT:
        sprite_index = spr_enemy_ghoul_hurt;
        image_speed = 0.1;
        break;

    case ENEMY_STATES.SPAWN:
        sprite_index = spr_enemy_ghoul_spawn;
        image_speed = 0.1;
        break;

    case ENEMY_STATES.DEATH:
        sprite_index = spr_enemy_ghoul_death;
        image_speed = 0.1;
        if (image_index >= image_number - 1) {
            image_speed = 0;
        }
        break;
}

 if (is_slowed) {
    state = ENEMY_STATES.HURT;
} else {
    state = ENEMY_STATES.RUN;
}



