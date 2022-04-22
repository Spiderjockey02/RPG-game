// @desc Update the sprite
function PlayerStateAct() {
	PlayerAnimateSprite()
	
	if (animationEnded) {
		state = PlayerStateFree;
		animationEnded = false;
		if (animationEndScript != -1) {
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}