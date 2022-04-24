/// @desc Draw shadows
if (entityShadow) {
	// scale the shadows width based on sprite width
	draw_sprite_ext(sShadow, 0, floor(x), floor(y), (sprite_width/sprite_get_width(sShadow)), 1, 0, c_white, 1)
}

if (flash != 0) {
	shader_set(flashShader);
	uFlash = shader_get_uniform(flashShader, "flash");
	shader_set_uniform_f(uFlash, flash);
}

draw_sprite_ext(sprite_index, image_index, floor(x), floor(y-z), image_xscale, image_yscale, image_angle, image_blend, image_alpha)

if (shader_current() != -1) shader_reset();
