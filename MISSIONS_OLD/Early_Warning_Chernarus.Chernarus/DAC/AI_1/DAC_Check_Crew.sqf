//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Check_Crew        //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_i","_unit","_crew","_vehArray"];

_vehArray = _this select 0;_i = 0;_unit = objNull;_crew = [];

while {_i < count _vehArray} do
{
	_unit = (_vehArray select _i);
	if(((_unit emptyPositions "Driver") > 0) || {(!(canmove _unit)) && {!((typeof _unit) in DAC_GunAllowed)}})then
	{
		_crew = crew _unit;
		{unassignvehicle _x;[_x] ordergetin false}foreach _crew;
		_vehArray = _vehArray - [_unit];[2,(_crew select 0)] spawn DAC_fAIRadio;
		if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]};
	}
	else
	{
		_i = _i + 1;
	};
};
_vehArray