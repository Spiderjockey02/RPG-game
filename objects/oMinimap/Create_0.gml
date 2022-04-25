/// @desc Set up minimap
surfMinimapBG = -1;
surfMinimapEntities = -1;
x = 15;
y = 15;

function RefreshMapBg() {
	h = room_height/TILE_SIZE;
	w = room_width/TILE_SIZE;
	surfMinimapBG = surface_create(w, h);
	var _surfTemp = surface_create(room_width, room_height);
	surface_set_target(_surfTemp);
	draw_clear(c_black);
	draw_tilemap(layer_tilemap_get_id(layer_get_id("TilesMain")), 0, 0);
	surface_reset_target();
	surface_set_target(surfMinimapBG);
	draw_surface_stretched(_surfTemp, 0, 0, w, h);
	surface_reset_target();
	surface_free(_surfTemp)
}

// Initialise background
RefreshMapBg();
