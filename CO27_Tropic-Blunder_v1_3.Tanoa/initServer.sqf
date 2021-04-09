/*
    Executed only on server
    See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
        for details about when the script is exactly executed.
*/

// Initialize jip and respawn manager
[] call FP_JRM_fnc_init;


//initialize objective variables
crashObj = false;
publicVariable "crashObj";

// Start support air assets locked
mh602 setVehicleLock "LOCKED";
a10 setVehicleLock "LOCKED";
uh1y setVehicleLock "LOCKED";

// Test range laser target
laserTarget1 = "LaserTargetW" createVehicle (getPos target1);
laserTarget1 attachto [target1,[0,3,1]];
laserTarget2 = "LaserTargetW" createVehicle (getPos target2);
laserTarget2 attachto [target2,[0,3,1]];

// Add some default stuff to zeus
{
  private _curator = _x;
  _curator addCuratorEditableObjects [vehicles, true];
  _curator addCuratorEditableObjects [(allMissionObjects "CAManBase"), false];
  _curator addCuratorEditableObjects [(allMissionObjects "Air"), true];
  _curator addCuratorEditableObjects [(allMissionObjects "Ammo"), false];
  _curator setCuratorWaypointCost 0;
  {_curator setCuratorCoef [_x, 0]} forEach ["place","edit","delete","destroy","group","synchronize"];
} forEach allCurators;



// Convoluted method of tracking Recon team crash site players and detection for if they have returned to base or Joined in Progress.
sleep 1;
 
_CrashUnits = ["s1","s2","s3","s4","s5"]; // Crash site scout team units
_unitExists = []; // Tracking units that did not Join In Progress

// Check which units joined in progress
{
	if (!isNil _x) then { _unitExists insert [-1,[_x]];}; // Does Exist
} forEach _CrashUnits; 

_area = homeArea; // Trigger area

// Detech if non-JIP players return to base for objective completion
while {!crashObj && !(isNil {_unitExists select 0})} do {
	{

		private _unit = missionNamespace getVariable [_x, "nil"];
		
		
		if (str(_unit) isNotEqualTo str("nil")) then {
		
			if (_unit inArea _area) exitWith {
				crashObj = true;
				if(!isMultiplayer) then {hint "Debug: Recon rescue triggered";};
			};
		};
	}forEach _unitExists;
	
	if(crashObj) then {
		publicVariable "crashObj";
	};
	sleep 10;
};




