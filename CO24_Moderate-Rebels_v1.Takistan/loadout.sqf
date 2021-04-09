//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {

	// Squad
	case "Machinegunner (M84)": {[_unit] execVM "loadout\machinegunner.sqf"};
	case "Missile Specialist (AT)": {[_unit] execVM "loadout\RPG7.sqf"};
	case "Grenadier (PBG)": {[_unit] execVM "loadout\grenadier.sqf"};
	case "Rifleman (AT)": {[_unit] execVM "loadout\riflemanAT.sqf"};
	
	// Medic
	case "Field Medic": {[_unit] execVM "loadout\Medic.sqf"};
	
	// Leaders (radios)
	case "Officer": {[_unit] execVM "loadout\officer.sqf"};
	case "Squad Leader": {[_unit] execVM "loadout\squadLeader.sqf"};
	case "Fireteam Leader": {[_unit] execVM "loadout\fireteamLeader.sqf"};

};

/*
// Squad loadouts

	// Squad
	case "Machinegunner (M84)": {[_unit] execVM "loadout\machinegunner.sqf"};
	case "Missile Specialist (AT)": {[_unit] execVM "loadout\RPG7.sqf"};
	case "Grenadier (PGB)": {[_unit] execVM "loadout\grenadier.sqf"};
	case "Rifleman (AT)": {[_unit] execVM "loadout\riflemanAT.sqf"};
	
	// Medic
	case "Field Medic": {[_unit] execVM "loadout\Medic.sqf"};
	
	// Leaders (radios)
	case "Officer": {[_unit] execVM "loadout\officer.sqf"};
	case "Squad Leader": {[_unit] execVM "loadout\squadLeader.sqf"};
	case "Fireteam Leader": {[_unit] execVM "loadout\fireteamLeader.sqf"};
	
	

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
*/



