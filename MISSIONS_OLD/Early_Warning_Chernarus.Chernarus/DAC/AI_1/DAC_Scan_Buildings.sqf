//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.0 - 2007    //
//--------------------------//
//    DAC_Scan_Buildings    //
//--------------------------//
//    Script by Silola      //
//    silola@mapfact.net    //
//////////////////////////////

private [
			"_i","_leader","_buildings","_positions",
			"_radius","_myList","_b","_g","_t"
		];

			_leader = _this select 0;_radius = _this select 1;
			_buildings = [];_i = 0;_positions = [];_countP = _this select 2;
			_myList = nearestObjects [Position _leader, [], _radius];

{
	if((canmove _x) && {(behaviour _x) == "ERROR"}) then 
	{
		if(!(_x in DAC_Buildg_InUse)) then
		{
			if((((position _x) select 2) > -0.48) && (((boundingBox _x select 1) select 1) < 10)) then
			{
				_buildings set [count _buildings,_x];
				DAC_Buildg_InUse set [count DAC_Buildg_InUse,_x];
			};
		};
	};
}	foreach _myList;
			
while {_i < count _buildings} do
{
	_b = _buildings select _i;
	
	if((((_b buildingpos 1) select 0) == 0) || {(typeof _b) in DAC_BadBuildings}) then
	{
		_i = _i + 1;
	}
	else
	{
		_g = 1;
		while{(((_b buildingpos _g) select 0) > 0)} do {_g = _g + 1};
		_t = time;
		if((_g - 1) >= _countP) then {_positions set [count _positions,[_b,_g - 1,_t]]};
		_i = _i + 1;
	};
};
_positions