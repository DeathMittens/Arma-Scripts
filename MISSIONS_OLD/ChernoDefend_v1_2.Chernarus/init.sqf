//init

//cTab Settings
cTabSide = east;

//farooq revive
call compile preprocessFile "FAR_revive\FAR_revive_init.sqf";

//AI spawn management and mission timing
execVM "timer.sqf";
execVM "timerEnd.sqf";

//AI Skill
//if(isServer) then {execVM "AIskill.sqf";};

//Time of day parameters
skiptime (((paramsarray select 0) - daytime) % 24);

//Group join script
[player] execVM "scripts\groupsMenu\initGroups.sqf";

//TAW View Distance script
enableSaving[false,false];
[] execVM "taw_vd\init.sqf";

//Custom Loadouts
waitUntil {!isNull player};
waitUntil {player == player};
_className = gettext (configFile >> "cfgVehicles" >> typeOf player >> "displayName");
switch (_className) do {

//	case "Rebel Anti Tank": {[player] execVM "scripts\rpg_loadout.sqf"};
	case "Rebel AKM": {[player] execVM "scripts\team_loadout.sqf"};
//	case "Rebel Machinegunner": {[player] execVM "scripts\mg_loadout.sqf"};

};

player additem "ItemAndroid";

//Task sync for JiP players
if (!(isNull player)) then //non-JIP player
{
[]execvm "briefing.sqf";
};
if (!isServer && isNull player) then //JIP player
{
waitUntil {!isNull player};
[]execvm "briefing.sqf";
}; 
