/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
enum BossMode {
    MeleeMode,
    RangeMode,
    SummoningMode,
	DeathMode
}

event_inherited();
hp = 30;
current_mode = BossMode.MeleeMode;
// Boss mode alarm
alarm[3] = random_range(120, 300);
// Summoning cooldown alarm
alarm[5] = 0 
min_distance = 900;
range = 1300;
can_attack = true;
attack_cooldown = 60;
toast_message = "";
toast_timer = 0;