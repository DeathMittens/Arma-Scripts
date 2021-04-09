//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Insert_Veh        //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_vehicles","_i","_veh"];

_vehicles = _this select 0;_i = 1;

while {_i < count _vehicles} do
{
	_veh = _vehicles select _i;
	if(!isNil "_veh") then
	{
		if(_veh in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_veh]};
	};
	_i = _i + 1;
};