/// @desc HurtPlayer(_direction, _force, _damage)
/// @arg _direction
/// @arg _force
/// @arg _damage
function HurtPlayer(_direction, _force, _damage) {
	if (oPlayer.invulnerable <= 0) {
		global.playerHealth = max(0, global.playerHealth-_damage);
		if (global.playerHealth > 0) {
			with (oPlayer) {
				state = PlayerStateBonk;
				direction = _direction-180;
				moveDistanceRemaining = _force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
			}
		} else {
			with (oPlayer) state = PlayerStateDead;
		}
	}
}