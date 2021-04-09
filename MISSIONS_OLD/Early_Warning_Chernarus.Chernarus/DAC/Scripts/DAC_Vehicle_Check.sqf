//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Vehicle_Check     //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_UnitList","_i","_l","_entry","_c","_TempList","_TempArray"];

_i = 0;_entry = DAC_StartDummy;_c = 0;_UnitList = [];_l = 0;
_TempList = [];_TempArray = DAC_VehAllowed;DAC_VehAllowed = [];

waituntil {((getdir DAC_StartDummy) > 170)};

while {_l < count _TempArray} do
{
	_entry = _TempArray select _l;
	_TempList = [_entry] call DAC_fConfigUnits;
	sleep 0.1;
	if(count _TempList > 0) then
	{
		{if(!(_x in DAC_VehAllowed)) then {DAC_VehAllowed set [count DAC_VehAllowed,_x]}} foreach _TempList;
	};
	_l = _l + 1;
};

//if((DAC_Com_Values select 0) > 0) then {player groupchat format["DAC determined %1 occupyable vehicle types",count DAC_VehAllowed]};

while {time > 0} do
{
	sleep 1;
	_c = count DAC_VehicleInUse;
	while {_i < count DAC_VehicleInUse} do
	{
		if(_c != count DAC_VehicleInUse) then
		{
			_c = count DAC_VehicleInUse;
			_i = 0;
		}
		else
		{
			_entry = DAC_VehicleInUse select _i;
			if((isNil "_entry")
			|| {!(canmove _entry)}
			|| {(getdammage _entry) == 1}) then
			{
				DAC_VehicleInUse = DAC_VehicleInUse - [_entry];
			}
			else
			{
				_i = _i + 1;
				sleep 0.01;
			};
		};
	};
	_c = count DAC_VehicleForUse;_i = 0;
	sleep 1;
	while {_i < count DAC_VehicleForUse} do
	{
		if(_c != count DAC_VehicleForUse) then
		{
			_c = count DAC_VehicleForUse;_i = 0;
			sleep 0.1;
		}
		else
		{
			_entry = DAC_VehicleForUse select _i;
			if((isNil "_entry")
			|| {!(canmove _entry)}
			|| {(getdammage _entry) == 1}
			|| {(count crew _entry) > 0}) then
			{
				DAC_VehicleForUse = DAC_VehicleForUse - [_entry];
			}
			else
			{
				_i = _i + 1;
				sleep 0.01;
			};
		};
	};
	_UnitList = List DAC_Trigger;_i = 0;
	sleep 1;
	while {_i < count _UnitList} do
	{
		_entry = _UnitList select _i;
		if((_entry in DAC_VehicleForUse)
		|| (_entry in DAC_VehicleInUse)
		|| ((getdammage _entry) == 1)) then
		{
			_i = _i + 1;
			sleep 0.01;
		}
		else
		{
			if((_entry emptyPositions "Driver") > 0) then
			{
				if((count (crew _entry)) == 0) then
				{
					DAC_VehicleForUse set [count DAC_VehicleForUse,_entry];
				}
				else
				{
					 if(({alive _x} count (crew _entry)) == 0) then
					 {
						DAC_VehicleForUse set [count DAC_VehicleForUse,_entry];
					 };
				};
			}
			else
			{
				switch(format["%1",side _entry]) do 
				{
					case "WEST":	{if(!(_entry in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_entry]}};
					case "EAST":	{if(!(_entry in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_entry]}};
					case "GUER":	{
										if(DAC_Res_Side == 0) then
										{
											if(!(_entry in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_entry]};
										}
										else
										{
											if(!(_entry in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_entry]};
										};
									};
					default			{};
				};
			};
			_i = _i + 1;
			sleep 0.01;
		};
	};
};