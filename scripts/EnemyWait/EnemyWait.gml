function EnemyWait() {
	if (++stateWait >= stateWaitDuration) {
		stateWait = 0;
		state = stateTarget;
	}
}