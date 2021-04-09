//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {
	case "Team Leader": {[_unit] execVM "loadout\FR_sl_loadout.sqf"};
	case "Assault Rifleman": {[_unit] execVM "loadout\FR_rifleman_loadout.sqf"};
	case "Assault Grenadier": {[_unit] execVM "loadout\FR_ftl_loadout.sqf"};
	case "Commander": {[_unit] execVM "loadout\FR_commander_loadout.sqf"};
	case "FAC Operator": {[_unit] execVM "loadout\FR_FAC_loadout.sqf"};
	case "AT Specialist (SMAW)": {[_unit] execVM "loadout\FR_SMAW_loadout.sqf"};
	case "Marksman": {[_unit] execVM "loadout\FR_marksman_loadout.sqf"};
	case "Spotter": {[_unit] execVM "loadout\FR_spotter_loadout.sqf"};
	case "Heavy Gunner": {[_unit] execVM "loadout\FR_mg_loadout.sqf"};
	case "Demolitions Specialist": {[_unit] execVM "loadout\FR_demo_loadout.sqf"};

	case "Rifleman": {[_unit] execVM "loadout\rifleman_loadout.sqf"};
	case "Rifleman (M136)": {[_unit] execVM "loadout\riflemanAT_loadout.sqf"};
	case "Automatic Rifleman": {[_unit] execVM "loadout\AutoRifleman_loadout.sqf"};
	case "Squad Leader": {[_unit] execVM "loadout\squadLeader_loadout.sqf"};
	case "Fire Team Leader": {[_unit] execVM "loadout\fireTeamLeader_loadout.sqf"};
	case "Officer": {[_unit] execVM "loadout\Officer_loadout.sqf"};

	case "Corpsman": {[_unit] execVM "loadout\Corpsman_loadout.sqf"};
	case "Grenadier": {[_unit] execVM "loadout\Grenadier_loadout.sqf"};

	case "Pilot": {[_unit] execVM "loadout\pilot_loadout.sqf"};
};

