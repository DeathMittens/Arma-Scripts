/*
    Executed only on server
    See: https://community.bistudio.com/wiki/Functions_Library_(Arma_3)#Initialization_Order
        for details about when the script is exactly executed.
*/

// Initialize jip and respawn manager
[] call FP_JRM_fnc_init;

// Init mission variables for triggers
hqObj = false;
hqVIPObj = false;
artyObj = false;
scudObj = false;
scudHvtObj = false;

// Prevent on deck explosions
heli1 allowDamage false;
heli2 allowDamage false;
heli3 allowDamage false;
heli4 allowDamage false;
heli5 allowDamage false;


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

sleep 2;

// Prevent on deck explosions
heli1 allowDamage true;
heli2 allowDamage true;
heli3 allowDamage true;
heli4 allowDamage true;
heli5 allowDamage true;
