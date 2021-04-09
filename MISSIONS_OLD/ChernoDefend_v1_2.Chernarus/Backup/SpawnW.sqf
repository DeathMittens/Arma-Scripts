if (!isServer) exitWith {};

//
Group1 = CreateGroup West;
_leader = Group1 createUnit ["B_Soldier_TL_F", [(getMarkerPos "spawnMarkW") select 0,(getMarkerPos "spawnMarkW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_GL_F", [(getMarkerPos "spawnMarkW") select 0,(getMarkerPos "spawnMarkW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_soldier_AR_F", [(getMarkerPos "spawnMarkW") select 0,(getMarkerPos "spawnMarkW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_F", [(getMarkerPos "spawnMarkW") select 0,(getMarkerPos "spawnMarkW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_F", [(getMarkerPos "spawnMarkW") select 0,(getMarkerPos "spawnMarkW") select 1,0], [], 3, "FORM"];
_leader = leader Group1;

_waypoint1 = Group1 addWaypoint [(getMarkerPos "wp2"), 0];
_waypoint1 setWaypointType "SAD";
_waypoint1 setWaypointCombatMode "RED";

