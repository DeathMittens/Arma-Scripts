//onPlayerRespawn.sqf
//hint "onPlayerRespawn.sqf";

sleep 0.1;
_spectate = true;
[_spectate] call ace_spectator_fnc_setSpectator;



// Spectator: temporary implementation until calls split out better
if (side player == civilian) exitWith {
	if (playerAlive) exitWith{}; // Player already alive
	if (playerWaiting) exitWith{}; // Player already waiting for roundStart
	playerWaiting = true; // Mark as waiting to spawn
	waitUntil {roundState==1};
	playerALive = true;
	playerWaiting = false;
	player setPosASL (getPosASL CSpawn);
	player addWeapon "binocular";
	sleep 0.1;
	[false] call ace_spectator_fnc_setSpectator;
	_ret = [false] call acre_api_fnc_setSpectator; // Ensure player out of spectator for ACRE
};


if (playerAlive) exitWith{}; // Player already alive
if (playerWaiting) exitWith{}; // Player already waiting for roundStart
playerWaiting = true; // Mark as waiting to spawn

//[player, _spectate] call ace_spectator_fnc_stageSpectator;

waitUntil {roundState==1}; // Wait until preparation stage

if (side player == west) then {
	// Teleport to Spawn at west Bspawn
	_spawn = GetPosASL BSpawn;
	player setPosASL _spawn;
	_nul =  [player] execVM "loadout\baseloadout.sqf"; // Restore Loadout

} else {
	// Teleport to Spawn at east Bspawn
	_spawn = GetPosASL OSpawn;
	player setPosASL _spawn;
	_nul = [player] execVM "loadout\baseloadout.sqf"; // Restore Loadout

};

playerWaiting=false;
PlayerAlive=true; // Mark Player Alive
//hint "Debug: Player Respawned";

sleep 0.1;

// End spectate
[false] call ace_spectator_fnc_setSpectator;
_ret = [false] call acre_api_fnc_setSpectator; // Ensure player out of spectator for ACRE

//player sideChat "Message: Player Respawned.";
systemChat "Message: Player Respawned";

//waitUntil {roundState==2};

//player sideChat "Message: Round Started!";
