//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.2 - 2013   //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust      //
//////////////////////////////

private ["_sum","_scr","_vD","_fg"];

_scr = [] spawn (compile preprocessFileLineNumbers "DAC\Scripts\DAC_Preprocess.sqf");
waituntil {scriptdone _scr};
if(DAC_Activate_Sound) then {[] spawn DAC_fConfigSound};
DAC_StartDummy = "logic" createvehiclelocal [0,0,0];DAC_StartDummy setdir 100;DAC_InitText = "";
if(DAC_Code < 2) then {DAC_Init_Counter = [2,2,2,2,2]};
if(DAC_Code == 3) then {DAC_Basic_Value = 1};
DAC_Dyn_Weather = DAC_Dyn_Weather + [DAC_Code];

if(isNil "DAC_Basic_Value") then {DAC_Basic_Value = 0};
if(isNil "DAC_Obj_Init") then {DAC_Obj_Init = []};

if(!isNil "DAC_Support_Logic") then
{
	DAC_Support_Logic setVariable ["arti_error", -1, true];
	DAC_Support_Logic setVariable ["arti_count", 0, true];
	DAC_Support_Logic setVariable ["support_error", -1, true];
	DAC_Support_Logic setVariable ["support_count", 0, true];
	DAC_Support_Logic setVariable ["support_groups", [], true];
	DAC_Support_Logic setVariable ["support_caller", [], true];
};

//[Einteilung,Zeitinterval,Füllwert,Leerwert,[HalteZeit_E,Modus_E],[HalteZeit_F,Modus_F],SectorHint];
if(isNil "DAC_Sector_Values") then {DAC_Sector_Values = [500,0.5,1,0.5,[5,0,""],[5,1,""],false]};

