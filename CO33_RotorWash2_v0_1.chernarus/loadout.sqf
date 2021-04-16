//Custom Loadouts
//waitUntil {!isNull player};
//waitUntil {player == player};
_unit = _this select 0;
_className = gettext (configFile >> "cfgVehicles" >> typeOf _unit >> "displayName");
switch (_className) do {

	// Squad
	//case "Rifleman": {[_unit] execVM "loadout\rifleman.sqf"};
	
	// Officer/Platoon Leader
	case "Officer": {[_unit] execVM "loadout\Officer.sqf"};
	
	// Squad Leader
	case "Squad Leader": {[_unit] execVM "loadout\SquadLeader.sqf"};
	
	// Fire Team Leader (OR Command group 2IC)
	case "Team Leader": {[_unit] execVM "loadout\fireteamLeader.sqf"};
	
	// Autorifleman
	case "Auto Rifleman (M249)": {[_unit] execVM "loadout\autorifleman.sqf"};
	
	// Machinegunner
	case "Machine Gunner": {[_unit] execVM "loadout\machinegunner.sqf"};
	
	// Grenadier
	case "Grenadier": {[_unit] execVM "loadout\Grenadier.sqf"};
	
	// AT Specialist
	case "Assaultman (SMAW)": {[_unit] execVM "loadout\AntiTank.sqf"};
	
	// AT Assistant
	case "AT Assistant (Javelin)": {[_unit] execVM "loadout\AntiTankAssistant.sqf"};
	
	// Rifleman / AT Assistant
	case "Rifleman": {[_unit] execVM "loadout\AntiTankAssistant.sqf"};
	
	// Rifleman (LAT) m136
	case "Rifleman (M136)": {[_unit] execVM "loadout\riflemanAT.sqf"};
	
	
	// Corpsman
	case "Corpsman": {[_unit] execVM "loadout\Corpsman.sqf"};
	
	// Helicopter Pilot
	case "Helicopter Pilot": {[_unit] execVM "loadout\HelicopterPilot.sqf"};
	
	// demo specialist
	case "EOD Tech": {[_unit] execVM "loadout\explosives.sqf"};
	
};

