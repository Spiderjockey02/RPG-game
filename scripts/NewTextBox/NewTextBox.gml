/// @desc NewTextBox(_text, _background, argument2 = [])
///	@arg text
///	@arg background
/// @arg responses
function NewTextBox(_text, _background, _responses = []) {
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0, 0, "Instances", _obj)) {
		message = _text;
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		background = _background;
		
		if (array_length(_responses) >= 1) {
			for (var i = 0; i < array_length(_responses); i++) {
				var _markerPosition = string_pos(":", _responses[i]);
				responseScripts[i] = string_copy(_responses[i], 1, _markerPosition-1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(_responses[i], 1, _markerPosition)
			}
		} else {
			responses = [-1];
			responseScripts = [-1];
		}

	}
	
	with (oPlayer) {
		if (state != PlayerStateLocked) {
			lastState = state;
			state = PlayerStateLocked;
		}
	}
}