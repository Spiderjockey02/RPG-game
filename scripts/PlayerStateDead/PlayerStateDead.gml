function PlayerStateDead() {
	hSpeed = 0;
	vSpeed = 0;
	
	if (sprite_index != sPlayerDie && sprite_index != sPlayerDead) {
		sprite_index = sPlayerDie;
		image_index = 0;
		image_speed = 0.7;
	}
	
	if (image_index + image_speed > image_number) {
		if (sprite_index == sPlayerDie) {
			image_speed = max(0, image_speed-0.03);
			if (image_speed < 0.07) {
				image_index = 0;
				sprite_index = sPlayerDead;
				image_speed = 1.0;
			}
		} else {
			image_speed = 0;
			image_index = image_number-1;
			global.targetX = -1;
			global.targetY = -1;
		}
	}
}