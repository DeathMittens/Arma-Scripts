if (!isServer) exitWith {};

//
//B_APC_Wheeled_01_cannon_F


_APC = "B_APC_Wheeled_01_cannon_F" createVehicle (getMarkerPos "vehMarkN");
Group1 = CreateGroup West;
_commander = Group1 createUnit ["B_Soldier_GL_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_commander moveIncommander _APC;
_gunner = Group1 createUnit ["B_soldier_AR_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner moveInGunner _APC;
_driver = Group1 createUnit ["B_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver moveInDriver _APC;



//

/*
Group1 = CreateGroup West;
_leader = Group1 createUnit ["B_Soldier_TL_F", [(getMarkerPos "spawnMarkN") select 0,(getMarkerPos "spawnMarkN") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_GL_F", [(getMarkerPos "spawnMarkN") select 0,(getMarkerPos "spawnMarkN") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_soldier_AR_F", [(getMarkerPos "spawnMarkN") select 0,(getMarkerPos "spawnMarkN") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_F", [(getMarkerPos "spawnMarkN") select 0,(getMarkerPos "spawnMarkN") select 1,0], [], 3, "FORM"];
_unit = Group1 createUnit ["B_Soldier_F", [(getMarkerPos "spawnMarkN") select 0,(getMarkerPos "spawnMarkN") select 1,0], [], 3, "FORM"];
_leader = leader Group1;

_waypoint1 = Group1 addWaypoint [(getMarkerPos "wp1"), 0];
_waypoint1 setWaypointType "SAD";
_waypoint1 setWaypointCombatMode "RED";



*/




_offroad1 = "I_mas_afr_Offroad_01_armed_F" createVehicle (getMarkerPos "vehMarkN");
Group1 = CreateGroup resistance;
_gunner1 = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner1 moveInGunner _offroad1;
_driver1 = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver1 moveInDriver _offroad1;
_waypoint1 = Group1 addWaypoint [(getMarkerPos "wp1"), 0];
_waypoint1 setWaypointType "SAD";
_waypoint1 setWaypointCombatMode "RED";


//////////////


_BTR1 = "RU_APC_Tracked_02_cannon_F" createVehicle (getMarkerPos "vehMarkN");
Group2 = CreateGroup resistance;
_commander2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_commander2 moveInCommander _BTR1;
_gunner2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner2 moveInGunner _BTR1;
_driver2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver2 moveInDriver _BTR1;
_waypoint2 = Group2 addWaypoint [(getMarkerPos "wp2"), 0];
_waypoint2 setWaypointType "SAD";
_waypoint2 setWaypointCombatMode "RED";

/////////////

