/// @desc ActivateLiftable(id)
/// @arg id
function ActivateLiftable(id) {
	if (global.iLifted == noone) {
		PlayerActOutAnimation(sPlayerLift);
		
		spriteIdle = sPlayerCarrying;
		spriteRun = sPlayerCarryingRun;
		
		global.iLifted = id;
		with (global.iLifted) {
			lifted = true;
			persistent = true;
		}
	}
}