/**
 * Converted with Arma2MapConverter v0.5.1-beta
 *
 * Source: C:\Users\Tom\Documents\Arma 3 - Other Profiles\Death%20Mittens\missions\Rotor_Wash_v1_4_ACE_HC.Chernarus\mission.sqm
 * Date: 11/07/15 2:21 PM
 */

_westHQ = createCenter west;
_eastHQ = createCenter east;
_guerHQ = createCenter resistance;
_civHQ  = createCenter civilian;
_emptyHQ = createCenter civilian;


_createdUnits = [];
_createdMarkers = [];
_createdTriggers = [];

/********************
* TRIGGER CREATION *
********************/
 
 
 
 
 
 
 
 

/*
//Test Trigger
Z1x = createTrigger["EmptyDetector", [9010.314,11292.964, 49.799]]; //map position x,y,z
Z1x setTriggerArea[100, 200, 0, true]; // size x,y, isRectangle=true
Z1x setTriggerActivation["LOGIC", "NOT PRESENT", false];
Z1x setTriggerStatements["time > 5", "fun = [""Z1x"",[111,1,0],[2,2,20,10],[],[],[],[0,0,0,0]] spawn DAC_Zone", ""]; //remove double "" from condition only
Z1x setTriggerTimeout[0, 0, 0, true];
_createdTriggers = _createdTriggers + [Z1x];
*/

/*
Z14 = createTrigger["EmptyDetector", [7967.2861, 3427.0649, 0]];
Z14 setTriggerArea[300, 250, 24.4538, false];
Z14 setTriggerActivation["LOGIC", "NOT PRESENT", false];
Z14 setTriggerStatements["time > 5", "fun = [""z14"",[14,1,0],[2,2,20,10],[],[],[],[0,0,0,0]] spawn DAC_Zone", ""];
Z14 setTriggerTimeout[0, 0, 0, true];
_createdTriggers = _createdTriggers + [Z14];
*/

// return all created units in an array
[_createdUnits, _createdMarkers, _createdTriggers];
