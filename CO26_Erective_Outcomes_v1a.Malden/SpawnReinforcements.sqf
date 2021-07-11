//_nul=["spawnMarkerSouth","crossroadsObjMark"]execVM "SpawnReinforcements.sqf";
if (!isServer) exitWith {}; // Reinforcement wave. Called from server.

_spawnMarker = _this param [0, "nul", [""]]; // Map Marker name for spawn location
_attackMarker = _this param [1, "nul", [""]]; // Map marker name for waypoint to attack
_Type = _this param [2, 0, [0]]; // Set for if transport or tank (Get out or stay in vehicle)
	// -2 - T55 only
	// -1 - BMP only
	// 0 - inf + btr
	// 1 - inf + bmp
	// 2 - inf + btr40
	// 3 - inf + mtlb
_middleWaypoint = _this param [3, "nul", [""]]; // optional additional waypoint before final location
_lastWaypoint = _this param [4, "nul", [""]]; // optional waypoint
_dir = _this param [5, 0, [0]]; // Set dir, optional
//[_spawnMarker, _attackMarker, _Type, _middleWaypoint, _lastWaypoint, _dir]

_cargoUnits = [ // 7 Units mixed
	"UK3CB_CW_SOV_O_EARLY_VDV_SL",
	"UK3CB_CW_SOV_O_EARLY_VDV_TL",
	"UK3CB_CW_SOV_O_EARLY_VDV_MG",
	"UK3CB_CW_SOV_O_EARLY_VDV_AT",
	"UK3CB_CW_SOV_O_EARLY_VDV_LAT",
	"UK3CB_CW_SOV_O_EARLY_VDV_GL",
	"UK3CB_CW_SOV_O_EARLY_VDV_AR"
];

_gunnerUnit = "UK3CB_CW_SOV_O_EARLY_VDV_CREW";
_commanderUnit = "UK3CB_CW_SOV_O_EARLY_VDV_CREW";
_driverUnit = "UK3CB_CW_SOV_O_EARLY_VDV_CREW";

_side = east;

// Classes:
//MTLB UK3CB_CW_SOV_O_LATE_MTLB_PKT
//"UK3CB_CW_SOV_O_LATE_BTR60",
//"UK3CB_CW_SOV_O_LATE_BTR70",
//"UK3CB_CW_SOV_O_LATE_BRDM2"
//"UK3CB_CW_SOV_O_LATE_BMP1",
//"UK3CB_CW_SOV_O_LATE_BMD1"


_spawnPos = getMarkerPos _spawnMarker;
_attackPos = getMarkerPos _attackMarker;

//Loadout Function
_Spawn_Loadout = {
	private _unit = _this select 0; // unit selected param
	// set custom loadout here:
	//_unit addHeadgear selectRandom ["H_ShemagOpen_tan", "H_Shemag_olive", "H_ShemagOpen_khk", "H_Bandanna_gry"];
	//_unit setSpeaker selectRandom ["Male01PER", "Male02PER", "Male03PER"];
	_unit setSkill 0.3;
	_unit setSkill ["aimingaccuracy", 0.2];
};

_Group1 = CreateGroup _side;
_Group2 = CreateGroup _side;

_bmp = "UK3CB_CW_SOV_O_LATE_BMP1";
_btr = "UK3CB_CW_SOV_O_LATE_BTR60";
_btr40 = "UK3CB_CW_SOV_O_EARLY_BTR40_MG";
_mtlb = "UK3CB_CW_SOV_O_EARLY_MTLB_PKT";
_brdm = "UK3CB_CW_SOV_O_EARLY_BRDM2";
_t55 = "UK3CB_CW_SOV_O_EARLY_T55";

_tank = false;

if (IsServer) then {
	systemChat format ["Debug: Spawning type: %1", _Type];
};

switch (_Type) do {
	case 1: {_btr = _bmp};
	case 2: {_btr = _btr40;};
	case 3: {_btr = _mtlb;};
	case 4: {_btr = _brdm;};
	case -1: {_tank = true;}; // bmp
	case -2: {_bmp = _t55; _tank = true;}; // tank
};

