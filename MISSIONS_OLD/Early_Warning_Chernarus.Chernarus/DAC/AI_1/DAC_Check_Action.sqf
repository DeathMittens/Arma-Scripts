//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Check_Action      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_newUnits","_joinID"];

while{alive player} do
{
	sleep 0.5;
	_newUnits = nearestObjects [(position player),["Car","Tank","CAManBase"],8];
	_newUnits = _newUnits - DAC_Players;
	if(count _newUnits > 0) then
	{
		{
			if((alive ((crew _x) select 0))
			&& {(group ((crew _x) select 0)) != (group player)}
			&& {(side ((crew _x) select 0)) == (side player)}
			&& {!(_x in DAC_Join_Array)}) then
			{
				_joinID = _x addaction [format["%1 join %2",name ((crew _x) select 0),name player],"DAC\AI_1\DAC_Join_Player.sqf",[]];
				DAC_Join_Array set [count DAC_Join_Array,_x];
			};
		}	foreach _newUnits;
	};
};