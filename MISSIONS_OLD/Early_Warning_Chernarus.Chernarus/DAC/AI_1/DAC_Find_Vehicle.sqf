//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Find_Vehicle      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_i","_entry1","_entry2","_array","_temp1","_temp2","_temp3","_group","_emptVeh",
			"_emptGun","_proVeh","_proGun","_curV","_curG"
		];

			_group = _this select 0;_emptVeh = _this select 1;_emptGun = _this select 2;_i = 0;
			_proVeh = _this select 3;_proGun = _this select 4;_curV = _this select 5;_curG = _this select 6;
			_temp1 = DAC_VehicleForUse;_temp3 = [];_temp2 = DAC_VehAllowed;
			_entry1 = objNull;_entry2 = objNull;_array = [objNull,objNull,_curV,_curG];
			
if((count _temp2 > 0) && (_proVeh > 0)) then
{
	while {_i < count _temp1} do
	{
		_entry1 = _temp1 select _i;
		if((((leader _group) distance _entry1) < _emptVeh) && {(typeof _entry1) in _temp2}) then
		{
			if((locked _entry1) in [0,1] && {!((typeof _entry1) in DAC_GunAllowed)}) then
			{
				if(isNull _curV) then
				{
					_array set [2,_entry1];_i = count _temp1;
					if((random 100) <= _proVeh) then
					{
						if(!(_entry1 in DAC_VehicleInUse)) then {_array set [0,_entry1]};
					};
				}
				else
				{
					if(_entry1 != _curV) then
					{
						_array set [2,_entry1];_i = count _temp1;
						if((random 100) <= _proVeh) then
						{
							if(!(_entry1 in DAC_VehicleInUse)) then {_array set [0,_entry1]};
						};
					};
				};
			};
		};
		_i = _i + 1;
	};
};
_i = 0;_temp3 = nearestObjects [(leader _group), DAC_GunAllowed, _emptGun];
if((count _temp3 > 0) && (_proGun > 0)) then
{
	while {_i < count _temp3} do
	{
		_entry2 = _temp3 select _i;
		if(((getdammage _entry2) < 1) && {!(_entry2 in DAC_Static)}) then
		{
			if((_entry2 emptyPositions "Gunner") > 0) then
			{
				if(isNull _curG) then
				{
					_array set [3,_entry2];_i = count _temp3;
					if((random 100) <= _proGun) then
					{
						_array set [1,_entry2];
					};
				}
				else
				{
					if(_entry2 != _curG) then
					{
						_array set [3,_entry2];_i = count _temp3;
						if((random 100) <= _proGun) then
						{
							_array set [1,_entry2];
						};
					};
				};
			};
		};
		_i = _i + 1;
	};
};
_array;