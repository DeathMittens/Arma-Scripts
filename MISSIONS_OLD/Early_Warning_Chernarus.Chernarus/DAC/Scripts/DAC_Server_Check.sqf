//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Server_Check      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private ["_val0","_val1","_val2","_val3","_val4","_val5","_pa"];

//_val0 = [];_val1 = objNull;_val2 = [];_val3 = 0;_val4 = 0;_val5 = objNull;

waituntil {DAC_Basic_Value == 1};
sleep 3;

DAC_Zone_Values = 0;
publicvariable "DAC_Zone_Values";
sleep 1;

while{time > 0} do
{
	_pa = call DAC_GetPlayers;
	{
		if (!isNil "_x") then {
			if(!(_x in DAC_Players)) then
			{
				DAC_Players = _pa;
			};
			switch (str(side _x)) do
			{
				case "WEST":{if(!(_x in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_x]}};
				case "EAST":{if(!(_x in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_x]}};
				case "GUER":{
								if(DAC_Res_Side == 0) then
								{
									if(!(_x in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,_x]}
								}
								else
								{
									if(!(_x in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,_x]}
								};
							};
				Default {};
			};
		};
	}foreach _pa;
	sleep 1;
	if(format["%1",DAC_Player_Arti] != "") then
	{
		_val0 = call compile format["%1",DAC_Player_Arti];
		_val1 = _val0 select 0;_val2 = _val0 select 1;_val3 = _val0 select 2;_val4 = _val0 select 3;
		[_val1,_val2,_val3,_val4] spawn DAC_fCallArti;
		if(!(local player)) then {_val5 = _val0 select 4; [7,_val5] spawn DAC_fAIRadio;};
		DAC_Player_Arti = "";
	};
	if(format["%1",DAC_Player_SupGroup] != "") then
	{
		_val0 = call compile DAC_Player_SupGroup;
		_val1 = _val0 select 0;_val2 = (group _val1);_val3 = _val0 select 1;
		DAC_Hit_Groups set [count DAC_Hit_Groups,_val2];
		_val2 setVariable ["support_pos", _val3, true];
		[_val1,_val2,_val3] spawn DAC_fCallHelp;
		DAC_Player_SupGroup = "";
	};
};