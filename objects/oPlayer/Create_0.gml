/// @desc Create player variables
state = PlayerStateFree;
stateAttack = AttackSlash;
hitByAttack = -1;
lastState = state;

collisionMap = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
hSpeed = 0;
vSpeed = 0;
speedWalk = 2.0;
speedRoll = 3.0;
distanceRoll = 52;
distanceBonk = 40;
distanceBonkHeight = 12;
speedBonk = 1.5;
z = 0;
invulnerable = 0;
flash = 0;
flashShader = shRedFlash;
animationEndScript = -1;

spriteRoll = sPlayerRoll;
spriteRun = sPlayerRun;
spriteIdle = sPlayer;
localFrame = 0;

if (global.targetX != -1) {
	x = global.targetX;
	y = global.targetY;
	direction = global.targetDirection;
}

if (global.iLifted != noone) {
	spriteIdle = sPlayerCarrying;
	spriteRun = sPlayerCarryingRun;
	sprite_index = spriteIdle;
}
