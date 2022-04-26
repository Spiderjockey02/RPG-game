/// @desc Draw map
if (instance_exists(oPlayer)) {
	if (!surface_exists(surfMinimapBG)) RefreshMapBg();
	draw_surface(surfMinimapBG, x, y);
	
	if (!surface_exists(surfMinimapEntities)) surfMinimapEntities = surface_create(w, h);

	surface_set_target(surfMinimapEntities);
	draw_clear_alpha(c_black, 0.0);
	with (pEnemy) {
		draw_sprite_ext(
			sPixel, 0, x/TILE_SIZE, y/TILE_SIZE, 1, 1, 0, c_red, 1
		)
	}
	surface_reset_target();
	draw_surface(surfMinimapEntities, x, y)
	
	// Draw camera
	var _vX = camera_get_view_x(view_camera[0]) / TILE_SIZE;
	var _vY = camera_get_view_y(view_camera[0]) / TILE_SIZE;
	draw_sprite_stretched(sMinimapView, 0, x + _vX, y + _vY, 320/TILE_SIZE, 180/TILE_SIZE);
	
	draw_sprite_stretched(sMinimapBox, 0, x-6, y-6, w+12, h+12);
}

if (global.gamePaused) {
	draw_set_color(c_black)
	draw_set_alpha(0.75)
	draw_rectangle(0, 0, RESOLUTION_W, RESOLUTION_H, false)
}
