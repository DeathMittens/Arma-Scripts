if (!isServer) exitWith {};

//
Group1 = CreateGroup resistance;
_leader = Group1 createUnit ["I_mas_afr_Soldier_TL_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_Soldier_GL_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_soldier_AR_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_soldier_LAT_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "spawnMarkNW") select 0,(getMarkerPos "spawnMarkNW") select 1,0], [], 3, "FORM"];
_leader = leader Group1;

_waypoint1 = Group1 addWaypoint [(getMarkerPos "wp4"), 0];
_waypoint1 setWaypointType "MOVE";
_waypoint1 setWaypointCombatMode "RED";

