/// @desc ??
visible = (room != rTitle);

if (global.gamePaused) {
	keyUp = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	keyDown = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pauseOptionSelected += (keyDown - keyUp);
	if (pauseOptionSelected >= array_length(pauseOptions)) pauseOptionSelected = 0;
	if (pauseOptionSelected < 0) pauseOptionSelected = array_length(pauseOptions) -1; 
	
	keyActivate = keyboard_check_pressed(ord("O"));
	if (keyActivate) {
		switch (pauseOptionSelected) {
			//Continue
			case 0: {
				global.gamePaused = false;
				with (all) {
					gamePausedImageSpeed = image_speed;
					image_speed = 0;
				}
				break;
			}
			//Save and Quit
			case 1: {
				with (oGame) instance_destroy();
				SaveGame();
				game_restart();	
				break;
			}
			case 2: {
				SaveGame();
				//game_end();
				//goto main menu
				break;
			}
		}
	}
}
