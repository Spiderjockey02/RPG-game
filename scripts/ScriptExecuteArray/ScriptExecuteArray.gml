/// @desc execute script with argument array
/// @returns any
/// @arg script
/// @arg args[]
function ScriptExecuteArray(argument0, argument1) {
	var _scr = argument0;
	var _args = argument1;
	switch (array_length(_args)) {
 
	 case 1: return script_execute(_scr, _args[0]);
 
	 case 2: return script_execute(_scr, _args[0], _args[1]);
 
	 case 3: return script_execute(_scr, _args[0], _args[1], _args[2]);
 
	 case 4: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3]);
 
	 case 5: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4]);
 
	 case 6: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5]);
 
	 case 7: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6]);
 
	 case 8: return script_execute(_scr, _args[0], _args[1], _args[2], _args[3], _args[4], _args[5], _args[6], _args[7]);
 
	 default: show_error("script_execute_array: argument count not supported!", false);
	}
}