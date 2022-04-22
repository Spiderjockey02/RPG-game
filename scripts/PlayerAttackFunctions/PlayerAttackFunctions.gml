function AttackSlash() {
	if (sprite_index != sPlayerAttackSlash) {
		sprite_index = sPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	CalcAttack(sPlayerAttackSlashHB);
	
	// Update sprite
	PlayerAnimateSprite();
	
	if (animationEnded) {
		state = PlayerStateFree;
		animationEnded = false;
	}
}

/// @desc Attack an entity
/// @arg attackedEntity
function CalcAttack(argument0) {
	mask_index = argument0
	var hitByAttackNow = ds_list_create();
	var hits = instance_place_list(x, y, pEntity, hitByAttackNow, false);
	if (hits > 0) {
		for (var i = 0; i < hits; i++) {
			var hitID = hitByAttackNow[| i];
			if (ds_list_find_index(hitByAttack, hitID) == -1) {
				ds_list_add(hitByAttack, hitID);
				with (hitID) {
					if (object_is_ancestor(object_index, pEnemy)) {
						HurtEnemy(id, 5, other.id, 10)
					} else if (entityHitScript != -1) script_execute(entityHitScript);
				}
			}
		}
	}
	ds_list_destroy(hitByAttackNow)
	mask_index = sPlayer;
}

/// @desc HurtEnemy(_enemy, _dmg, _source, _kb)
/// @arg _enemy
/// @arg _dmg
/// @arg _source
/// @arg _kb
function HurtEnemy(_enemy, _dmg, _source, _kb) {
	with (_enemy) {
		if (state != ENEMYSTATE.DIE) {
			enemyHP -= _dmg;
			flash = 1;
			
			// dead?
			if (enemyHP <= 0) {
				state = ENEMYSTATE.DIE;
			} else {
				if (state != ENEMYSTATE.HURT) statePrevious = state;
				state = ENEMYSTATE.HURT;
			}
			
			image_index = 0;
			if (_kb != 0) {
				var _knockDirection = point_direction(x, y, _source.x, _source.y);
				xTo = x - lengthdir_x(_kb, _knockDirection);
				yTo = y - lengthdir_y(_kb, _knockDirection);
			}
		}
	}
}
