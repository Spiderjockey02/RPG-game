function ActivateHatCat() {
	var _hasHat = global.iLifted != noone && global.iLifted.object_index == oHat;
	switch(global.questStatus[? "TheHatQuest"]) {
		// Quest hasn't started
		case 0: {
			if (_hasHat) {
				NewTextBox("Wow! You found my hat without me asking, Thank you!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				// Update sprites
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer) {
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			} else {
				NewTextBox("Hello there!", 2);
				NewTextBox("Could you help me find my missing hat?", 2, ["4:Of cause!", "5:Definitely not!"])
			}
			break
		}
		// Quest in progress
		case 1: {
			if (_hasHat) {
				NewTextBox("Wow! You found my hat, Thank you!", 2);
				global.questStatus[? "TheHatQuest"] = 2;
				// Update sprites
				with (oQuestNPC) sprite_index = sQuestieHat;
				with (oHat) instance_destroy();
				global.iLifted = noone;
				with (oPlayer) {
					spriteIdle = sPlayer;
					spriteRun = sPlayerRun;
				}
			} else {
				// Give the player a clue as they haven't found it yet
				NewTextBox("You might need some items to get in the cave!", 2)
			}
			break;
		}
		// Quest already completed
		case 2: {
			NewTextBox("Thank you for finding my hat, earlier.", 2)
			break;
		}
	}
}