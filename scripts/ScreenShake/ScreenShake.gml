/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second) 
function ScreenShake(argument0, argument1) {
	with (global.iCamera) {
		if (argument0 > shakeRemain) {
			shakeMagnitude = argument0;
			shakeRemain = shakeMagnitude;
			shakeLength = argument1;
		}
	}
}
