if (!isServer) exitWith {};



//artillery1 doArtilleryFire [getmarkerpos "artyMark1", "8Rnd_82mm_Mo_shells", 3];
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 1
//W,W,N,N
sleep 5;
execVM "spawnW.sqf";
execVM "spawnNW.sqf";
sleep 1;
execVM "spawnNW.sqf";
sleep 27;
execVM "spawnW.sqf";
sleep 1;
execVM "spawnNW.sqf";



waveOne=true;
sleep 265;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 2
//N,N,NW
//2x MG offroads

execVM "spawnNW.sqf";
execVM "spawnNW.sqf";
sleep 1;
execVM "spawnN.sqf";
sleep 28;
execVM "spawnN.sqf";

sleep 1;

_offroad1 = "I_mas_afr_Offroad_01_armed_F" createVehicle (getMarkerPos "vehMarkN");
Group1 = CreateGroup resistance;
_gunner1 = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner1 moveInGunner _offroad1;
_driver1 = Group1 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver1 moveInDriver _offroad1;
_waypoint1 = Group1 addWaypoint [(getMarkerPos "wp1"), 0];
_waypoint1 setWaypointType "SAD";
_waypoint1 setWaypointCombatMode "RED";

sleep 30;

_offroad1a = "I_mas_afr_Offroad_01_armed_F" createVehicle (getMarkerPos "vehMarkN");
Group1a = CreateGroup resistance;
_gunner1a = Group1a createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner1a moveInGunner _offroad1a;
_driver1a = Group1a createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver1a moveInDriver _offroad1a;
_waypoint1a = Group1 addWaypoint [(getMarkerPos "wp3"), 0];
_waypoint1a setWaypointType "SAD";
_waypoint1a setWaypointCombatMode "RED";


WaveTwo=true;
sleep 240;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 3
//Spawn light armour - Russian BTR

execVM "spawnN.sqf";
execVM "spawnN.sqf";
sleep 1;
execVM "spawnNE.sqf";
sleep 28;
execVM "spawnNE.sqf";

sleep 1;

_BTR1 = "I_APC_tracked_03_cannon_F" createVehicle (getMarkerPos "vehMarkN");
Group2 = CreateGroup resistance;
_commander2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_commander2 moveInCommander _BTR1;
_gunner2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_gunner2 moveInGunner _BTR1;
_driver2 = Group2 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkN") select 0,(getMarkerPos "vehMarkN") select 1,0], [], 3, "FORM"];
_driver2 moveInDriver _BTR1;
_waypoint2 = Group2 addWaypoint [(getMarkerPos "wp4"), 0];
_waypoint2 setWaypointType "SAD";
_waypoint2 setWaypointCombatMode "RED";




WaveThree=true;
sleep 270;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 4;
//Heavy Armour - russian T-100


execVM "spawnNW.sqf";
sleep 1;
execVM "spawnNE.sqf";
sleep 28;
execVM "spawnN.sqf";
execVM "spawnN.sqf";

sleep 1;

_TANK1 = "I_APC_tracked_03_cannon_F" createVehicle (getMarkerPos "vehMarkNE");
Group3 = CreateGroup resistance;
_commander3 = Group3 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNE") select 0,(getMarkerPos "vehMarkNE") select 1,0], [], 3, "FORM"];
_commander3 moveInCommander _TANK1;
_gunner3 = Group3 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNE") select 0,(getMarkerPos "vehMarkNE") select 1,0], [], 3, "FORM"];
_gunner3 moveInGunner _TANK1;
_driver3 = Group3 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNE") select 0,(getMarkerPos "vehMarkNE") select 1,0], [], 3, "FORM"];
_driver3 moveInDriver _TANK1;
_waypoint3 = Group3 addWaypoint [(getMarkerPos "wp1"), 0];
_waypoint3 setWaypointType "SAD";
_waypoint3 setWaypointCombatMode "RED";


waveFour=true;
sleep 270;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 5;
//2 MG offroads and light armour - IFV Warrior

execVM "spawnN.sqf";
execVM "spawnN.sqf";
sleep 1;
execVM "spawnNw.sqf";
sleep 30;
execVM "spawnNw.sqf";

sleep 1;

_IFV4x = "I_APC_tracked_03_cannon_F" createVehicle (getMarkerPos "vehMarkNW");
Group4x = CreateGroup resistance;
_commander4x = Group4x createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNW") select 0,(getMarkerPos "vehMarkNW") select 1,0], [], 3, "FORM"];
_commander4x moveInCommander _IFV4x;
_gunner4x = Group4x createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNW") select 0,(getMarkerPos "vehMarkNW") select 1,0], [], 3, "FORM"];
_gunner4x moveInGunner _IFV4x;
_driver4x = Group4x createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkNW") select 0,(getMarkerPos "vehMarkNW") select 1,0], [], 3, "FORM"];
_driver4x moveInDriver _IFV4x;
_waypoint4x = Group4x addWaypoint [(getMarkerPos "wp4"), 0];
_waypoint4x setWaypointType "SAD";
_waypoint4x setWaypointCombatMode "RED";

sleep 2;

_offroad4 = "I_mas_afr_Offroad_01_armed_F" createVehicle (getMarkerPos "vehMarkW");
Group4 = CreateGroup resistance;
_gunner4 = Group4 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkW") select 0,(getMarkerPos "vehMarkW") select 1,0], [], 3, "FORM"];
_gunner4 moveInGunner _offroad4;
_driver4 = Group4 createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkW") select 0,(getMarkerPos "vehMarkW") select 1,0], [], 3, "FORM"];
_driver4 moveInDriver _offroad4;
_waypoint4 = Group4 addWaypoint [(getMarkerPos "wp1"), 0];
_waypoint4 setWaypointType "SAD";
_waypoint4 setWaypointCombatMode "RED";

sleep 30;

_offroad4a = "I_mas_afr_Offroad_01_armed_F" createVehicle (getMarkerPos "vehMarkW");
Group4a = CreateGroup resistance;
_gunner4a = Group4a createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkW") select 0,(getMarkerPos "vehMarkW") select 1,0], [], 3, "FORM"];
_gunner4a moveInGunner _offroad4a;
_driver4a = Group4a createUnit ["I_mas_afr_Soldier_F", [(getMarkerPos "vehMarkW") select 0,(getMarkerPos "vehMarkW") select 1,0], [], 3, "FORM"];
_driver4a moveInDriver _offroad4a;
_waypoint4a = Group4a addWaypoint [(getMarkerPos "wp2"), 0];
_waypoint4a setWaypointType "SAD";
_waypoint4a setWaypointCombatMode "RED";



WaveFive=true;
sleep 236;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Wave 6;


execVM "spawnN.sqf";
sleep 1;
execVM "spawnW.sqf";
sleep 1;
execVM "spawnNE.sqf";
execVM "spawnNE.sqf";


waveSix=true;


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////







