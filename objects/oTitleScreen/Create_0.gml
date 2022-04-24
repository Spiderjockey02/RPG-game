/// @desc Title screen setup
titleVisible = 0.0;
keyPressed = false;
slotsVisible = 0.0;
slotSelected = 0;
loadingStarted = false;

for (var _slot = 0; _slot <= 2; _slot++) {
	var _filename = "save" + string(_slot) + ".sav";
	if (file_exists(_filename)) {
		slotData[_slot] = LoadJSONFromFile(_filename);
	} else slotData[_slot] = -1;
}
