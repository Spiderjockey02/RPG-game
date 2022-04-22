/// @desc Drop fragments & items
if (entityFragmentCount > 0) {
	fragmentArray = array_create(entityFragmentCount, entityFragment);
	DropItems(x, y, fragmentArray)
}

//Drop some coins or smth
if (entityDropList != -1) {
	DropItems(x, y, entityDropList);
}
