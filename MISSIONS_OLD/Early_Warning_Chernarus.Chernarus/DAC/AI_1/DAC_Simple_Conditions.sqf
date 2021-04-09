//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Some_Conditions   //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_timestep","_array","_go","_temp","_knowsabout"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;
_timestep = _this select 2;_array = [];_temp = DAC_StartDummy;_target = objNull;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));

if((!alive _leader) && (_go == 0)) then {_go = 1;_run = 9};
if((_go == 0) && {_group in DAC_Hit_Groups}) then {_go = 1;_run = 6};

if((_go == 0) && {time > _timestep} && {!(isNull(_leader findNearestEnemy (position _leader)))}) then
{
	_temp = (_leader findNearestEnemy (position _leader));
	if((alive _temp) && {(behaviour _temp) != "ERROR"} && {(typeof _temp) != ""}) then
	{
		if(({(alive _x) && {(_x knowsabout _temp) > _knowsabout} && {(_x distance _temp) < (call compile DAC_Alert_Dist)}} count units _group) > 0) then
		{
			if(((position (vehicle _temp)) select 2) < 5) then
			{
				_run = 3;_target = _temp;(units _group) commandTarget _target;
			};
		};
	};
};

if(_run != 1) then {_array = [_run,_target]};
_array;