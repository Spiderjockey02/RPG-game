/// @desc DropsItems(x, y, [items])
/// @arg x
/// @arg y
/// @arg items[]
function DropItems(x, y, items) {
	var _items = array_length(items);
	if (_items > 1) {
		var _anglePerItem = 360 / _items;
		var _angle = random(360);
		for (var i = 0; i < _items; i++) {
			with (instance_create_layer(x,y, "Instances", items[i])) {
				direction = _angle;
				spd = 0.75 + (_items * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
	} else {
		instance_create_layer(x, y, "Instances", items[0])
	}
}