//Edit / RIP from ares_respawn_functions.sqf
// Respawn all spectating units at respawn_west

//["respawn_west", true] call FP_JRM_fnc_forceRespawn;
//null = execVM "forceRespawn.sqf";

private _pos = getMarkerPos "respawn_west";
if ([_pos select 0, _pos select 1] isEqualTo [0, 0]) exitWith {};

//Overwrite pos for mission;
_pos = [7615.56,1221.15,3064.35]; // getPosASL

private _plrs = [] call FP_JRM_fnc_getSpectators;

if (count _plrs == 0) exitWith {hint "Hint: No dead players"};
private _uids = _plrs apply {getPlayerUID _x};
FP_JRM_savedState = FP_JRM_savedState select {!((_x select 0) in _uids)};
publicVariable "FP_JRM_savedState";
[_pos] remoteExecCall ["FP_JRM_fnc_forceRespawn", _plrs];

// do a remote exec call to ensure all players are forced out of spectate
[false] remoteExecCall ["acre_api_fnc_setSpectator", _plrs];
//_ret = [false] call acre_api_fnc_setSpectator;
///["Open", true] remoteExecCall ["BIS_fnc_arsenal", MyTargetPlayer];

hint formatText ["Respawned %1 players", count _plrs];

sleep 5; // Ensure player is NOT marked as a spectator after resapawn. Death within 5 seconds may break this again
[false] remoteExecCall ["acre_api_fnc_setSpectator", _plrs];
