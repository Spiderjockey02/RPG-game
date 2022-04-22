/// @arg response
function DialogueResponses(argument0) {
	switch(argument0) {
		case 0: 
			break
		case 1:
			NewTextBox("You selected response 1", 1) 
			break;
		case 2:
			NewTextBox("You selected response 2! Any further responses?", 1, ["3:Yes!", "0:NO."])
			break;
		case 3:
			NewTextBox("Thanks for your response", 1);
			break;
		case 4:
			NewTextBox("Thanks", 2);
			NewTextBox("I think it's in the cave", 2);
			global.questStatus[? "TheHatQuest"] = 1;
			break;
		case 5:
			NewTextBox("oh ok", 2)
			break;
		case 6:
			PurchaseItem(activate.item, activate.itemAmount, activate.itemCost);
			break;
		default:
			break;
	}
}