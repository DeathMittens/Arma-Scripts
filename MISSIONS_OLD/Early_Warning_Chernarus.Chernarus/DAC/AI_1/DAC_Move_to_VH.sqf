//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Move_to_VH        //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_garray","_group","_wparray","_groupid","_maxrad","_zskill","_leader","_target","_groupvehicle","_posarray","_numarray",
			"_timestep","_nextwp","_firstwait","_checktime","_call","_startid","_groupmode","_jArray","_eventid","_oldskill","_allZones",
			"_checkpos","_wait","_rndnr","_wpstart2","_mpos","_checkpos1","_checkpos2","_waittime","_rdir","_EventList","_wpCheck",
			"_knowsabout","_speedselect","_combatselect","_behavselect","_formselect","_unitcombat","_unitbehav","_coverval",
			"_unitspeed","_unitform","_unitwait","_searcharea","_searchtime","_endtime","_maxweather","_heloarray","_hpos",
			"_marker","_DAC_Arrays","_callg","_run","_go","_newtarget","_sum","_id","_wx","_wy","_grouponfire","_exgroup"
		];
		
			_garray = _this select 0;_group = _garray select 0;_marker = _garray select 1;_posarray = _this select 1;_wparray = (_posarray select 0);_numarray = (_posarray select 1);
			_callg = [];_groupid = _this select 2;_maxrad = _this select 3;_exgroup = _this select 4;_startid = _this select 5;_wait = 0;_rdir = 0;_allZones = (_posarray select 2);
			_leader = leader _group;_target = objNull;_firstwait = 0;_endtime = 0;_wx = 0;_wy = 0;_maxweather = 0;_eventid = _garray select 2;
			_groupvehicle = objNull;_groupmode = _group;_heloarray = [];_mpos = position _leader;_searcharea = 0;_call = [];_jArray = [];_hpos = [];
			_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_run = 1;_go = 1;_searchtime = 0;_waittime = 0;_wpCheck = [];
			_oldskill = ((getMarkerPos (_marker select 2)) select 1);_EventList = [];_coverval = 0;_sum = 0;_grouponfire = _group;_group lockWP true;
			_DAC_Arrays = ["DAC_Help_Groups","DAC_Hit_Groups","DAC_Fire_Groups","DAC_Radio_Groups","DAC_Cover_Groups","DAC_Call_Groups"];
			
