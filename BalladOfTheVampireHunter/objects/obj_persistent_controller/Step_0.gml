/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_escape)) {
	game_end()	
}

if (keyboard_check_pressed(ord("M"))) {
	isMusicPlaying = !isMusicPlaying;
	ini_open("settings.ini"); 
	ini_write_real("Settings", "isMusicPlaying", isMusicPlaying);
	ini_close();
}

if (isMusicPlaying) {
    audio_play_sound(snd_arsenal_torn, 1, true);
} else {
    audio_stop_sound(snd_arsenal_torn);
}
