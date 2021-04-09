//init file

//cTab Settings
cTabSide = east;
cTabEnableCargo = true;
cTabCustomClasses = ["O_Boat_Armed_01_hmg_F"];

//DAC init
DAC_Zone = compile preprocessFile "DAC\Scripts\DAC_Init_Zone.sqf";
DAC_Objects = compile preprocessFile "DAC\Scripts\DAC_Create_Objects.sqf";
execVM "DAC\DAC_Config_Creator.sqf";

//farooq revive
call compile preprocessFile "FAR_revive\FAR_revive_init.sqf";

//Manhattan FOB creation
if(isServer) then {execVM "manhattansetup.sqf";};

//AI Skill
//if(isServer) then {execVM "AIskill.sqf";};

//debug - unit markers
//[server] execVM "unitmarkers.par";

//Time of day parameters
skiptime (((paramsarray select 0) - daytime) % 24);

//Group join script
[player] execVM "scripts\groupsMenu\initGroups.sqf";

//Spawn grenade protection
execVM "grenadeStop.sqf";

//TAW View Distance script
enableSaving[false,false];
[] execVM "taw_vd\init.sqf";

//Marker invisivbility for AI patrol script
//"AZ1" setMarkerAlpha 0;

//Custom Loadouts
waitUntil {!isNull player};
waitUntil {player == player};
_className = gettext (configFile >> "cfgVehicles" >> typeOf player >> "displayName");
switch (_className) do {

	case "Team Leader": {[player] execVM "scripts\team_loadout.sqf"};
	case "Recon Team Leader": {[player] execVM "scripts\reconTL_loadout.sqf"};
	case "Squad Leader": {[player] execVM "scripts\squad_loadout.sqf"};

	case "Diver Team Leader": {[player] execVM "scripts\diverTL_loadout.sqf"};
	case "Assault Diver": {[player] execVM "scripts\diver_loadout.sqf"};
	case "Diver Explosive Specialist": {[player] execVM "scripts\diver2_loadout.sqf"};

	case "Explosive Specialist": {[player] execVM "scripts\arco_loadout.sqf"};
	case "Recon Demo Specialist": {[player] execVM "scripts\arco_loadout.sqf"};
	case "Recon Scout": {[player] execVM "scripts\arco_loadout.sqf"};
	case "Recon Scout (AT)": {[player] execVM "scripts\arco_loadout.sqf"};

	case "Autorifleman": {[player] execVM "scripts\android_loadout.sqf"};
	case "Rifleman (AT)": {[player] execVM "scripts\android_loadout.sqf"};
	case "Combat Life Saver": {[player] execVM "scripts\android_loadout.sqf"};
	case "Repair Specialist": {[player] execVM "scripts\android_loadout.sqf"};
	case "Explosive Specialist": {[player] execVM "scripts\android_loadout.sqf"};

	case "Recon JTAC": {[player] execVM "scripts\android_loadout.sqf"};
	case "Recon Paramedic": {[player] execVM "scripts\android_loadout.sqf"};
	case "Recon Marksman": {[player] execVM "scripts\android_loadout.sqf"};


};


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

