//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
//_nul = [player] execvm("loadout.sqf"); // Testing

_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {

	
	// Officer
	case "Officer": {[_unit] execVM "loadout\officer.sqf"};

	// Rifleman
	case "Rifleman": {[_unit] execVM "loadout\rifleman.sqf"};

	// Squad leader // team leader
	case "Squad Leader": {[_unit] execVM "loadout\squadLeader.sqf"};
	case "Team Leader": {[_unit] execVM "loadout\squadLeader.sqf"};

	// Machine Gunner
	case "Machine Gunner": {[_unit] execVM "loadout\machinegunner.sqf"};
	case "Gunner (HMG)": {[_unit] execVM "loadout\machinegunner.sqf"};

	// Auto Rifleman
	case "Autorifleman": {[_unit] execVM "loadout\autorifleman.sqf"};

	// Rifleman (AT)
	case "Rifleman (AT)": {[_unit] execVM "loadout\riflemanAT.sqf"};

	// AT Specialist
	case "Missile Specialist (AT)": {[_unit] execVM "loadout\AntiTank.sqf"};

	// Grenadier
	case "Grenadier": {[_unit] execVM "loadout\grenadier.sqf"};

	// Medic
	case "Combat Life Saver": {[_unit] execVM "loadout\medic.sqf"};
	
	// Helicopter Pilot
	case "Helicopter Pilot": {[_unit] execVM "loadout\pilot.sqf"};
	case "Repair Specialist": {[_unit] execVM "loadout\pilot.sqf"};


	/*
	// Rifleman (AT)
	case "Rifleman (AT)": {[_unit] execVM "loadout\riflemanAT.sqf"};

	// Squad leader
	case "Squad Leader": {[_unit] execVM "loadout\squadLeader.sqf"};
	// Team leader
	case "Team Leader": {[_unit] execVM "loadout\teamLeader.sqf"};
	// Auto Rifleman
	case "Autorifleman": {[_unit] execVM "loadout\autorifleman.sqf"};
	// Medic
	case "Combat Life Saver": {[_unit] execVM "loadout\medic.sqf"};

	// Explosives specialist
	case "Explosive Specialist": {[_unit] execVM "loadout\demo.sqf"};
	// AT Specialist
	case "Missile Specialist (AT)": {[_unit] execVM "loadout\antitank.sqf"};

	*/
};