if (_tank) then { // Armour
	_vehc = createVehicle [_bmp, _spawnPos,[],0,"NONE"];
	_vehc setDir _dir;
		
	_gunner1 = _Group1 createUnit [_commanderUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_gunner1 moveInGunner _vehc;
	[_gunner1] call _Spawn_Loadout;	
	
	_driver1 = _Group1 createUnit [_driverUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_driver1 moveInDriver _vehc;
	[_driver1] call _Spawn_Loadout;

	_vehc setVehicleLock "LOCKED";
	
} else { // BTR / BRDM

	_vehc = createVehicle [_btr, _spawnPos,[],0,"NONE"];
	_vehc setDir _dir;

	_driver1 = _Group1 createUnit [_driverUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_driver1 moveInDriver _vehc;
	[_driver1] call _Spawn_Loadout;	

	_gunner1 = _Group1 createUnit [_commanderUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_gunner1 moveInGunner _vehc;
	[_gunner1] call _Spawn_Loadout;	
	
	_counter = 0;
	//Group creation - Spawn all units in array.
	{
		_counter = _counter + 1;
		if (_Type == 2 && _counter > 5) exitWith{};

		_unit = _Group2 createUnit [_x, _spawnPos , [], 3, "FORM"];
		// Custom loadout options
		if (true) then { 
			_unit moveInCargo _vehc;
			[_unit] call _Spawn_Loadout;
		};
	}forEach _cargoUnits;

	_vehc setVehicleLock "LOCKED";
};

_leader = leader _Group1;

if (_middleWaypoint != "nul") then { // Optional middle waypoint
	_middlePos = getMarkerPos _middleWaypoint;
	_waypoint0 = _Group1 addWaypoint [(_middlePos), 0];
	_waypoint0 setWaypointType "MOVE";
	_waypoint0 setWaypointCombatMode "YELLOW";
	_waypoint0 setWaypointBehaviour "SAFE";
};

// Waypoint
// move fast
// aware
if (!_tank) then {
	_waypoint1 = _Group1 addWaypoint [(_attackPos), 0];
	_waypoint1 setWaypointType "TR UNLOAD";
	_waypoint1 setWaypointCombatMode "RED";
	_waypoint1 setWaypointBehaviour "AWARE";

	_waypoint1 setWaypointTimeout [5, 10, 15];

};

if (_tank) then {
	_waypoint2 = _Group1 addWaypoint [(_attackPos), 0];
	_waypoint2 setWaypointType "SAD";
	_waypoint2 setWaypointCombatMode "RED";
	_waypoint2 setWaypointBehaviour "AWARE";
};


if (!_tank) then { // Transport Inf waypoints

	_waypoint1 = _Group2 addWaypoint [(_attackPos), 0];
	_waypoint1 setWaypointType "GETOUT";
	_waypoint1 setWaypointCombatMode "YELLOW";
	_waypoint1 setWaypointBehaviour "SAFE";

	if (_lastWaypoint != "nul") then { // Optional middle waypoint
		_lastPos = getMarkerPos _lastWaypoint;

		_waypoint3 = _Group2 addWaypoint [(_lastPos), 0];
		_waypoint3 setWaypointType "SAD";
		_waypoint3 setWaypointCombatMode "RED";
		_waypoint3 setWaypointBehaviour "AWARE";

		_waypoint3b = _Group1 addWaypoint [(_lastPos), 0];
		_waypoint3b setWaypointType "SAD";
		_waypoint3b setWaypointCombatMode "RED";
		_waypoint3b setWaypointBehaviour "AWARE";

	} else {

		_waypoint2 = _Group2 addWaypoint [(_attackPos), 0];
		_waypoint2 setWaypointType "SAD";
		_waypoint2 setWaypointCombatMode "RED";
		_waypoint2 setWaypointBehaviour "AWARE";

		_waypoint2 = _Group1 addWaypoint [(_attackPos), 0];
		_waypoint2 setWaypointType "SAD";
		_waypoint2 setWaypointCombatMode "RED";
		_waypoint2 setWaypointBehaviour "AWARE";

	};
};

