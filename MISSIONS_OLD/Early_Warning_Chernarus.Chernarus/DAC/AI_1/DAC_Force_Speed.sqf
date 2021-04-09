//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Force_Speed       //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_group"];

_group = _this select 0;

if(({(vehicle _x) != _x} count (units _group)) > 0) then
{
	switch (speedmode _group) do
	{
		case "LIMITED":	{
							{
								if((vehicle _x)!= _x) then
								{
									if((vehicle _x) != (vehicle (leader _group))) then {(vehicle _x forcespeed 1.5)};
								};
							}	foreach units _group;
						};
		case "NORMAL":	{
							{
								if((vehicle _x)!= _x) then
								{
									if((vehicle _x) != (vehicle (leader _group))) then {(vehicle _x forcespeed 3.5)};
								};
							}	foreach units _group;
						};
		case "FULL":	{
							{
								if((vehicle _x)!= _x) then
								{
									if((vehicle _x) != (vehicle (leader _group))) then {(vehicle _x forcespeed 5.5)};
								};
							}	foreach units _group;
						};
		default {};
	};
};