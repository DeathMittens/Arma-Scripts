//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Check_Target      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_target","_group","_newtarget","_unit"];

_group = _this select 0;_target = _this select 1;_newtarget = _target;_unit = objNull;

if([_group,_target] call DAC_fCheckTarget) then
{
	_unit = [(leader _group),_group,_target] call DAC_fEnemyCond;
	if((_unit == _target) || {isNull _unit} || {(typeof _unit) == ""}) then
	{
		if(_unit == _target) then
		{
			_newtarget = _target;
			if(count _this == 2) then {[_group, 3] setWaypointPosition [position _newtarget, 0];[_group, 1] setWaypointPosition [[20,(((leader _group) knowsabout _newtarget) * 5)], 0]};
		}
		else
		{
			_newtarget = objNull;
		};
	}
	else
	{
		_newtarget = _unit;(units _group) commandTarget _newtarget;
		if(count _this == 2) then {[_group, 3] setWaypointPosition [position _newtarget, 0];[_group, 1] setWaypointPosition [[20,(((leader _group) knowsabout _newtarget) * 5)], 0]};
	};
}
else
{
	_unit = [(leader _group),_group,_target,0] call DAC_fEnemyCond;
	if((_unit != _target) && {!(isNull _unit)} && {(typeof _unit) != ""}) then
	{
		_newtarget = _unit;(units _group) commandTarget _newtarget;
		if(count _this == 2) then {[_group, 3] setWaypointPosition [position _newtarget, 0];[_group, 1] setWaypointPosition [[20,(((leader _group) knowsabout _newtarget) * 5)], 0]};
	}
	else
	{
		if(_unit == _target) then
		{
			_newtarget = _target;
			if(count _this == 2) then {[_group, 3] setWaypointPosition [position _newtarget, 0];[_group, 1] setWaypointPosition [[20,(((leader _group) knowsabout _newtarget) * 5)], 0]};
		}
		else
		{
			_newtarget = objNull;
		};
	};
};
_newtarget