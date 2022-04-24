/// @desc Drop item chance
// Inherit the parent event
event_inherited();

entityDropList = choose(
	[oBombDrop],
	[oCoin],
	[oCoin, oCoin],
	[oArrowDrop],
)

