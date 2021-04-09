//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {


// Squad loadouts

	// Squad leader
	case "Element leader": {[_unit] execVM "loadout\elementLeader.sqf"};
	//FireTeam Leader
	case "Team Leader": {[_unit] execVM "loadout\teamLeader.sqf"};
	// Rifleman AT
	case "Rifleman (M136)": {[_unit] execVM "loadout\riflemanAT.sqf"};
	// Grenadier
	case "Grenadier": {[_unit] execVM "loadout\grenadier.sqf"};
	// Machine Gunner
	case "Machine Gunner": {[_unit] execVM "loadout\machinegunner.sqf"};
	// Medic
	case "SARC Medic": {[_unit] execVM "loadout\medic.sqf"};
	
	
////////// Not yet created loadouts!!!///////////////
	
// Command Loadouts
	
	// Officer / Platoon leader
	case "Officer": {[_unit] execVM "loadout\officer.sqf"};
	// Team Chief / Platoon 2IC 
	case "Team Chief": {[_unit] execVM "loadout\teamChief.sqf"};
	// Pilot
	case "Helicopter Pilot": {[_unit] execVM "loadout\helicopterPilot.sqf"};
		
// Scouts
	
	//JTAC
	case "Joint Fires Observer": {[_unit] execVM "loadout\scoutJTAC.sqf"};	
	//Scout Sniper / marksman
	case "Scout Sniper (M110)": {[_unit] execVM "loadout\scoutMarksman.sqf"};
	//Scout Spotter
	case "Scout Spotter": {[_unit] execVM "loadout\scoutSpotter.sqf"};
	// Scout team leader
	case "JTAC": {[_unit] execVM "loadout\scoutLeader.sqf"};

};

if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};

/*
// Set preset radio channels 
sleep 1;
_group = groupID (group player);
_channel = 1;

switch (_group) do {
	case "Command Team": {_channel = 4;};
	case "Air": {_channel = 4;};
	case "Alpha": {_channel = 1;};
	case "Bravo": {_channel = 2;};
	case "Recom Team": {_channel = 3;};
};

// https://acre2.idi-systems.com/wiki/frameworks/mission-making-intro
// Set player radio to squad preset
waitUntil { ([] call acre_api_fnc_isInitialized) };
[(["ACRE_PRC343"] call acre_api_fnc_getRadioByType), _channel] call acre_api_fnc_setRadioChannel;

// Set Backpack radio to channel 2
waitUntil { ([] call acre_api_fnc_isInitialized) };
[(["ACRE_PRC117F"] call acre_api_fnc_getRadioByType), 2] call acre_api_fnc_setRadioChannel;

if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
