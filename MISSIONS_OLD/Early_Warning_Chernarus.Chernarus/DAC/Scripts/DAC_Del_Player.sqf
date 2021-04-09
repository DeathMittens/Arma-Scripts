//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Del_Player        //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_TimeToDel","_DistToDel","_UnitToDel","_DelMode","_waittime","_rArray","_w"];

_TimeToDel = _this select 0;_DistToDel = _this select 1;_UnitToDel = _this select 2;
_DelMode   = _this select 3;_w = true;

if((_TimeToDel + _DistToDel) == 0) exitwith {};

if(_DelMode != 0) then
{
	while {(alive _UnitToDel)} do
	{
		sleep (1 + (random 1));
	};
};

if(_TimeToDel > 0) then
{
	_waittime = daytime + (_TimeToDel / 4000);
	while {daytime < _waittime} do
	{
		sleep (1 + (random 1));
	};
};

if(_DistToDel > 0) then
{
	_rArray = [player];
	{
		if(!isNil "_x") then {_rArray set [count _rArray,_x]};
	}foreach DAC_Players;
	
	while {_w} do
	{
		if(({(alive _x) && {(_x distance _UnitToDel) < _DistToDel}} count _rArray) == 0) then
		{
			_w = false;
		};
		sleep (3 + (random 1));
	};
};

hideBody _UnitToDel;
sleep 5;
deletevehicle _UnitToDel;
if((DAC_Com_Values select 0) > 0) then {player sidechat format["%1 was deleted",typeof _UnitToDel]};