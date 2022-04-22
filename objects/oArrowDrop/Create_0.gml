/// @desc ??

// Inherit the parent event
event_inherited();

// If player hasn't unlocked bow & arrow yet, just change to a coin
if (!global.playerItemUnlocked[collectScriptArg[0]]) instance_change(oCoin, true);
