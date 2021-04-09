//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Some_Conditions   //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansy      //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_timestep","_array","_go","_temp","_knowsabout"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;
_marker = _this select 2;_timestep = _this select 3;_array = [];_temp = DAC_StartDummy;_target = objNull;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));

if(str(side _leader) != "CIV") then
{
	if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 1;_run = 0};
	if((_group getVariable "getout_dac") == 1) then {_go = 1;_run = 0};
	if((_go == 0) && {!alive _leader}) then {_go = 1;_run = 20};
	if((_go == 0) && {_group in DAC_Hit_Groups}) then {_go = 1;_run = 17};

	if((_go == 0) && {time > _timestep} && {!(isNull(_leader findNearestEnemy (position _leader)))}) then
	{
		_temp = (_leader findNearestEnemy (position _leader));
		if((alive _temp) && {(behaviour _temp) != "ERROR"} && {(typeof _temp) != ""}) then
		{
			if(({(alive _x) && {(_x knowsabout _temp) > _knowsabout} && {(_x distance _temp) < (call compile DAC_Alert_Dist)}} count units _group) > 0) then
			{
				if(((position (vehicle _temp)) select 2) < 5) then
				{
					_run = 13;_target = _temp;(units _group) commandTarget _target;
				};
			};
		};
	};
};

if(_run != 1) then {_array = [_run,_target]};
_array;