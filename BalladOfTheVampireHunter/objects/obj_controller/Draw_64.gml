/// @description Insert description here
// You can write your code in this editor

//Draw Heath background
draw_set_alpha(0)
draw_rectangle(30, 0, 150, 30, false)

for (var i = 0; i < lives; i++)
{
	draw_set_alpha(1)
	draw_sprite_ext(spr_lifepip, 0, (50 + (40) * i), 15, 0.2, 0.2, 0, c_white, 1);
}