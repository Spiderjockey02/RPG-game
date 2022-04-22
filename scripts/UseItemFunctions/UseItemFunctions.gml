/// @desc UseItemBomb()
function UseItemBomb() {
	if (global.playerAmmo[ITEM.BOMB] > 0 && global.iLifted == noone) {
		global.playerAmmo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", oBomb);
		ActivateLiftable(_bomb);
	}
}

function UseItemBow() {
	if (global.playerAmmo[ITEM.BOW] > 0 && global.iLifted == noone) {
		global.playerAmmo[ITEM.BOW]--;
		PlayerActOutAnimation(sPlayerBow, PlayerFireArrow)
	}
}

function UseItemHook() {

}
