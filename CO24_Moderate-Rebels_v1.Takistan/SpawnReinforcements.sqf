//_nul=["spawnMarkerSouth","crossroadsObjMark"]execVM "SpawnReinforcements.sqf";
if (!isServer) exitWith {}; // Reinforcement wave. Called from server.

_spawnMarker = _this param [0, "nul", [""]]; // Map Marker name for spawn location
_attackMarker = _this param [1, "nul", [""]]; // Map marker name for waypoint to attack
_IsTank = _this param [2, false, [false]]; // Set for if transport or tank (Get out or stay in vehicle)

_cargoUnits = [ // 8 Units mixed
	"rhsgref_ins_squadleader",
	"rhsgref_ins_grenadier_rpg",
	"rhsgref_ins_rifleman_rpg26",
	"rhsgref_ins_machinegunner",
	"rhsgref_ins_medic",
	"rhsgref_ins_militiaman_mosin",
	"rhsgref_ins_grenadier",
	"rhsgref_ins_rifleman_akm"
];

_gunnerUnit = "rhsgref_ins_crew";
_commanderUnit = "rhsgref_ins_crew";
_driverUnit = "rhsgref_ins_rifleman_aksu";

_side = east;

_spawnPos = getMarkerPos _spawnMarker;
_attackPos = getMarkerPos _attackMarker;

//Loadout Function
_Spawn_Loadout = {
	private _unit = _this select 0; // unit selected param
	// set custom loadout here:
	_unit addHeadgear selectRandom ["H_ShemagOpen_tan", "H_Shemag_olive", "H_ShemagOpen_khk", "H_Bandanna_gry"];
	_unit setSpeaker selectRandom ["Male01PER", "Male02PER", "Male03PER"];
	_unit setSkill 0.3;
};

_Group1 = CreateGroup _side;

if (_IsTank) then { // Armour
	_vehc = createVehicle ["rhsgref_ins_bmp1p",_spawnPos,[],0,"NONE"];
	[
		_vehc,
		["rhs_sand",1], 
		["9p135_hide_source",1,"crate_l1_unhide",1,"crate_l2_unhide",1,"crate_l3_unhide",1,"crate_r1_unhide",1,"crate_r2_unhide",1,"crate_r3_unhide",1,"wood_1_unhide",1]
	] call BIS_fnc_initVehicle;
		
	_gunner1 = _Group1 createUnit [_commanderUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_gunner1 moveInGunner _vehc;
	[_gunner1] call _Spawn_Loadout;	
	
	_driver1 = _Group1 createUnit [_driverUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_driver1 moveInDriver _vehc;
	[_driver1] call _Spawn_Loadout;
	

	
} else { // Unarmed BRDM
	_vehc = createVehicle ["rhsgref_BRDM2UM_ins", _spawnPos,[],0,"NONE"];
	[
		_vehc,
		["khaki",1], 
		true
	] call BIS_fnc_initVehicle;
	
	_driver1 = _Group1 createUnit [_driverUnit, [(_spawnPos) select 0,(_spawnPos) select 1,0], [], 3, "FORM"];
	_driver1 moveInDriver _vehc;
	[_driver1] call _Spawn_Loadout;	
	
	//Group creation - Spawn all units in array.
	{
		_unit = _Group1 createUnit [_x, _spawnPos , [], 3, "FORM"];
		// Custom loadout options
		if (true) then { 
			_unit moveInCargo _vehc;
			[_unit] call _Spawn_Loadout;
		};
	}forEach _cargoUnits;

};

_leader = leader _Group1;

// Waypoint
// move fast
// aware
if (!IisTank) then {
	_waypoint1 = _Group1 addWaypoint [(_attackPos), 0];
	_waypoint1 setWaypointType "GETOUT";
	_waypoint1 setWaypointCombatMode "RED";
};

_waypoint2 = _Group1 addWaypoint [(_attackPos), 0];
_waypoint2 setWaypointType "SAD";
_waypoint2 setWaypointCombatMode "RED";

