/// @description 
if (hp > 0 and !is_invincible) 
{
	show_debug_message(hp)
	hp -= damage_amount
	is_invincible = true
	alarm[1] = flicker_rate //image flashing for i-frames
    alarm[0] = i_frames //timer to end i-frames
} else if (hp == 0) {
	show_debug_message("Game Over")
	// instance_destroy()
    global.game_over = true;
}
audio_play_sound(snd_hit, 1, false);
