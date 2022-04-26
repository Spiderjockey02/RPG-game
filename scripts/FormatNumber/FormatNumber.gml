/// @desc FormatNumber(string)
/// @arg string
function FormatNumber(string) {
	var _length = string_length(string);
	if (_length >= 7) {
		return string_format(string/1000, 1, 3) + "m"
	} else if (_length >= 4) {
		return string_format(string/1000, 1, 2) + "k"
	} else {
		return string
	}
}