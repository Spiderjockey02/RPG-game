/// @desc Draw shadows & HP bars
// Inherit the parent event (shadows)
event_inherited();

/// Draw HP bars
if (instance_exists(oPlayer)) {
	draw_sprite_stretched(sHealthBar_Border, 0, x-10, y-20, 21, 7)
	draw_sprite_stretched(sHealthBar_Bg, 0, x-9, y-19, 19, 5);
	draw_sprite_stretched(sHealthBar, 0, x-9, y-19, (enemyHP/enemyMaxHP) * 19, 5);
}
