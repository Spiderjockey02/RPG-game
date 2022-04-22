/// @desc RoomToAreaName(_room)
/// @arg _room
function RoomToAreaName(_room) {
	switch(_room) {
		case rVillage:
			return "The Village";
		case rRiver:
			return "The River";
		case rCave:
			return "The Cave";
		case rShop:
			return "The Shop";
		default:
			return "Unknown area";
	}
}