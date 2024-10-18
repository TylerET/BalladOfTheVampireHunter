/// @description Insert description here
// You can write your code in this editor
// Draw the player sprite (default action for Draw event)
draw_self();

if (toast_timer > 0) {
	draw_set_font(fnt_small)
    draw_text(x, y - sprite_get_height(spr_player_stand) - 10, toast_message);
    toast_timer -= 1;
}
