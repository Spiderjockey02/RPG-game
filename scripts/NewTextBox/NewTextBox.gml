/// @desc NewTextBox(argument0, argument1, argument2)
///	@arg text
///	@arg background
/// @arg responses
function NewTextBox(argument0, argument1, argument2 = []) {
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued; else _obj = oText;
	with (instance_create_layer(0, 0, "Instances", _obj)) {
		message = argument0;
		if (instance_exists(other)) originInstance = other.id; else originInstance = noone;
		background = argument1;
		
		if (array_length(argument2) >= 1) {
			for (var i = 0; i < array_length(argument2); i++) {
				var _markerPosition = string_pos(":", argument2[i]);
				responseScripts[i] = string_copy(argument2[i], 1, _markerPosition-1);
				responseScripts[i] = real(responseScripts[i]);
				responses[i] = string_delete(argument2[i], 1, _markerPosition)
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