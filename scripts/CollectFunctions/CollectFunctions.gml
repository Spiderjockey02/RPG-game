/// @desc CollectCoins(_amount)
/// @arg _amount
function CollectCoins(_amount) {
	global.playerMoney += _amount;
}

function CollectAmmo(_array) {
	// _array = [type, ammount]
	global.playerAmmo[_array[0]] += _array[1];
}
