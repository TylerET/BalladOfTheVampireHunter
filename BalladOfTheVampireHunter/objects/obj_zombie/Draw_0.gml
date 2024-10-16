/// @description Insert description here
// You can write your code in this editor
if (is_damaged) 
{
    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_red, image_alpha);
}
else 
{
    draw_self();
}