while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					//-----------------------------
					//#waitforstart
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case1",time]]};
					sleep 5;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(count _exgroup > 0) then
						{
							if(isNil {_exgroup select 0}) then
							{
								waituntil {((getdir DAC_StartDummy) > 170)};
								if(_eventid > 0) then {_EventList = ((([_eventid] call DAC_fConfigEvents) select 5) select 1)};
								_run = 12;
							}
							else
							{
								_groupvehicle = _exgroup select 0;_groupmode = _exgroup select 1;_heloarray = _exgroup select 2;
								waituntil {((getdir DAC_StartDummy) > 170) && {!(_leader in _groupvehicle)}};
								if(_eventid > 0) then {_EventList = ((([_eventid] call DAC_fConfigEvents) select 5) select 1)};
								if(((getwppos[_group,3]) select 0) == 100) then
								{
									waituntil{DAC_NewZone == 0};
									sleep (random 1);
									_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
									_sum = (_wpCheck select 1);_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
									_wparray = ((_wpCheck select 0) select 0);
									[_group, 3] setWaypointPosition [position _leader, 0];
									if(((((_zskill select 7) select 5) select 0) + (((_zskill select 7) select 5) select 1)) == 0) then
									{
										_firstwait = 1;
									}
									else
									{
										_firstwait = ((((_zskill select 7) select 5) select 0) + random (((_zskill select 7) select 5) select 1));
									};
								}
								else
								{
									waituntil{DAC_NewZone == 0};
									_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
									_sum = (_wpCheck select 1);_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
									_wparray = ((_wpCheck select 0) select 0);_firstwait = 0.1;
								};
								if(count _wparray == 0) then
								{
									_run = 0;
								}
								else
								{
									if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
									sleep _firstwait;
								};
								_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
								_unitform = _zskill select 4;_maxweather = ((_zskill select 6) select 2);_coverval = ((_zskill select 5) select 1);
								_unitwait = "(((_zskill select 7) select (_groupid - 3)) select 3)";
								{call compile format["if(_group in %1) then {%1 = %1 - [_group]}",_x]}foreach _DAC_Arrays;_run = 2;
							};
						}
						else
						{
							waituntil {((getdir DAC_StartDummy) > 170)};
							if(_eventid > 0) then {_EventList = ((([_eventid] call DAC_fConfigEvents) select 5) select 1)};
							_run = 12;
						};
					};
				};
		case 2:	{
					//-----------------------------
					//#setbehaviour
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case2",time]]};
					_knowsabout = ((DAC_KnowsAbout + 2) - ((skill _leader * 2) + 0.01));_run = 3;
					_speedselect = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
					_behavselect = (random ((count _unitbehav) - 1));_formselect = (random ((count _unitform) - 1));
					_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
					_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
					if(((getwppos[_groupmode, 2]) select 0) > 95) then {_run = 13};
					{_x setunitpos "auto"} foreach units _group;
				};
		case 3:	{
					//-----------------------------
					//#patrol
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case3",time]]};
					_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
					if(_go >= 0) then
					{
						_searcharea = call compile ((_zskill select 9) select 0);_searchtime = call compile ((_zskill select 9) select 1);
						[_group, 2] setWaypointPosition [position _groupvehicle, 0];
						[_group, 1] setWaypointPosition [[70,_searcharea], 0];
						_endtime = time + _searchtime;_wx = getpos _groupvehicle select 0;_wy = getpos _groupvehicle select 1;_go = 1;
					}
					else
					{
						_go = 1;
					};
					while {_go > 0} do
					{
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - patrol",time]]};
						_rdir = random 360;_mpos = [((_wx) + (Sin _rdir * (_searcharea - 5))),((_wy) + (Cos _rdir * (_searcharea - 5))),0];
						if(surfaceIsWater _mpos) then {sleep 0.01} else	{_go = 0;_run = 4};
					};
				};
		case 4:	{
					//-----------------------------
					//#move
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case4",time]]};
					[_group, 3] setWaypointPosition [_mpos, 0];
					_group move _mpos;_go = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 0.5));
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - move",time]]};
						_call = [_group,_leader,_marker,_groupvehicle,_groupmode] call DAC_fHeliConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							if(time > _endtime) then
							{
								_go = 0;_run = 6;
							}
							else
							{
								waituntil{DAC_NewZone == 0};
								_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
								_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
								_wparray = ((_wpCheck select 0) select 0);
								if(_sum != (_wpCheck select 1)) then
								{
									_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
									[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
								};
								if(_group in DAC_Cover_Groups) then {_go = 0;_run = 6};
								if((unitready _leader) && (_go > 0)) then
								{
									_go = 0;_run = 5;
								};
							};
						};
					};
				};
		case 5:	{
					//-----------------------------
					//#waiting
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case5",time]]};
					if((count _EventList) > 0) then {call compile (_EventList select 0)};
					_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;
					{_x setunitpos "middle"} foreach units _group;
					_wait = time + random (call compile _unitwait);_go = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 0.5));
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - waiting",time]]};
						_call = [_group,_leader,_marker,_groupvehicle] call DAC_fHeliConditions;
						if((count _call) > 0) then
						{
							_run = (_call select 0);_target = (_call select 1);
							_go = 0;
						}
						else
						{
							waituntil{DAC_NewZone == 0};
							_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
							_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
							_wparray = ((_wpCheck select 0) select 0);
							if(_sum != (_wpCheck select 1)) then
							{
								_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
								[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
								_go = 0;_run = 6;
							};
							if(_group in DAC_Cover_Groups) then {_go = 0;_run = 6};
							if((time > _wait) && (_go > 0)) then
							{
								if(_oldskill != ((getMarkerPos (_marker select 2)) select 1)) then
								{
									_zskill = [((getMarkerPos (_marker select 2)) select 1)] call DAC_fConfigBehav;_oldskill = ((getMarkerPos (_marker select 2)) select 1);
									if(((_zskill select 11) select 0) == 0) then {if(!(_group in DAC_No_Support)) then {DAC_No_Support set [count DAC_No_Support,_group]}};
									_unitcombat = _zskill select 1;_unitbehav = _zskill select 2;_unitspeed = _zskill select 3;
									_unitform = _zskill select 4;_maxweather = ((_zskill select 6) select 2);
									_unitwait = "(((_zskill select 7) select (_groupid - 3)) select 3)";
									_speedselect = (random ((count _unitspeed) - 1));_combatselect = (random ((count _unitcombat) - 1));
									_behavselect = (random ((count _unitbehav) - 1));_formselect = (random ((count _unitform) - 1));
									_group setcombatmode (_unitcombat select _combatselect);_group setbehaviour (_unitbehav select _behavselect);
									_group setspeedmode (_unitspeed select _speedselect);_group setformation (_unitform select _formselect);
								};
								_go = -1;_run = 2;
							};
						};
					};					
				};
		case 6:	{
					//-----------------------------
					//#getinveh
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case6",time]]};
					if(overcast > _maxweather) then
					{
						if(_group in DAC_Cover_Groups) then {DAC_Cover_Groups = DAC_Cover_Groups - [_group]};
						_go = 0;_run = 3;
					}
					else
					{
						if(_group in DAC_Cover_Groups) then
						{
							[21,_groupid,_group,"P",(leader _group) distance player] spawn DAC_fShowRadio;_group setcombatmode "red";_group setbehaviour "aware";_group setspeedmode "full";
						};
						_hpos = call compile (_wparray select 0);
						_hpos = [(_hpos select 0),((_hpos select 1) + 15),0];
						_mpos = (_groupvehicle modelToWorld [0,15,0]);
						[_group, 3] setWaypointPosition [_mpos, 0];[_group, 1] setWaypointPosition [[60,0], 0];
						_group move _mpos;_go = 1;
						while {_go > 0} do
						{
							sleep (1 + (random 0.5));
							if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - getin1",time]]};
							_call = [_group,_leader,_marker,_groupvehicle] call DAC_fHeliConditions;
							if((count _call) > 0) then
							{
								_run = (_call select 0);_target = (_call select 1);
								_go = 0;
							}
							else
							{
								if(unitready _leader) then
								{
									{_x assignascargo _groupvehicle;[_x] ordergetin true;[_x] allowgetin true} foreach units _group;_go = 2;
									[_group, 3] setWaypointPosition [(position _groupvehicle), 0];[_group, 1] setWaypointPosition [[60,0], 0];
									while {_go == 2} do
									{
										sleep (1 + (random 0.5));
										if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - getin2",time]]};
										_call = [_group,_leader,_marker,_groupvehicle] call DAC_fHeliConditions;
										if((count _call) > 0) then
										{
											_run = (_call select 0);_target = (_call select 1);
											_go = 0;
										}
										else
										{
											if(({_x in _groupvehicle} count units _group) == count units _group) then
											{
												[_groupmode, 2] setWaypointPosition [[20,0], 0];_go = -1;
												[_group, 3] setWaypointPosition [_hpos, 0];
											}
											else
											{
												if((speed (leader _group)) < 1) then
												{
													_mpos = (_groupvehicle modelToWorld [20,0,0]);
													[_group, 3] setWaypointPosition [_mpos, 0];[_group, 1] setWaypointPosition [[60,0], 0];
													_group move _mpos;
													sleep 1;
													{_x assignascargo _groupvehicle;[_x] ordergetin true;[_x] allowgetin true} foreach units _group;
												};
											};
										};
									};
								};
							};
						};
						if(_go < 0) then
						{
							_go = 1;
							sleep 1;
							while {_go > 0} do
							{
								sleep (1 + (random 0.5));
								if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - getin4",time]]};
								_call = [_group,_leader,_marker,_groupvehicle] call DAC_fHeliConditions;
								if((count _call) > 0) then
								{
									_run = (_call select 0);_target = (_call select 1);
									_go = 0;
								}
								else
								{
									waituntil{DAC_NewZone == 0};
									_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
									_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
									_wparray = ((_wpCheck select 0) select 0);
									if(_sum != (_wpCheck select 1)) then
									{
										_sum = (_wpCheck select 1);_numarray = _wparray call DAC_fWritePosition;
										[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
										_hpos = call compile (_wparray select 0);
										_hpos = [(_hpos select 0),((_hpos select 1) + 15),0];
										[_group, 3] setWaypointPosition [_hpos, 0];
									};
									if(!(leader _group in _groupvehicle)) then
									{
										if(_group in DAC_Fire_Groups) then
										{
											_go = 0;_run = 0;
										}
										else
										{
											if(_group in DAC_Cover_Groups) then
											{
												_callg = [];_grouponfire = _group;
												{if(side (leader _x ) == side leader _group) then {_callg set [count _callg,_x]}} foreach DAC_Call_Groups;
												if((count _callg) == 0) then
												{
													DAC_Cover_Groups = DAC_Cover_Groups - [_group];
													{_x setunitpos "auto"} foreach units _group;
													_go = 0;_run = 3;
												}
												else
												{
													_grouponfire = _callg select (random ((count _callg) - 1));
													[_garray,_grouponfire,_wparray,_groupid,_maxrad,_zskill,_exgroup] spawn DAC_fMoveToFriendly;
													_go = 0;_run = 0;
												};
											}
											else
											{
												_go = 0;_run = 3;
											};
										};
									};
								};
							};
						};
					};
				};
		case 7:	{
					//-----------------------------
					//#groupchangemove
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case7",time]]};
					[_leader,2] spawn DAC_fAISpeak;[_group,1,1] spawn DAC_fLeaveVehicle;
					if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
					[_group,_target] spawn DAC_fSetBehaviour;
					if(!(_group in DAC_Radio_Groups)) then {[17,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
					if((_target distance _leader) < ((call compile DAC_Alert_Dist) / 2)) then {{_x setunitpos "down"} foreach units _group} else {{_x setunitpos "auto"} foreach units _group};
					_waittime = time + call compile ((_zskill select 15) select 0);_run = 8;
					[_group, 3] setWaypointPosition [position _target, 0];[_group, 1] setWaypointPosition [[20,((_leader knowsabout _target) * 5)], 0];
					{_x leaveVehicle _groupvehicle} foreach units _group;
					//if(_coverval > 0) then {[_group,_coverval] spawn DAC_fFindCover};
				};
		case 8:	{
					//-----------------------------
					//#groupwaitfortarget
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case8",time]]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						sleep (1 + (random 1));
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - waitfortarget",time]]};
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {_go = 0;_run = 0};
						if((_go == 1) && {({alive _x} count units _group) == 0}) then {_go = 0;_run = 0};
						if((_go == 1) && {_group in DAC_Hit_Groups}) then {_go = 0;_run = 10};
						if(_go == 1) then
						{
							_newtarget = [_group,_target] call DAC_fCheckNewTarget;
							if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
							if((time > _waittime) || (_id == 0)) then
							{
								{_x setunitpos "auto"} foreach units _group;
								_go = 0;_run = 9;
							};
						};
					};
				};
		case 9:	{
					//-----------------------------
					//#querytarget
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case9",time]]};
					if(_id > 0) then
					{
						if(!([_group,_target] call DAC_fCheckTarget)) then
						{
							_run = 10;
						};
					};
					if(_run == 9) then
					{
						if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
						if(_group in DAC_Call_Groups) then {DAC_Call_Groups = DAC_Call_Groups - [_group]};
						{_x setunitpos "auto"} foreach units _group;[_leader,5] spawn DAC_fAISpeak;[11,(leader _group)] spawn DAC_fAIRadio;
						[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
						_run = 3;_go = 0;
					};
				};
		case 10:{
					//-----------------------------
					//#groupmovetoenemy
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case10",time]]};
					sleep 0.1;
					if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
					{
						_run = 0;
					}
					else
					{
						if(({alive _x} count units _group) == 0) then
						{
							_run = 0;
						}
						else
						{
							if(_group in DAC_Hit_Groups) then
							{
								_callg = [];
								{if((alive _x) && {!(side _x == side leader _group)} && {((leader _group) knowsabout _x) > 0})  then {_callg set [count _callg,_x]}} foreach DAC_Fire_Pos;
								if((count _callg) > 0) then
								{
									if((count _callg) > 1) then
									{
										_target = _callg select (random ((count _callg) - 1));
									}
									else
									{
										_target = _callg select 0;
									};
								};
							};
							if(isNull _target) then
							{
								if(_group in DAC_Hit_Groups) then {DAC_Hit_Groups = DAC_Hit_Groups - [_group]};
								[18,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
								_run = 3;_go = 0;
							}
							else
							{
								{_x dowatch _target} foreach units _group;
								if(!(_group in DAC_Help_Groups)) then {DAC_Help_Groups set [count DAC_Help_Groups,_group]};
								if(_group in DAC_Hit_Groups) then {[20,_groupid,_group,"T",_target distance leader _group] spawn DAC_fShowRadio} else {[15,_groupid,_group,"T",_target distance _leader] spawn DAC_fShowRadio};
								[_garray,_target,_posarray,_groupid,_maxrad,_zskill,_exgroup] spawn DAC_fMoveToEnemy;[_leader,3] spawn DAC_fAISpeak;
								if((vehicle _target) iskindof "Man") then {[3,(leader _group)] spawn DAC_fAIRadio} else {if(((vehicle _target) iskindof "Tank") || ((vehicle _target) iskindof "Car"))then {[4,(leader _group)] spawn DAC_fAIRadio}};
								_run = 0;
							};
						};
					};
				};
		case 11:{
					//-----------------------------
					//#Break
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case11",time]]};
					_go = 1;_id = 1;
					while {_go > 0} do
					{
						sleep (0.1 + (random 0.2));
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - break",time]]};
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then
						{
							_go = 0;_run = 0;
						}
						else
						{
							if((_go == 1) && {({alive _x} count units _group) == 0}) then
							{
								_go = 0;_run = 0;
							}
							else
							{
								if(!(leader _group == _leader)) then
								{
									_leader = leader _group;
									{_x commandmove (position _leader)}foreach (units _group);
									if((_go == 1) && {_group in DAC_Hit_Groups}) then {_go = 0;_run = 7};
									if(((getdammage _groupvehicle) > 0.7) && (_go == 1)) then {_run = 12;_go = 0};
									
									if(_go == 1) then
									{
										_newtarget = [_group,_target] call DAC_fCheckNewTarget;
										if(isNull _newtarget) then {_id = 0} else {if(_newtarget != _target) then {_target = _newtarget};_id = 1};
										if(_id == 0) then
										{
											_go = 0;_run = 2;
										}
										else
										{
											_go = 0;_run = 8;
										};
									};
								};
							};
						};
					};
				};
		case 12:{
					//-----------------------------
					//#joinGroup
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case12",time]]};
					_go = 1;
					[_group, 3] setWaypointPosition [(position _leader), 0];[_group, 1] setWaypointPosition [[10,0], 0];
					while {_go > 0} do
					{
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - joingroup",time]]};
						if((((getMarkerSize (_marker select 0)) select 0) <= 4)
						|| {(({alive _x} count units _group) == 0)}) then {_go = 0;_run = 0};
						if(_go > 0) then
						{
							_jArray = [_group] call DAC_fFindGroup;
							if(count _jArray > 0) then
							{
								[_group,(_jArray select 0),1] spawn DAC_fRemoveGroup;
								_run = 0;_go = 0;
							}
							else
							{
								sleep (1 + (random 0.5));
							};
						};
					};
				};
		case 13:{
					//-----------------------------
					//#waitforheli
					//-----------------------------
					if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - case13",time]]};
					{_x setunitpos "auto"} foreach units _group;_go = 1;
					[_group, 3] setWaypointPosition [(position _leader), 0];
					[_group, 1] setWaypointPosition [[10,0], 0];
					[_group, 2] setWaypointPosition [[5,0], 0];
					while {_go > 0} do
					{
						sleep (1 + (random 0.5));
						if(_group in DAC_Debug) then {ctrlSetText[11, format["%1 - Move_to_VH - waitforheli",time]]};
						if((((getMarkerSize (_marker select 0)) select 0) <= 4)
						|| {(({alive _x} count units _group) == 0)}) then
						{
							_go = 0;_run = 0;
						}
						else
						{
							waituntil{DAC_NewZone == 0};
							_wpCheck = [[_wparray,_numarray,_allZones],_groupid] call DAC_fSumWaypoints;
							_posarray = (_wpCheck select 0);_allZones = ((_wpCheck select 0) select 2);
							_wparray = ((_wpCheck select 0) select 0);
							if(_sum != (_wpCheck select 1)) then
							{
								_sum = (_wpCheck select 1);
								[37,_groupid,_group,"P",player distance _leader] spawn DAC_fShowRadio;
							};
							if(((getdammage _groupvehicle) > 0.7) && (_go == 1)) then {_run = 12;_go = 0};
							if((_go == 1) && {(({alive _x} count units _groupmode) == 0)}) then {_run = 12;_go = 0};
							if((_go == 1) && {((getwppos[_groupmode, 2]) select 0) < 35}) then {_go = 0;_run = 2};
						};
					};
				};
		Default{};
	};
};