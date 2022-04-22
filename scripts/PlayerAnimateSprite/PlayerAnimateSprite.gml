function PlayerAnimateSprite() {
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (CARDINAL_DIR * _totalFrames)
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;

	if (localFrame >= _totalFrames) {
		animationEnded = true;
		localFrame -= _totalFrames;
	} else {
		animationEnded = false;
	}
}

