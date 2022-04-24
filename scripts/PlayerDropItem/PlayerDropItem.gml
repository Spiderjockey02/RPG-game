/// @desc PlayerDropItem()
function PlayerDropItem() {
	with (oPlayer) {
		global.iLifted = noone;
		spriteIdle = sPlayer;
		spriteRun = sPlayerRun;
	}
}