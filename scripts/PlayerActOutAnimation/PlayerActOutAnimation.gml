/// @desc PlayerActOutAnimation(sprite, endScript = "undefined")
/// @arg Sprite
/// @arg endScript
function PlayerActOutAnimation(sprite, endScript = "undefined") {
	state = PlayerStateAct;
	sprite_index = sprite;
	if (endScript != "undefined") animationEndScript = endScript;
	localFrame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}