// initPlayerLocal.sqf
setViewDistance 2800;
setTerrainGrid 25;

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

// Red C130 Light.
light1 = "#lightpoint" createVehicleLocal (getPos c130);
light1 setLightBrightness 0.5;
light1 setLightAmbient [1.0, 0.0, 0.0]; // Red Light
light1 setLightColor [1.0, 0.0, 0.0];
light1 lightAttachObject [c130, [0,0,0]];

// Red C130 Light. 
light2 = "#lightpoint" createVehicleLocal (getPos c1302);
light2 setLightBrightness 0.5;
light2 setLightAmbient [1.0, 0.0, 0.0]; // Red Light
light2 setLightColor [1.0, 0.0, 0.0];
light2 lightAttachObject [c1302, [0,0,0]];



//DropZone = 0; // Not required if set from server?

// Issue with spawning in falling animation
player switchMove "HubSpectator_stand";
player playMove "AmovPercMstpSlowWrflDnon";
player allowdamage false;
sleep 0.5;
player switchMove "HubSpectator_stand";
player playMove "AmovPercMstpSlowWrflDnon";
player allowdamage true;

// Start C-130 screen shake effect - stops after HALO
enableCamShake true;
if (!IsServer) then { // disable for SP testing
	addCamShake [1, 360, 10];
};

// Set preset radio channels 
sleep 1;
_group = groupID (group player);
_channel = 1;

switch (_group) do {
	case "Alpha": {_channel = 1;};
	case "Bravo": {_channel = 2;};
	case "Charlie": {_channel = 3;};
	case "Delta": {_channel = 4;};
	case "Command": {_channel = 5;};
};

// https://acre2.idi-systems.com/wiki/frameworks/mission-making-intro
// Set player radio to squad preset
waitUntil { ([] call acre_api_fnc_isInitialized) };
sleep 2;
[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel; // Set 343 to group frequency

//sleep 2;
//[(["ACRE_PRC117F"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel; // Script errors due to not all players having a 117F radio


while {DropZone isEqualTo 0} do {
	sleep 1;
};

// Needs MP locality Testing for colour change.
light1 setLightColor [0.0, 1.0, 0.0]; // Green Light
light1 setLightAmbient [0.0, 1.0, 0.0];

light2 setLightColor [0.0, 1.0, 0.0]; // Green Light
light2 setLightAmbient [0.0, 1.0, 0.0];

/*
if (groupID (group player) == "NullGroup") then 
{

}
else
{

};
*/