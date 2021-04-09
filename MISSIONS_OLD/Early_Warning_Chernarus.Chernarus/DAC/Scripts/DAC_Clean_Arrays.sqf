//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Clean_Arrays      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_s","_temp","_temparray","_man","_run","_sides","_i"];

waituntil {((getdir DAC_StartDummy) > 170)};

_temp = [];_s = 0;_temparray = [];_sides = ["East","West"];_run = 1;_i = 0;

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					_temp = [];
					{
						if((!isNull _x) && (alive _x)) then
						{
							_temp set [count _temp,_x];
						};
					}	foreach DAC_Players;
					DAC_Players = _temp;_run = 2;
				};
		case 2:	{
					while {_i < count _sides} do
					{
						{
							if((alive _x) && {str (side _x) == (_sides select _i)} && {!(_x in (call compile format["DAC_%1_Units",(_sides select _i)]))}) then
							{
								call compile format["DAC_%1_Units set [count DAC_%1_Units,_x]",(_sides select _i)];
							};
						}	foreach DAC_Players;
						sleep 0.5;
						if(DAC_Res_Side == _i) then
						{
							{
								if((alive _x) && {str (side _x) == "GUER"} && {!(_x in (call compile format["DAC_%1_Units",(_sides select _i)]))}) then
								{
									call compile format["DAC_%1_Units set [count DAC_%1_Units,_x]",(_sides select _i)];
								};
							}	foreach DAC_Players;
						};
						sleep 0.5;_i = _i + 1;
					};
					_run = 3;_i = 0;
				};
		case 3:	{
					while {_i < count _sides} do
					{
						sleep 0.1;
						_temparray = [];
						{
							if(!isNull _x) then {if((alive _x) && (!isNull (group _x))) then {_temparray set [count _temparray,_x]}};
						}	foreach (call compile format["DAC_%1_Units",(_sides select _i)]);
						call compile format["DAC_%1_Units = _temparray",(_sides select _i)];
						sleep 0.1;
						_i = _i + 1;
					};
					_run = 4;		
				};
		case 4:	{
					{
						if(isNull _x) then
						{
							DAC_Fire_Pos = DAC_Fire_Pos - [_x];
						}
						else
						{
							if(not alive _x) then {DAC_Fire_Pos = DAC_Fire_Pos - [_x]};
						};
					} 	foreach DAC_Fire_Pos;
					sleep 0.5;
					if(((count DAC_Call_Groups) == 0) && {(count DAC_Fire_Pos) != 0}) then {DAC_Fire_Pos = []};
					_run = 1;_i = 0;	
				};
		Default {};
	};
};