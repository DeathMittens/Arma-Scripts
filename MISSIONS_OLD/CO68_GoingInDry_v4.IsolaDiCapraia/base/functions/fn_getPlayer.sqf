/*
	Function: FP_fnc_getPlayer

	API:
		Any

	Description:
		Takes a string and returns a player object if found, otherwise objNull
		Can be used partially, to find "cuel" you can pass ["cu"]
		Will be objNull if not found, or if theres more than one match
		Case insensitive

	Parameters:
		_name - Player name

	Examples:
	(begin example)
		_cuel = "cu" call FP_fnc_getPlayer;
		_cuel = ["Cuel"] call FP_fnc_getPlayer;
	(end)

	Returns:
		Object

	Author:
		Cuel 2015-04-21
*/

params ["_name"];
private _matches = [];
{
	if ([_name, name _x] call bis_fnc_inString) then {
		_matches pushBack _x;
	};
} forEach ([] call CBA_fnc_players);

if (count _matches == 1) exitWith {_matches select 0};
objNull
