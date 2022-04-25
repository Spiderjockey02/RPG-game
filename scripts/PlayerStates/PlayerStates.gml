// @desc PlayerStateAct()
function PlayerStateAct() {
	PlayerAnimateSprite()
	
	if (animationEnded) {
		state = PlayerStateFree;
		animationEnded = false;
		if (animationEndScript != -1) {
			script_execute(animationEndScript);
			animationEndScript = -1;
		}
	}
}

// @desc PlayerStateAttack()
function PlayerStateAttack() {
	script_execute(stateAttack);
}

// @desc PlayerStateBonk()
function PlayerStateBonk() {
	// Movement
	hSpeed = lengthdir_x(speedBonk, direction - 180);
	vSpeed = lengthdir_y(speedBonk, direction - 180);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	PlayerCollision();
	
	// Update sprite
	sprite_index = sPlayerHurt;
	image_index = CARDINAL_DIR - 2;
	
	// Change height
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	// Change state
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	};
}

// @desc PlayerStateDead()
function PlayerStateDead() {
	hSpeed = 0;
	vSpeed = 0;
	
	if (sprite_index != sPlayerDie && sprite_index != sPlayerDead) {
		sprite_index = sPlayerDie;
		image_index = 0;
		image_speed = 0.7;
	}
	
	if (image_index + image_speed > image_number) {
		if (sprite_index == sPlayerDie) {
			image_speed = max(0, image_speed-0.03);
			if (image_speed < 0.07) {
				image_index = 0;
				sprite_index = sPlayerDead;
				image_speed = 1.0;
			}
		} else {
			image_speed = 0;
			image_index = image_number-1;
			global.targetX = -1;
			global.targetY = -1;
			RoomTransition(TRANS_TYPE.STAR, rVillage);
			global.playerHealth = global.playerHealthMax;
		}
	}
}

// @desc PlayerStateFree()
function PlayerStateFree() {
	// Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	PlayerCollision();
	
	//update Sprite index
	var _oldSprite = sprite_index;
	if (inputMagnitude != 0) {
		direction = inputDirection;
		sprite_index = spriteRun;
	} else {
		sprite_index = spriteIdle;
	}

	if (_oldSprite != sprite_index) localFrame = 0;

	// Update image index
	PlayerAnimateSprite()
	
	// Attack key was pressed
	if (keyAttack) {
		state = PlayerStateAttack;
		stateAttack = AttackSlash;
	}
	
	// Key logic (interact with sign, NPC etc) or make player roll
	if (keyActivate) {
		var _activateX = x + lengthdir_x(10, direction);
		var _activateY = y + lengthdir_y(10, direction);
		var _activateSize = 4;
		var _activateList = ds_list_create();
		activate = noone;
		var _entitiesFound = collision_rectangle_list(
			_activateX - _activateSize,
			_activateY - _activateSize,
			_activateX + _activateSize,
			_activateY + _activateSize,
			pEntity,
			false,
			true,
			_activateList,
			true
		)
		
		while (_entitiesFound > 0) {
			var _check = _activateList[| --_entitiesFound];
			if (_check != global.iLifted && _check.entityActivateScript != -1) {
				activate = _check;
				break;
			}
		}
		ds_list_destroy(_activateList)
		
		if (activate == noone) {
			//Check if player is holding something
			if (global.iLifted != noone) {
				PlayerThrow();
			} else {
				state = PlayerStateRoll;
				moveDistanceRemaining = distanceRoll;
			}
		} else {
			// Activate the entity
			ScriptExecuteArray(activate.entityActivateScript, activate.entityActivateArgs);
			
			// Make the NPC face the player
			if (activate.entityNPC) {
				with (activate) {
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR
				}
			}
		}
	}
	
	// Use the active item (if they have ammo)
	if (keyItem && !keyActivate && global.playerHasAnyItems && global.playerEquipped != ITEM.NONE) {
		switch (global.playerEquipped) {
			case ITEM.BOMB:
				UseItemBomb();
				break;
			case ITEM.BOW:
				UseItemBow();
				break;
			case ITEM.HOOK:
				UseItemHook();
				break;
			default:
				break;
		}
	}
	
	// Change weapon (cycle items)
	if (global.playerHasAnyItems) {
		var _cycleDirection = keyItemSelectUp - keyItemSelectDown;
		if (_cycleDirection != 0) {
			do {
				global.playerEquipped += _cycleDirection;
				if (global.playerEquipped < 1) global.playerEquipped = ITEM.TYPE_COUNT-1;
				if (global.playerEquipped >= ITEM.TYPE_COUNT) global.playerEquipped = 1;
			} until (global.playerItemUnlocked[global.playerEquipped])
		}
	}
	
}

// @desc PlayerStateRoll()
function PlayerStateRoll() {
	// Movement
	hSpeed = lengthdir_x(speedRoll, direction);
	vSpeed = lengthdir_y(speedRoll, direction);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	// Update sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _totalFrames) + min((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames, _totalFrames - 1);
	
	// Change state
	if (moveDistanceRemaining <= 0) {
		state = PlayerStateFree;
	};
	
	if (_collided) {
		state = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk
		ScreenShake(4, 30);
	}
}

// @desc PlayerStateTransition()
function PlayerStateTransition() {
	PlayerCollision();
	
	PlayerAnimateSprite();
}

// @desc PlayerStateLocked()
function PlayerStateLocked() {

}
