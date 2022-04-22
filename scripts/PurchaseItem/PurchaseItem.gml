/// @desc PurchaseItem(item, amount, itemCost)
/// @arg item
/// @arg amount
/// @arg cost
function PurchaseItem(item, amount, cost) {
	if (global.playerMoney >= cost) {
		global.playerHasAnyItems = true;
		global.playerItemUnlocked[item] = true;
		global.playerAmmo[item] += amount;
		global.playerMoney -= cost;
		global.playerEquipped = item;
		instance_destroy(activate);
		
		/// Show a description of the newly brought item
		var _desc = "";
		switch (item) {
			case ITEM.BOMB:
				_desc = "Bombs!";
				break;
			case ITEM.BOW:
				_desc = "The bow!"
				break;
			default:
				_desc = "No item description found!"
				break;
		}
		NewTextBox(_desc, 1)
	} else {
		NewTextBox("You don't have enough money to purchase this item.", 1)
	}
}