/// @desc Essential entity setup
z = 0;
flash = 0;
flashShader = shWhiteFlash;
spd = 0;
uFlash = shader_get_uniform(shWhiteFlash, "flash");
lifted = 0;
thrown = false;
entityDropList = -1;
collisionMap = layer_tilemap_get_id(layer_get_id("Col"));
