//_nul=[]execVM "SpawnExtract.sqf";
if (!isServer) exitWith {}; // Called from server.

_spawnA = getMarkerPos "spawnSEa";
_spawnB = getMarkerPos "spawnSEb";
_spawnC = getMarkerPos "spawnSEc";

_moveA = getMarkerPos "bridgeWp1";
_moveB = getMarkerPos "bridgeWpA";
_moveC = getMarkerPos "bridgeWpB";

_m60 = "UK3CB_CW_US_B_LATE_M60a3";
_m113 = "UK3CB_CW_US_B_LATE_M113_M240";
_bradley = "UK3CB_CW_US_B_LATE_M2A2";
_crew = "UK3CB_CW_US_B_LATE_CREW";

_side = west;

_Group1 = CreateGroup _side;
_Group2 = CreateGroup _side;
_Group3 = CreateGroup _side;

_tank = createVehicle [_m60, _spawnA,[],0,"NONE"];
_ifv = createVehicle [_bradley, _spawnB,[],0,"NONE"];
_apc = createVehicle [_m113, _spawnC,[],0,"NONE"];

_commander1 = _Group1 createUnit [_crew, [(_spawnA) select 0,(_spawnA) select 1,0], [], 3, "FORM"];
_commander1 moveInCommander _tank;
_driver1 = _Group1 createUnit [_crew, [(_spawnA) select 0,(_spawnA) select 1,0], [], 3, "FORM"];
_driver1 moveInDriver _tank;
_gunner1 = _Group1 createUnit [_crew, [(_spawnA) select 0,(_spawnA) select 1,0], [], 3, "FORM"];
_gunner1 moveInGunner _tank;

_commander2 = _Group2 createUnit [_crew, [(_spawnB) select 0,(_spawnB) select 1,0], [], 3, "FORM"];
_commander2 moveInCommander _ifv;
_driver2 = _Group2 createUnit [_crew, [(_spawnB) select 0,(_spawnB) select 1,0], [], 3, "FORM"];
_driver2 moveInDriver _ifv;
_gunner2 = _Group2 createUnit [_crew, [(_spawnB) select 0,(_spawnB) select 1,0], [], 3, "FORM"];
_gunner2 moveInGunner _ifv;

_driver3 = _Group3 createUnit [_crew, [(_spawnC) select 0,(_spawnC) select 1,0], [], 3, "FORM"];
_driver3 moveInDriver _apc;
_gunner3 = _Group3 createUnit [_crew, [(_spawnC) select 0,(_spawnC) select 1,0], [], 3, "FORM"];
_gunner3 moveInGunner _apc;


_waypoint1 = _Group1 addWaypoint [(_moveA), 0];
_waypoint1 setWaypointType "MOVE";
_waypoint1 setWaypointCombatMode "YELLOW";
_waypoint1 setWaypointBehaviour "SAFE";

_waypoint2 = _Group2 addWaypoint [(_moveB), 0];
_waypoint2 setWaypointType "MOVE";
_waypoint2 setWaypointCombatMode "YELLOW";
_waypoint2 setWaypointBehaviour "SAFE";

_waypoint3 = _Group3 addWaypoint [(_moveC), 0];
_waypoint3 setWaypointType "MOVE";
_waypoint3 setWaypointCombatMode "YELLOW";
_waypoint3 setWaypointBehaviour "SAFE";

