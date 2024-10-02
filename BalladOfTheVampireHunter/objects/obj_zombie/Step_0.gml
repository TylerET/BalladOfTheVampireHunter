/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) 
{
	//Point towards the player
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	
	//Move at this speed
	speed = 8
}
else
{
	//If the player is dead stop moving
	speed = 0
}