// bridgeCounterAttack.sqf
// hintSilent "Debug: Bridge Coutnerattack"; _nul = [] execVM("bridgeCounterAttack.sqf");
if (!IsServer) exitWith{};

sleep 60;

_nul=["spawnSW","bridgeAttack", 0, "bridgeWp1"]execVM "SpawnReinforcements.sqf"; // btr + inf

sleep 60;

_nul=["spawnSE","bridgeAttack", -1, "bridgeWp1"]execVM "SpawnReinforcements.sqf"; // bmp

sleep 60;

_nul=["spawnE","bridgeAttack3", 2, "nul", "bridgeAttack"]execVM "SpawnReinforcements.sqf"; // btr40 + inf

sleep 60;

_nul=["spawnW","bridgeAttack4", 3, "nul", "bridgeAttack"]execVM "SpawnReinforcements.sqf"; // mtlb + inf

sleep 60;

_nul=["spawnW","bridgeAttack4", -2, "nul", "bridgeAttack"]execVM "SpawnReinforcements.sqf"; // t-55


if (!farpObj) then {
	// If the FARP isnt clear, spawn a heli
	_spawnPos = getMarkerPos "spawnHeli";

	_pilot = "UK3CB_CW_SOV_O_EARLY_HELI_PILOT";
	_group1 = CreateGroup east;
	heli1 = createVehicle [ "UK3CB_CW_SOV_O_EARLY_Mi_24P", _spawnPos, [], 0, "FLY" ];

	_pilot = _group1 createUnit [_pilot , [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_pilot moveInDriver heli1;
	_gunner = _group1 createUnit [_pilot , [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_gunner moveInGunner heli1;

	_pilot setSkill 0.2;
	_gunner setSkill 0.2;

	heli1 removeWeaponTurret ["rhs_weap_fcs_mi24", [0]];
	heli1 removeWeaponTurret ["rhs_weap_9M120_launcher", [0]];
	heli1 removeMagazine "rhs_mag_9M120M_Mi24_2x";
	heli1 removeMagazine "rhs_mag_9M120M_Mi24_2x";
	heli1 removeMagazine "rhs_mag_b8v20a_s8kom";
	heli1 setCollisionLight true;
	heli1 flyInHeight 100;
	heli1 setVehicleLock "LOCKED";

	_waypointPos = getMarkerPos "bridgeAttack";
	_waypoint1 = _group1 addWaypoint [(_waypointPos), 0];
	_waypoint1 setWaypointType "SAD";
	_waypoint1 setWaypointCombatMode "RED";
	_waypoint1 setWaypointBehaviour "SAFE";
};

sleep 300;

defendObj = true;
publicVariable "defendObj";

