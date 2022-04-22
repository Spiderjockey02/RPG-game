function PlayerFireArrow() {
	with (instance_create_depth(floor(x), floor(y)-7, depth, oArrow)) {
		direction = other.direction
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index = CARDINAL_DIR;
		speed = 6;
	}
}