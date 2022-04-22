function SaveGame() {
	var _map = ds_map_create();
	_map[? "room"] = room;
	_map[? "playerHealthMax"] = global.playerHealthMax;
	_map[? "playerHealth"] = global.playerHealth;
	_map[? "playerMoney"] = global.playerMoney;
	_map[? "playerHasAnyItems"] = global.playerHasAnyItems;
	_map[? "playerEquipped"] = global.playerEquipped;
	_map[? "playerAmmo"] = global.playerAmmo;
	_map[? "playerItemUnlocked"] = global.playerItemUnlocked;
	_map[? "targetX"] = global.targetX;
	_map[? "targetY"] = global.targetY;
	_map[? "questStatus"] = global.questStatus;
	
	var _questMap = ds_map_create();
	ds_map_copy(_questMap, global.questStatus);
	ds_map_add_map(_map, "questStatus", _questMap)
	
	var _string = json_encode(_map);
	SaveStringToFile("save" + string(global.gameSaveSlot) + ".sav", _string);
	show_debug_message(_string);
	
	ds_map_destroy(_map);
	show_debug_message("Game saved!")
}

function SaveStringToFile(_filename, _string) {
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer)
}
