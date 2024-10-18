var card_width = 200;  
var card_height = 300;  
var spacing = 100;  

var card_y = (display_get_gui_height() / 2) - (card_height / 2);  
var card1_x = (display_get_gui_width() / 2) - (card_width * 1.5) - spacing; 
var card2_x = (display_get_gui_width() / 2) - (card_width / 2); 
var card3_x = (display_get_gui_width() / 2) + (card_width / 2) + spacing; 
var card4_x = (display_get_gui_width() / 2) + (card_width * 1.5) + (spacing * 2); 

if (mouse_check_button_pressed(mb_left)|| keyboard_check(ord("1")) || keyboard_check(ord("2")) || keyboard_check(ord("3")) || keyboard_check(ord("4"))) {
    var mouse_x_pos = device_mouse_x_to_gui(0); 
    var mouse_y_pos = device_mouse_y_to_gui(0); 

    show_debug_message("Mouse X: " + string(mouse_x_pos) + " Mouse Y: " + string(mouse_y_pos));

    if ((mouse_x_pos > card1_x && mouse_x_pos < card1_x + card_width &&
        mouse_y_pos > card_y && mouse_y_pos < card_y + card_height)|| keyboard_check(ord("1"))) {
        show_debug_message("Damage Up (1)");
		obj_player.damage_amount += 1
        instance_destroy();  
        global.isPaused = false;    
    }
	

    if ((mouse_x_pos > card2_x && mouse_x_pos < card2_x + card_width &&
        mouse_y_pos > card_y && mouse_y_pos < card_y + card_height)|| keyboard_check(ord("2"))) {
        show_debug_message( "Max HP Up (2)");
		obj_player.hp += 1
		global.maxHealth += 1
        instance_destroy(); 
        global.isPaused = false;
    }

    if ((mouse_x_pos > card3_x && mouse_x_pos < card3_x + card_width &&
        mouse_y_pos > card_y && mouse_y_pos < card_y + card_height)|| keyboard_check(ord("3"))) {
        show_debug_message("Speed Up (3)");
		obj_player.max_walk_vel += 2
        instance_destroy();
        global.isPaused = false;
    }

    if ((mouse_x_pos > card4_x && mouse_x_pos < card4_x + card_width &&
        mouse_y_pos > card_y && mouse_y_pos < card_y + card_height)|| keyboard_check(ord("4"))) {
        show_debug_message("Music Up (4)");
		global.mana_attk += 1
        instance_destroy();
        global.isPaused = false;
    }
}
