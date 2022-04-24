/// @desc Show available items to buy

// Inherit the parent event
event_inherited();

image_speed = 0;
if (global.playerItemUnlocked[item]) instance_destroy();
