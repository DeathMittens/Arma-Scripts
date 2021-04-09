//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Check_Target      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_target","_group","_knowsabout"];

_group = _this select 0;_target = _this select 1;
_knowsabout = ((DAC_KnowsAbout + 2) - ((skill (leader _group) * 2) + 0.01));

if((isNull _target) || {(typeof _target) == ""}) then
{
	true;
}
else
{
	if((!alive _target) || {(getdammage _target) == 1} || {(behaviour _target) == "ERROR"}) then
	{
		true;
	}
	else
	{
		(!(({(alive _x) && {(_x knowsabout _target) > _knowsabout} && {(_x distance _target) < (call compile DAC_Alert_Dist)}} count units _group) > 0));
	};
};