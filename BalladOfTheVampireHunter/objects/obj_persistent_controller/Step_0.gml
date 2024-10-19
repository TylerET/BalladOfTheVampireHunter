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
    if (room != rm_boss) {
        audio_stop_sound(snd_wasted_blood);
        if (!audio_is_playing(snd_arsenal_torn)) {
            audio_play_sound(snd_arsenal_torn, 1, true);
        }
    } else {
        audio_stop_sound(snd_arsenal_torn);
       
        if (!audio_is_playing(snd_wasted_blood)) {
            audio_play_sound(snd_wasted_blood, 1, true);
        }
    }
} else {
    audio_stop_sound(snd_arsenal_torn);
    audio_stop_sound(snd_wasted_blood);
}

