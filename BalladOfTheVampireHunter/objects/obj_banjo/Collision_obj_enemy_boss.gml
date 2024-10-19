/// @description Insert description here
// You can write your code in this editor
if (!other.damage_cooldown) 
{
    if (other.hp > 0) 
    {
		global.mana += 10;
        other.hp -= obj_player.damage_amount; 
        other.damage_cooldown = true; 
		other.is_damaged = true;
        other.alarm[6]= 30;
    }
    else 
    {
        instance_destroy(other);
    }
}
audio_play_sound(snd_hit, 1, false);