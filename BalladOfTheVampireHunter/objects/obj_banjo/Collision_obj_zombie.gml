/// @description Insert description here
// You can write your code in this editor
if (!other.damage_cooldown) 
{
    if (other.hp > 0) 
    {
		global.mana += 10;
        other.hp -= global.player_attk; 
        other.damage_cooldown = true; 
		other.is_damaged = true;
        other.alarm[1] = 30;
    }
    else 
    {
        instance_destroy(other);
    }
}
