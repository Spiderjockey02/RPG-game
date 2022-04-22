/// @desc

// Inherit the parent event
event_inherited()

state = ENEMYSTATE.WANDER;

// Enemy Sprites
sprMove = sSlime;
sprAttack = sSlimeAttack;
sprDie = sSlimeDie;
sprHurt = sSlimeHurt;

// Enemy Scripts
enemyScript[ENEMYSTATE.WANDER] = SlimeWander;
enemyScript[ENEMYSTATE.CHASE] = SlimeChase;
enemyScript[ENEMYSTATE.ATTACK] = SlimeAttack;
enemyScript[ENEMYSTATE.HURT] = SlimeHurt;
enemyScript[ENEMYSTATE.DIE] = SlimeDie;

// Drop list when slime dies
entityDropList = choose(
	[oCoin],
	[oCoin, oCoin],
	[oArrowDrop],
)
