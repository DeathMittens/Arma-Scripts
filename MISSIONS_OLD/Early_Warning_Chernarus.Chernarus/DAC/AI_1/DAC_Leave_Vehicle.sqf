//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Leave_Vehicle     //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_i","_group","_unit","_veh","_crew","_mode","_id"];

_group = _this select 0;_mode = _this select 1;_id = _this select 2;_i = 0;_unit = objNull;_veh = [];_crew = [];

{if(_x != vehicle _x) then {if(!((vehicle _x) in _veh)) then {_veh set [count _veh,vehicle _x]}}} foreach units _group;

if(count _veh > 0) then
{
	switch (_mode) do
	{
		case 1:	{
					while {_i < count _veh} do
					{
						_unit = (_veh select _i);_crew = crew _unit;
						if((isNull (gunner _unit)) || {(!(canmove _unit)) && {!((typeof _unit) in DAC_GunAllowed)}}) then
						{
							{unassignvehicle _x;[_x] ordergetin false} foreach _crew;[2,(leader _group)] spawn DAC_fAIRadio;
							if(_id == 1) then {if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]}};
						}
						else
						{
							{if(_x != gunner _unit) then {unassignvehicle _x;[_x] ordergetin false}} foreach _crew;
						};
						_i = _i + 1;
					};
				};
		case 2:	{
					while {_i < count _veh} do
					{
						_unit = (_veh select _i);_crew = crew _unit;
						if((isNull (driver _unit)) || {(!(canmove _unit)) && {!((typeof _unit) in DAC_GunAllowed)}}) then
						{
							{unassignvehicle _x;[_x] ordergetin false} foreach _crew;[2,(leader _group)] spawn DAC_fAIRadio;
							if(_id == 1) then {if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse = DAC_VehicleInUse - [_unit]}};
						};
						_i = _i + 1;
					};
				};
		Default {};
	};
};