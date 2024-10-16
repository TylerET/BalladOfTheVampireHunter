/// @description Insert description here
// You can write your code in this editor

//Draw Heath background
draw_set_alpha(0)
draw_rectangle(30, 0, 150, 30, false)
if (instance_exists(obj_player)) {
	for (var _i = 0; _i < obj_player.hp; _i++)
	{
		draw_set_alpha(1)
		draw_sprite_ext(spr_lifepip, 0, (50 + (80) * _i), 50, 0.4, 0.4, 0, c_white, 1);
	}
	// Draw the back of the experience bar.
	draw_sprite_ext(spr_xpbar_back, 0, 400, 30, 1120 / 65, 1, 0, c_white, 1);

	// Get how much the bar should be filled.
	var _fill = min(global.xp / global.xp_goal, 1);

	// Draw the experince bar filling.
	draw_sprite_ext(spr_xpbar_fill, 0, 407, 37, (1172 / 54) * _fill, 1, 0, c_white, 1);

	// Set the font.
	draw_set_font(fnt_large);

	// Center the text vertically and horizontally.
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);

	// Draw our current level.
	draw_text(1450, 65, "LV: " + string(global.level));
}