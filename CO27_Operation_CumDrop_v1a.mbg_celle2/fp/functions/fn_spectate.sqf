/*
	Function: FP_fnc_spectate

	API:
		Client

	Description:
		Puts the player in spectate (or not)

	Parameters:
		_spectate - Bool

	Examples:
	(begin example)
		[true] call FP_fnc_spectate
	(end)

	Author:
		Cuel 2015-12-09
*/

if (!hasInterface) exitWith {};
params [["_spectate", false]];

[player, _spectate] call ace_spectator_fnc_stageSpectator;
[_spectate] call ace_spectator_fnc_setSpectator;

/*
if (!_spectate) then {
	//
	_ret = [false] call acre_api_fnc_setSpectator; // EDIT / ADDITION - take player out of spectator
};
*/

// ADDITON: SET SPECATATOR STATUS IN ACRE 2
// https://acre2.idi-systems.com/wiki/frameworks/functions-list
// acre_api_fnc_isSpectator
//_ret = [_spectate] call acre_api_fnc_setSpectator; 

// Get spectator status: _isSpectator = [player] call acre_api_fnc_isSpectator;