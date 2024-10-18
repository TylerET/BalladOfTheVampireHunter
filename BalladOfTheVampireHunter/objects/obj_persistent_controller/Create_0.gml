 window_set_fullscreen(true)




ini_open("settings.ini");
if (ini_key_exists("Settings", "isMusicPlaying")) {
    isMusicPlaying = ini_read_real("Settings", "isMusicPlaying", true); 
} else {
    isMusicPlaying = true; 
}
ini_close(); 

