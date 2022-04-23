function LoadGame(_slot) {
	global.gameSaveSlot = _slot;
	var _file = "save" + string(global.gameSaveSlot) + ".sav";
	if (file_exists(_file)) {
		var _json = LoadJSONFromFile(_file);
		
		// Player stats
		global.playerHealth = _json[? "playerHealth"];
		global.playerHealthMax = _json[? "playerHealthMax"];
		global.playerMoney = _json[? "playerMoney"];
		global.playerEquipped = _json[? "playerEquipped"];
		global.playerHasAnyItems = _json[? "playerHasAnyItems"];
		global.targetX = _json[? "targetX"];
		global.targetY = _json[? "targetY"];
		
		// Get items and their counts
		for (var i = 0; i < ITEM.TYPE_COUNT; i++) {
			global.playerItemUnlocked[i] = _json[? "playerItemUnlocked"][| i];
			global.playerAmmo[i] = _json[? "playerAmmo"][| i];
		}
		
		// Quest data
		ds_map_copy(global.questStatus, _json[? "questStatus"]);
		
		//Move to room
		RoomTransition(TRANS_TYPE.FADE, _json[? "room"])
		ds_map_destroy(_json)
		return true;
	} else {
		show_debug_message("NO save in this slot")
		return false;
	}
}

function LoadJSONFromFile(_filename) {
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	var _json = json_decode(_string);
	return _json
}
