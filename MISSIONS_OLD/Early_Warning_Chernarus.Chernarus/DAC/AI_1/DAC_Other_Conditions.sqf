//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Other_Conditions  //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_run","_marker","_leader","_group","_target","_helo","_array","_go","_temp","_knowsabout","_para"];

_run = 1;_group = _this select 0;_leader = _this select 1;_go = 0;
_marker = _this select 2;_helo = _this select 3;_array = [];_para = _this select 4;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));_temp = DAC_StartDummy;_target = objNull;

if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 1;_run = 0};
if((_go == 0) && {({alive _x} count units _group) == 0}) then {_run = 0;_go = 1};
if((_go == 0) && {((getdammage _helo) > 0.7) || (!(canmove _helo))}) then {_run = 15;_go = 1};
if((_go == 0) && {_group in DAC_Hit_Groups}) then {_run = 10;_go = 1};

if((_go == 0) && {!(isNull(_leader findNearestEnemy (position _leader)))}) then
{
	_temp = (_leader findNearestEnemy (position _leader));
	if((alive _temp) && {(behaviour _temp) != "ERROR"}) then
	{
		if(({(alive _x) && {(_x knowsabout _temp) > _knowsabout} && {(_x distance _temp) < (call compile DAC_Alert_Dist)}} count units _group) > 0) then
		{
			if(((position (vehicle _temp)) select 2) < 5) then
			{
				_run = 10;_target = _temp;
			};
		};
	};
};

if(_run != 1) then {_array = [_run,_target]};
_array;