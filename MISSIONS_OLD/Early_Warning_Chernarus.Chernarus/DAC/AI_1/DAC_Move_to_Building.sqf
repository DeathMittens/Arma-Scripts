//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Move_to_Building  //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_garray","_marker","_array","_i","_u","_group","_bldg","_maxP","_maxU",
			"_postyp","_val","_unit","_pos","_pid","_newpos","_posInUse","_inUse","_d"
		];

			_array = _this select 0;_garray = _this select 1;_maxU = _this select 2;
			_postyp = _this select 3;_bldg = _array select 0;_maxP = _array select 1;
			_Val = 0;_i = 0;_u = 0; _group = _garray select 0;_posInUse = [];
			_pid = 0;_inUse = true;_d = _maxP; _marker = _garray select 1;_newpos = [];

while{_val == 0} do
{
	if((_i >= count units _group) || (((getMarkerSize (_marker select 0)) select 0) <= 4)) then
	{
		_val = 1;
	}
	else
	{
		_unit = units _group select _i;
		if((!(alive _unit)) || (_unit != vehicle _unit) || (_unit == (leader _group))) then
		{
			if((_unit hasweapon "Binocular") && (_unit == (leader _group))) then {_unit selectweapon "Binocular"};
			_i = _i + 1;
		}
		else
		{
			if(_maxU <= 0) then
			{
				_newpos = [(position _bldg select 0) + random ((2 * 15) - 15),(position _bldg select 1) + random ((2 * 15) - 15),0];
				_unit commandmove _newpos;
				if(_unit hasweapon "Binocular") then {_unit selectweapon "Binocular"};
				_i = _i + 1;
			}
			else
			{
				if(_maxP <= 0) then
				{
					_newpos = [(position _bldg select 0) + random ((2 * 15) - 15),(position _bldg select 1) + random ((2 * 15) - 15),0];
					_unit commandmove _newpos;
					if(_unit hasweapon "Binocular") then {_unit selectweapon "Binocular"};
					_i = _i + 1;
				}
				else
				{
					if(_postyp == 0) then
					{
						while {_inUse} do
						{
							_pid = round (random _d);
							if(!(_pid in _posInUse)) then
							{
								_newpos = (_bldg buildingpos _pid);
								_posInUse set [count _posInUse,_pid];
								_inUse = false;
							};
							sleep 0.1;
							if(count _posInUse == _d) then {_inUse = false};
						};
					}
					else
					{
						_newpos = (_bldg buildingpos _maxP);
					};
					_unit commandmove _newpos;
					_maxP = _maxP - 1;_i = _i + 1;
					_maxU = _maxU - 1;_inUse = true;
					sleep 0.1;
				};
			};
		};
	};
};