DAC_Marker_Val = [DAC_Marker] call DAC_fConfigMarker;
if(DAC_Fast_Init) then {if(isServer && (local player)) then {_vD = ViewDistance;_fg = fog;0 setFog 1;setViewDistance 5}};
if(isNil "DAC_GetPlayers") then {
	DAC_GetPlayers = { 
		private["_players"];
		if (isMultiplayer) then {
			_players = [];
			{if (isPlayer _x) then {_players set [count _players, _x];};}forEach playableUnits;
		}
		else {
			_players = [player];
		};
		_players;
	};
};
	
	
if(DAC_Code < 2) then
{
	[] execVM "DAC\Scripts\DAC_Init_Creator.sqf";
	if((count DAC_VehAllowed) > 0) then {[] execVM "DAC\Scripts\DAC_Vehicle_check.sqf"};
	DAC_Dyn_Weather execVM "DAC\Scripts\DAC_Dyn_Weather.sqf";if(DAC_Direct_Start) then {DAC_Basic_Value = 1};
	waituntil {(DAC_Basic_Value > 0)};
	waituntil {(count DAC_Obj_Init == 0)};
	if(DAC_Basic_Value > 1) then
	{
		if(DAC_Basic_Value != 10) then
		{
			hintc format["Attention, DAC has caused an Error.\nThe initialization has missed.\n\nError number: %1\n\n2 = Script call\n3 = DAC_Players\n4 = Unit_Config\n5 = Arti_Config\n6 = DAC_Marker\n7 = Waypoints\n8 = Zonename\n9 = wrong AI-Addon\n10 = Create objects",DAC_Basic_Value];
			if(time > 0) exitwith {};
		};
	}
	else
	{
		[] execVM "DAC\Scripts\DAC_Server_check.sqf";
		if(local player) then {[] spawn DAC_fClientCheck};
		if(DAC_Player_Marker) then {if(local player) then {[player] execVM "DAC\Marker\DAC_PlayerMarker.sqf"}};
		if((local player) && (DAC_Join_Action)) then {[] execVM "DAC\AI_1\DAC_Check_Action.sqf"};
		if(DAC_Marker > 0) then
		{
			if(DAC_Marker_Val select 3 > 0) then
			{
				if(local player) then {[player,1,(group player)] execVM "DAC\Marker\DAC_GroupMarker.sqf"};
			}
			else
			{
				if(local player) then {[]execVM "DAC\Marker\DAC_InitMarker.sqf"};
			};
		};
	};
}
else
{
	if((DAC_Com_Values select 1) > 0) then
	{
		_text1 = "<t color='#FFFF66' size='0.8' shadow='1' shadowColor='#333333' align='left'>DAC V3.0c</t>";
		_text2 = "<t color='#CCCCCC' size='0.7' shadow='1' shadowColor='#666666' align='left'>  is initialized ...</t><br/>";
		_text3 = (_text1 + _text2);
		hintSilent parseText _text3;
	};
	DAC_Dyn_Weather execVM "DAC\Scripts\DAC_Dyn_Weather.sqf";
	if(DAC_Player_Marker) then {if(local player) then {[player] execVM "DAC\Marker\DAC_PlayerMarker.sqf"}};
	_sum = time;
	sleep 3;
	if(DAC_Code == 3) then
	{
		//if((DAC_Com_Values select 1) > 0) then {hintSilent format["This is a DAC Mission.\n\nGood luck soldier."]};
		if((!isNil "DAC_SayArrayE" && {count DAC_SayArrayE > 0}) || {!isNil "DAC_SayArrayW" && {count DAC_SayArrayW > 0}}) then {[] spawn DAC_fClientSpeak};
		if(DAC_Marker > 0) then
		{
			if(DAC_Marker_Val select 3 > 0) then
			{
				if(local player) then {[player,1,(group player)] execVM "DAC\Marker\DAC_GroupMarker.sqf"};
			}
			else
			{
				if(local player) then {[]execVM "DAC\Marker\DAC_InitMarker.sqf"};
			};
		};
		[] spawn DAC_fClientCheck;
		[] spawn DAC_fClientRadio;
		if(DAC_Join_Action) then {[] execVM "DAC\AI_1\DAC_Check_Action.sqf"};
	}
	else
	{
		waituntil {(DAC_Basic_Value > 0)};
		if(DAC_Basic_Value > 1) then
		{
			hintc format["Attention, DAC has caused an Error.\nThe initialization has missed.\n\nError number: %1\n\n2 = Script call\n3 = DAC_Players\n4 = Unit_Config\n5 = Arti_Config\n6 = DAC_Marker\n7 = Waypoints\n8 = Zonename\n9 = wrong AI-Addon\n10 = Create objects",DAC_Basic_Value];
			if(time > 0) exitwith {};
		}
		else
		{
			_sum = time - _sum;
			if((DAC_Com_Values select 1) > 0) then
			{
				_text1 = "<t color='#FFFF66' size='0.8' shadow='1' shadowColor='#333333' align='left'>DAC V3.0c init successfully.</t>";
				_text2 = "<t color='#CCCCCC' size='0.8' shadow='1' shadowColor='#333333' font='Zeppelin32'><br/>";
				_hint = (_text1 + _text2 + format["Required time: %1 sec.",_sum]);
				hintSilent parseText _hint;
			};
			if((!isNil "DAC_SayArrayE" && {count DAC_SayArrayE > 0}) || {!isNil "DAC_SayArrayW" && {count DAC_SayArrayW > 0}}) then {[] spawn DAC_fClientSpeak};
			if(DAC_Marker > 0) then
			{
				if(DAC_Marker_Val select 3 > 0) then
				{
					if(local player) then {[player,1,(group player)] execVM "DAC\Marker\DAC_GroupMarker.sqf"};
				}
				else
				{
					if(local player) then {[]execVM "DAC\Marker\DAC_InitMarker.sqf"};
				};
			};
			[] spawn DAC_fClientCheck;
			[] spawn DAC_fClientRadio;
		};
	};
};
if(DAC_Fast_Init) then {if(isServer && (local player)) then {setViewDistance _vD;0.5 setFog _fg}};