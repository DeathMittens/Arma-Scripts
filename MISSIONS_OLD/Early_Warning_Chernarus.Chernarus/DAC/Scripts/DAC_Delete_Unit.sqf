//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Delete_Unit       //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_TimeToDel","_DistToDel","_unit","_UnitTyp","_delpos","_waittime","_groupende","_EventList","_delOpt",
			"_GlobalDel","_DelGroup","_pos","_check","_run","_go","_explo","_markerVal","_jArray","_GroupID","_action","_dist"
		];

_unit = _this select 0;_TimeToDel = _this select 1;_DistToDel = _this select 2;_UnitTyp = _this select 3;_dist = 0;_check = 0;
_markerVal = _this select 4;_delpos = getpos _unit;_run = 0;_go = true;_jArray = [];_EventList = [];_delOpt = 0;_action = true;
_DelGroup = objNull;_groupende = 0;_GroupID = 0;if(count _this < 8) then {_DelGroup = _this select 5;_delOpt = _this select 6};
			
if(count _this > 7) then {_groupende = _this select 6;_GroupID = ((_this select 7) - 1)};

waituntil {((getdir DAC_StartDummy) > 170)};
if(isNull _unit) exitwith {};
_unit removeAllEventHandlers "hit";
sleep (random 0.2);

if((_UnitTyp == 1) && {_unit != vehicle _unit} && {((position vehicle _unit) select 2) < 5}) then {_unit setpos (position (vehicle _unit))};
if(_unit in DAC_West_Units) then {DAC_West_Units = DAC_West_Units - [_unit]};
if(_unit in DAC_East_Units) then {DAC_East_Units = DAC_East_Units - [_unit]};

if(_groupende > 0) then
{
	_EventList = [_groupende] call DAC_fConfigEvents;
	if((count ((_EventList select _GroupID) select 3)) > 0) then
	{
		call compile (((_EventList select _GroupID) select 3) select 0);
	};
	if(!(isNull _DelGroup)) then
	{
		if((count ((_EventList select _GroupID) select 2)) > 0) then
		{
			call compile (((_EventList select _GroupID) select 2) select 0);
		};
	};
};

if((_TimeToDel + _DistToDel) == 0) exitwith {};

while{_action} do
{
	if(_UnitTyp == 2) then
	{
		_check = 0;
		if(count crew _unit > 0) then {_DelGroup = group (crew _unit select 0)};
		if(isNull (gunner _unit)) then {_check = 1};
		while{_run == 0} do
		{
			if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then
			{
				_run = 4;
			}
			else
			{
				if(!(_unit iskindof "Air")) then
				{
					if(_check == 1) then
					{
						if((!(canmove _unit)) || (fuel _unit <= 0)) then
						{
							if(isEngineOn _unit) then {_unit engineOn false};
							_check = 2;
							{unassignvehicle _x} foreach crew _unit;
							sleep 3;
							if((count (crew _unit)) > 0) then
							{
								_jArray = [_DelGroup] call DAC_fFindGroup;
								if(count _jArray > 0) then
								{
									[_DelGroup,(_jArray select 0),1] spawn DAC_fRemoveGroup;
								};
							};
						};
					}
					else
					{
						if(_check == 0) then
						{
							if((!(canmove _unit)) || (!(canfire _unit)) || (fuel _unit <= 0)) then
							{
								if(isEngineOn _unit) then {_unit engineOn false};
								_check = 2;
								if(({isPlayer _x} count (crew _unit)) == 0) then
								{
									{unassignvehicle _x} foreach crew _unit;
									sleep 3;
									if((count (crew _unit)) > 0) then
									{
										_jArray = [_DelGroup] call DAC_fFindGroup;
										if(count _jArray > 0) then
										{
											[_DelGroup,(_jArray select 0),1] spawn DAC_fRemoveGroup;
										};
									};
								};
							};
						};
					};
				};
				if((getdammage _unit) == 1) then {_run = 1};
				if(({alive _x} count units _DelGroup) == 0) then {_run = 3};
				sleep (1 + random 1);
			};
		};
	}
	else
	{
		_run = 1;[_unit,0] spawn DAC_fAISpeak;[_unit,15] spawn DAC_fAIRadio;
	};

	while{_run > 0} do
	{
		switch (_run) do
		{
			case 1:	{
						if(_TimeToDel == 0) then
						{
							_run = 2;
						}
						else
						{
							_go = true;
							_waittime = daytime + (_TimeToDel / 4000);
							while{_go} do
							{
								sleep (1 + (random 1));
								if(daytime > _waittime) then {_run = 2;_go = false};
								if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
							};
						};
					};
			case 2:	{
						if(_DistToDel > 0) then
						{
							_go = true;
							while{_go} do
							{
								if(((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1))
								|| {({(((_x distance _unit) < _DistToDel) && (alive _x))} count DAC_Players) == 0}) then
								{
									_run = 4;_go = false;
								};
								sleep (1 + random 1);
							};
						}
						else
						{
							_run = 4;
						};
					};
			case 3:	{
						if(_delOpt > 0) then
						{
							_go = true;
							_waittime = daytime + (_delOpt / 4000);
							while{_go} do
							{
								sleep (1 + (random 1));
								if(daytime > _waittime) then
								{
									_unit setdammage 1;
									_run = 1;_go = false;
								}
								else
								{
									if((getdammage _unit) == 1) then
									{
										_run = 1;_go = false;
									}
									else
									{
										if(count crew _unit > 0) then
										{
											_DelGroup = group (crew _unit select 0);_run = 0;_go = false;
										}
										else
										{
											if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
										};
									};
								};
							};
						}
						else
						{
							_go = true;
							while{_go} do
							{
								sleep (1 + (random 1));
								if((getdammage _unit) == 1) then
								{
									_run = 1;_go = false;
								}
								else
								{
									if(count crew _unit > 0) then
									{
										_DelGroup = group (crew _unit select 0);_run = 0;_go = false
									}
									else
									{
										if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then {_run = 4;_go = false};
									};
								};
							};
						};
					};
			case 4:	{
						if(!(_UnitTyp == 2)) then
						{
							_run = 5;
						}
						else
						{
								sleep 1;
								waituntil{((count (crew _unit)) == 0)};_dist = round(_unit distance player);
								_UnitTyp = typeof _unit;if(_UnitTyp == "") then {_UnitTyp = "Unknown Vehicle";_dist = 0};
								if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was deleted (%2MTR)",_UnitTyp,_dist]};
								if(_unit in DAC_VehicleInUse) then {DAC_VehicleInUse set [count DAC_VehicleInUse,_unit]};
								sleep 1;
								deletevehicle _unit;
								_run = 0;_action = false;
						};
					};
			case 5:	{
						if((((getMarkerSize _markerVal) select 0) <= 4) && ((DAC_Intern select 3) == 1)) then
						{
							deletevehicle _unit;_run = 0;_action = false;
						}
						else
						{
							hideBody _unit;_dist = round(_unit distance player);
							_UnitTyp = typeof _unit;if(_UnitTyp == "") then {_UnitTyp = "Unknown Unit";_dist = 0};
							if((DAC_Com_Values select 0) > 0) then {player groupchat format["%1 was deleted (%2MTR)",_UnitTyp,_dist]};
							sleep 3;
							deletevehicle _unit;
							_run = 0;_action = false;
						};
					};
			Default {};
		};
	};
};