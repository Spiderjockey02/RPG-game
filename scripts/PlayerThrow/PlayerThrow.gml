/// @desc PlayerThrow()
function PlayerThrow() {
	with (global.iLifted) {
		lifted = false;
		persistent = false;
		thrown = true;
		z = 13;
		throwPeakHeight = z + 10;
		throwDistance = entityThrowDistance;
		throwDistanceTravelled = 0;
		throwStartPercentage = (13 / throwPeakHeight) * 0.5;
		throwPercentage = throwStartPercentage;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	PlayerActOutAnimation(sPlayerLift);
	
	global.iLifted = noone;
	spriteIndex = sPlayer;
	spriteRun = sPlayerRun;
}