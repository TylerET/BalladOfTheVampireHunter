/// @description 

//optional TODO-- use lerp() (or similar function) to slowly turn toward player
// TODO add attack range
// TODO make zombie faster than player
if (instance_exists(obj_player)) 
{
	//Point towards the player
	direction = point_direction(x, y, obj_player.x, obj_player.y);
	
	//Speed handler
	if (distance_to_object(obj_player) < 300) {
		max_speed = 9
	} else {
		max_speed = 3
	}
	
	if (speed < max_speed) {
		speed += 0.2
		speed = min(speed, max_speed)
	}
}
else
{
	//If the player is dead stop moving
	speed = 0
}