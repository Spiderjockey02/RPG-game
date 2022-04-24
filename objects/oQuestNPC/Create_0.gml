/// @desc Show hat if quest is complete
// Inherit the parent event
event_inherited();

image_speed = 0;
if (global.questStatus[? "TheHatQuest"] == 2) sprite_index = sQuestieHat;
