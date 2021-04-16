//initPlayerLocal.sqf

// Add Briefing - Tasks & Notes
[] call compile preProcessFileLineNumbers "briefing.sqf";

// Add loadout
if (isMultiplayer) then {
[player] execVM "loadout.sqf";
} else {
	{
		[_x] execVM "loadout.sqf";
		_x disableAI "MOVE"; // For testing loadouts on AI
	} foreach switchableUnits;
};

player addEventHandler ["Respawn", {
  [player] execVM "loadout.sqf";
}];

// Custom ares funcs
if (isClass (configFile >> "CfgPatches" >> "Ares")) then {
    [] call compile preprocessFileLineNumbers "ARES\init.sqf";
};

// Custom Zeus Enchanced Module for respawning players
["a3g Custom Modules", "Respawn All Players", {null = execVM "forceRespawn.sqf"}] call zen_custom_modules_fnc_register;

// Set preset radio channels 
sleep 1;
_group = groupID (group player);
_channel = 1;

switch (_group) do {
	case "Alpha": {_channel = 1;};
	case "Bravo": {_channel = 2;};
	case "Charlie": {_channel = 3;};
	case "Command": {_channel = 4;};
};

// https://acre2.idi-systems.com/wiki/frameworks/mission-making-intro
// Set player radio to squad preset
waitUntil { ([] call acre_api_fnc_isInitialized) };
sleep 2;
[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel; // Set 343 to group frequency

//sleep 2;
//[(["ACRE_PRC117F"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel; // Script errors due to not all players having a 117F radio

if (groupID (group player) == "NullGroup") then 
{

}
else
{

};







