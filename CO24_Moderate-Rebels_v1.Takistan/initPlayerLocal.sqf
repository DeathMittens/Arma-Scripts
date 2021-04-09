//
//call ADV_fnc_tfarSettings; // for a specific mission? Removed with ACRE


/*
	Executed locally when player joins mission (includes both mission start and JIP).
  This script guarantees that player object exists. Init.sqf does not
	See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
		for details about when the script is exactly executed.
*/

// These below scripts are RECOMMENDED but not enabled by default
// Remove the comments and change the needed strings to fit your mission (match the object names)

/*
// Cold start
[
  "gm0, gm1, plt0", // units who can start the mission. are automatically added to "can move"
  "plt1, a0, a1, a2, b0, b1, b2, e0, q0, q1, q2, w0, w1, l0, l1" // units who can move freely
] call compile preprocessFileLineNumbers "scripts\cold_start.sqf";

// Teleport flag, first is the object to addaction to, second format is ["display name", "objectName"]
[fp_flag, [
  ["Plt Command", "plt0"],
  ["Alpha actual", "a0"],
  ["Bravo actual", "b0"]
]] execVM "scripts\teleport_flag.sqf";
*/

/*
// Apply loadouts
if (!isNil "FP_fnc_getLoadout") then {
  private _added = [player, typeOf player] call FP_fnc_getLoadout;

  // Respawn with gear
  if (_added) then {
    player addEventHandler ["Respawn", {
      [player, typeOf player] call FP_fnc_getLoadout;
    }];
  };

  // Loadouts in singleplayer / editor
  if (!isMultiplayer) then {
    {
      [_x, typeOf _x] call FP_fnc_getLoadout;
    } forEach (switchableUnits - (entities "HeadlessClient_F" + [player]));
  };
};
*/

[] call compile preProcessFileLineNumbers "briefing.sqf";

// Add loadout
if (isMultiplayer) then {
[player] execVM "loadout.sqf";
} else {
{[_x] execVM "loadout.sqf";} foreach switchableUnits;
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
	case "Command Team": {_channel = 3;};
};

// https://acre2.idi-systems.com/wiki/frameworks/mission-making-intro
// Set player radio to squad preset
waitUntil { ([] call acre_api_fnc_isInitialized) };
sleep 1;
[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel; // Set 343 to group frequency

//sleep 2;
//[(["ACRE_PRC117F"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel; // Script erroRs due to noT all players having a 117F radio


if (groupID (group player) == "NullGroup") then 
{

}
else
{

};







