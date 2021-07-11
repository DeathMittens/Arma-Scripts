//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
//_nul = [player] execvm("loadout.sqf"); // Testing

_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {

	
	case "Para Trooper": {[_unit] execVM "loadout\antitank.sqf"};

	// Rifleman
	case "Rifleman": {[_unit] execVM "loadout\rifleman.sqf"};
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

	// Officer
	case "Officer": {[_unit] execVM "loadout\officer.sqf"};
	// Explosives specialist
	case "Explosive Specialist": {[_unit] execVM "loadout\demo.sqf"};
	// AT Specialist
	case "Missile Specialist (AT)": {[_unit] execVM "loadout\antitank.sqf"};


};

