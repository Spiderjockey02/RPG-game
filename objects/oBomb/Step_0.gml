/// @desc ??
// Inherit the parent event
event_inherited()

if (!global.gamePaused) {
	bombTick--;
	if (bombTick == 0) {
		flash = 0.75;
		bombStage++;
		bombTick = bombTickRate[bombStage];
	}
	
	if (bombTick < 0) {
		y -= z;
		
		if (lifted) {
			PlayerDropItem();
		}
		instance_destroy();
	}
}
