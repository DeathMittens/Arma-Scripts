//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Reduce_Group      //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

private [
			"_group","_side","_typ","_radiusA","_radiusB","_buildtime","_leader","_ugroup","_gu","_addPlayer","_eventid",
			"_rArray","_eArray","_addUnit","_run","_cPos","_gnr","_groupArray","_sp","_co","_UA","_addleader","_veh",
			"_be","_set","_utype","_skill","_dam","_mago","_unit","_magn","_mnro","_mnrn","_vehA","_marker","_i",
			"_pl","_u","_wea","_weao","_rad","_EventList1","_EventList2","_nPos","_isRP"
		];

			if((DAC_Reduce_Value select 2) == 0) exitwith {};

			_group = _this select 0;_side = _this select 1;_typ = _this select 2;_radiusA = DAC_Reduce_Value select 0;_marker = _this select 3;
			_radiusB = DAC_Reduce_Value select 1;_buildtime = DAC_Reduce_Value select 2;_leader = leader _group;_eventid = _this select 4;
			_ugroup = units _group;_rArray = "DAC_East_Units";_eArray = "DAC_West_Units";_addunit = "";_cPos = "Position _leader";_run = 1;_go = true;_addPlayer = "";
			_pl = objNull;_i = 0;_utype = "";_skill = 0;_dam = 0;_mago = 0;_unit = _leader;_magn = 0;_mnro = 0;_mnrn = 0;_vehA = [];_nPos = "";
			_gu = 1;_addleader = "";_wea = [];_weao = [];_rad = 0;_grouparray = [];_u = 0;_EventList1 = [];_EventList2 = [];_pTemp = [];_isRP = false;

waituntil {(DAC_Basic_Value > 0)};
sleep (2 + random 2);
if(_group in DAC_Min_Groups) then {DAC_Min_Groups = DAC_Min_Groups - [_group]};
if(!isNil {_group getVariable "reduce_action"}) then {_group setVariable ["reduce_action", 0, false]};

switch (_side) do
{
	case 0:	{
				_rArray = "DAC_West_Units";_eArray = "DAC_East_Units";
				_addUnit = format["DAC_East_Units set [count DAC_East_Units,_unit]"];
				_addPlayer = format["if(!((call compile _x) in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,(call compile _x)]}"];
				_addLeader = format["DAC_East_Units set [count DAC_East_Units,_leader]"];
				if (!isNil "DAC_Pos_E") then {_isRP = true;_cPos = "Position DAC_Pos_E";_rad = direction DAC_Pos_E;_nPos = "DAC_Pos_E"};
			};
	case 1:	{
				_rArray = "DAC_East_Units";_eArray = "DAC_West_Units";
				_addUnit = format["DAC_West_Units set [count DAC_West_Units,_unit]"];
				_addPlayer = format["if(!((call compile _x) in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,(call compile _x)]}"];
				_addLeader = format["DAC_West_Units set [count DAC_West_Units,_leader]"];
				if (!isNil "DAC_Pos_W") then {_isRP = true;_cPos = "Position DAC_Pos_W";_rad = direction DAC_Pos_W;_nPos = "DAC_Pos_W"};
			};
	case 2:	{
				if(DAC_Res_Side == 0) then
				{
					_rArray = "DAC_West_Units";_eArray = "DAC_East_Units";
					_addUnit = format["DAC_East_Units set [count DAC_East_Units,_unit]"];
					_addPlayer = format["if(!((call compile _x) in DAC_West_Units)) then {DAC_West_Units set [count DAC_West_Units,(call compile _x)]}"];
					_addLeader = format["DAC_East_Units set [count DAC_East_Units,_leader]"];
					if (!isNil "DAC_Pos_E") then {_isRP = true;_cPos = "Position DAC_Pos_E";_rad = direction DAC_Pos_E;_nPos = "DAC_Pos_E"};
				}
				else
				{
					_rArray = "DAC_East_Units";_eArray = "DAC_West_Units";
					_addUnit = format["DAC_West_Units set [count DAC_West_Units,_unit]"];
					_addPlayer = format["if(!((call compile _x) in DAC_East_Units)) then {DAC_East_Units set [count DAC_East_Units,(call compile _x)]}"];
					_addLeader = format["DAC_West_Units set [count DAC_West_Units,_leader]"];
					if (!isNil "DAC_Pos_W") then {_isRP = true;_cPos = "Position DAC_Pos_W";_rad = direction DAC_Pos_W;_nPos = "DAC_Pos_W"};
				};
			};
	case 3:	{
				_rArray = "DAC_Players";_eArray = "[]";
			};
	Default {};
};

sleep 1;

if(((_leader in call compile _eArray) && {(DAC_Players select 0) in call compile _eArray}) || {format["%1",(side (DAC_Players select 0))] == "Civ"}) then {_rArray = format["%1 + DAC_Players",_rArray]};
if(!(_leader in call compile _eArray)) then {call compile _addleader};
{if((typeof vehicle _x != typeof _x) && {!(vehicle _x in _vehA)}) then {_vehA set [count _vehA,vehicle _x]}} foreach units _group;

if((_typ == 1) && {(count units _group) > 1}) then {_run = 5};
if((_typ == 2) && {(count units _group) > 1} && {count _vehA == 1}) then {_run = 5};
if((_typ == 3) && {({(vehicle _x) == _x} count (units _group)) > 0}) then {_run = 5;_vehA = []};

if(_run == 5) then
{	
	if(_eventid > 0) then
	{
		if(_typ == 1) then
		{
			_EventList1 = ((([_eventid] call DAC_fConfigEvents) select 0) select 4);
			_EventList2 = ((([_eventid] call DAC_fConfigEvents) select 0) select 5);
		}
		else
		{
			if(_typ == 2) then
			{
				_EventList1 = ((([_eventid] call DAC_fConfigEvents) select 1) select 4);
				_EventList2 = ((([_eventid] call DAC_fConfigEvents) select 1) select 5);
			}
			else
			{
				_EventList1 = ((([_eventid] call DAC_fConfigEvents) select 2) select 4);
				_EventList2 = ((([_eventid] call DAC_fConfigEvents) select 2) select 5);
			};
		};
	};
};

while {_run > 0} do
{
	switch (_run) do
	{
		case 1:	{
					while {_run == 1} do
					{
						sleep (1 + random 1);
						if((!alive _leader) || {({alive _x} count units _group) <= 1}
						|| {((getMarkerSize (_marker select 0)) select 0) <= 4}) then {_run = 10};
						if(({(alive _x) && {(_x distance _leader) < (DAC_Reduce_Value select 1)}
						&& {!(_x in _ugroup)}} count call compile _rArray) == 0) then {_run = 2};
						if((_group getVariable "getout_dac") == 1) then {_run = 0};
					};
				};
		case 2:	{
					if((!alive _leader) || {({alive _x} count units _group) <= 1}
					|| {((getMarkerSize (_marker select 0)) select 0) <= 4}) then
					{
						_run = 10;
					}
					else
					{
						DAC_Min_Groups set [count DAC_Min_Groups,_group];_run = 3;
					};
				};
		case 3:	{
					while {_run == 3} do
					{
						sleep (1 + random 1);
						if((!alive _leader) || {({alive _x} count units _group) <= 1}
						|| {((getMarkerSize (_marker select 0)) select 0) <= 4}) then
						{
							_run = 10;
						};
						if((_group getVariable "getout_dac") == 1) then {_run = 0};
						if(({(alive _x) && {(_x distance _leader) <= (DAC_Reduce_Value select 0)} 
						&& {!(_x in _ugroup)}} count call compile _rArray) > 0) then {_run = 4};
					};
				};
		case 4:	{
					DAC_Min_Groups = DAC_Min_Groups - [_group];_run = 1;
				};
		case 5:	{
					while {_run == 5} do
					{
						sleep (2 + random 2);
						if(_group in DAC_Min_Groups) then
						{
							_run = 11;
						}
						else
						{
							if((!alive _leader) || {({alive _x} count units _group) <= 1}
							|| {((getMarkerSize (_marker select 0)) select 0) <= 4}) then {_run = 10};
							if(({(alive _x) && {(_x distance _leader) < (DAC_Reduce_Value select 1)} 
							&& {!(_x in _ugroup)}} count call compile _rArray) == 0) then {_run = 6};
							if((_group getVariable "getout_dac") == 1) then {_run = 0};
						};
					};
				};
		case 6:	{
					waituntil{DAC_Release_Action == 0};
					_group setVariable ["reduce_action", 1, false];_gnr = 0;_UA = [];
					while {_gnr < count units _group} do
					{
						_unit = units _group select _gnr;
						if((alive _unit) && {!(_unit == leader _group)}) then
						{
							if((_typ == 1) || (_typ == 3)) then
							{
								if(_unit == vehicle _unit) then
								{
									_utyp = typeof _unit;_skill = skill _unit;_dam = getdammage _unit;_UA set [count _UA,_unit];
									_mag = magazines _unit;_wea = weapons _unit;_grouparray = _grouparray + [_utyp,_skill,_dam,_mag,_wea];
								};
							}
							else
							{
								if((_unit != vehicle _unit) && {_unit == driver (vehicle _unit)}) then {} else
								{
									_utyp = typeof _unit;_skill = skill _unit;_dam = getdammage _unit;_UA set [count _UA,_unit];
									_mag = magazines _unit;_wea = weapons _unit;_grouparray = _grouparray + [_utyp,_skill,_dam,_mag,_wea];
								};
							};
						};
						if((count _EventList1) > 0) then {call compile (_EventList1 select 0)};
						_gnr = _gnr + 1;
						sleep 0.01;
					};
					sleep 0.1;
					{_x removeAllEventHandlers "hit"} foreach _UA;
					{if(_x != vehicle _x) then {_x setpos [(position (leader group _x) select 0) + 5,(position (leader group _x) select 1),0]}} foreach _UA;
					sleep 0.5;
					{deletevehicle _x} foreach _UA;
					if(((DAC_Com_Values select 0) > 0) && {!isNull (group _leader)}) then {player groupchat format["%1 was reduced",group _leader]};
					if(!(_group in DAC_Min_Groups)) then {DAC_Min_Groups set [count DAC_Min_Groups,_group]};
					_group setVariable ["reduce_action", 0, false];_run = 7;
				};
		case 7:	{
					while {_run == 7} do
					{
						sleep (2 + random 2);
						if((!alive _leader) || {((getMarkerSize (_marker select 0)) select 0) <= 4}) then {_run = 10};
						if(({(alive _x) && {(_x distance _leader) <= (DAC_Reduce_Value select 0)} 
						&& {!(_x in _ugroup)}} count call compile _rArray) > 0) then {_run = 8};
						if((_group getVariable "getout_dac") == 1) then {_run = 8};
					};
				};
		case 8:	{
					if(count _grouparray == 0) then
					{
						_run = 0;
					}
					else
					{
						waituntil{DAC_Release_Action == 0};
						_group setVariable ["reduce_action", 1, false];
						if(((DAC_Com_Values select 0) > 0) && {!isNull (group _leader)}) then {player groupchat format["%1 is built up",group _leader]};
						_sp = speedmode _leader;_co = combatmode _leader;_be = behaviour _leader;_gnr = 0;_set = [];
						while {_gnr < count _grouparray} do
						{
							_skill = call compile format["%1",_grouparray select (_gnr+1)];
							_dam   = call compile format["%1",_grouparray select (_gnr+2)];
							_mago  = _grouparray select (_gnr+3);_weao = _grouparray select (_gnr+4);_utype = format["%1",_grouparray select _gnr];
							_unit = (group _leader) createUnit [_utype,call compile _cPos,[], 25, "NONE"];
							_unit setTargetAge "10 MIN";_unit setSkill _skill;_mnro = (count _mago - 1);_mnrn = 0;
							{_unit removeweapon _x}foreach (weapons _unit);
							{_unit removemagazine _x}foreach (magazines _unit);
							if(({alive _x} count units (group _leader)) <= 1) then
							{
								_run = 10;_grouparray = [];
							}
							else
							{
								_unit setdammage _dam;
								while {_mnro > -1} do {_unit addmagazine (_mago select _mnro);_mnro = _mnro - 1};
								while {_mnrn < count _weao} do {if(!(_unit hasWeapon (_weao select _mnrn))) then {_unit addweapon (_weao select _mnrn)};_mnrn = _mnrn + 1};
								_gnr = _gnr + 5;_set set [count _set,_unit];call compile _addunit;
								if(DAC_AI_AddOn > 0) then {_unit addeventhandler ["hit",{_this spawn DAC_fHitByEnemy}]};
								if((count _EventList2) > 0) then {call compile (_EventList2 select 0)};
								reload vehicle _unit;_unit setcombatmode "aware";
								sleep _buildtime;
							};
						};
						if(((getMarkerSize (_marker select 0)) select 0) <= 4) then {{deletevehicle _x} foreach _set;_run = 10};
						if(_run == 8) then {_run = 9} else {_group setVariable ["reduce_action", 0, false]};
					};	
				};
		case 9:	{
					DAC_Min_Groups = DAC_Min_Groups - [_group];_u = 0;
					{[_x,_group] spawn DAC_fLeaderMarker}foreach units _group;
					sleep 3;
					if(!isNil {call compile _nPos}) then
					{
						if(vehicle _leader == _leader) then
						{
							if(_isRP) then
							{
								while {_u < count _set} do
								{
									_unit = _set select _u;_unit setpos [(getpos _leader select 0)+(2+(2*_u)),(getpos _leader select 1),0];_u = _u + 1;
									sleep 0.01;
								};
							};
							if(count _vehA > 0) then
							{
								(_set select ((count _set) - 1)) assignasgunner (_vehA select 0);(_set select ((count _set) - 1)) moveingunner (_vehA select 0);
							};
						}
						else
						{
							if(_typ != 3) then
							{
								while {_u < count _set} do
								{
									_unit = _set select _u;
									if(((vehicle _leader) emptyPositions "gunner") == 1) then
									{
										_unit assignasgunner (vehicle _leader);_unit moveingunner (vehicle _leader);
									}
									else
									{
										_unit moveincargo (vehicle _leader);_unit assignascargo (vehicle _leader);
									};
									_u = _u + 1;
								};
							}
							else
							{
								while {_u < count _set} do
								{
									_unit = _set select _u;_unit setpos [(getpos _leader select 0)+(5+(2*_u)),(getpos _leader select 1),0];_u = _u + 1;
									sleep 0.01;
								};
							};
						};
					}
					else
					{
						if(_typ != 3) then
						{
							if(!(vehicle _leader == _leader)) then
							{
								while {_u < count _set} do
								{
									_unit = _set select _u;
									if(((vehicle _leader) emptyPositions "gunner") == 1) then
									{
										_unit assignasgunner (vehicle _leader);_unit moveingunner (vehicle _leader);
									}
									else
									{
										_unit moveincargo (vehicle _leader);_unit assignascargo (vehicle _leader);
									};
									_u = _u + 1;
								};
							}
							else
							{
								_unit = _set select _u;
								if(count _vehA > 0) then
								{
									_unit assignasgunner (_vehA select 0);_unit moveingunner (_vehA select 0);
								};
							};
						};
					};
					_grouparray = [];_set = [];
					sleep 0.1;
					_group setVariable ["reduce_action", 0, false];
					if((!alive _leader) || (isNull (group _leader))) then {_run = 10} else {_run = 5};
					if((_group getVariable "getout_dac") == 1) then {_run = 0};
					_group setcombatmode "aware";_group setbehaviour "yellow";_group setspeedmode _sp;
				};
		case 10:{
					waituntil {(!(_leader == leader _group)) || {({alive _x} count units _group) == 0} || {((getMarkerSize (_marker select 0)) select 0) <= 4}};
					if((({alive _x} count units _group) == 0) || {((getMarkerSize (_marker select 0)) select 0) <= 4}) then
					{
						_run = 0;DAC_Min_Groups = DAC_Min_Groups - [_group];
					}
					else
					{
						_leader = leader _group;
						if((_typ == 1) && {(count units _group) > 1}) then {_run = 5} else {_run = 1};
						if((_typ == 3) && {({(vehicle _x) == _x} count (units _group)) > 0}) then {_run = 5} else {_run = 1};
					};
				};
		case 11:{
					while {_run == 11} do
					{
						sleep (1 + random 1);
						if(({alive _x} count units _group) <= 1) then {_run = 0};
						if(!(_group in DAC_Min_Groups)) then {_run = 5};
						if((_group getVariable "getout_dac") == 1) then {_run = 0};
					};
				};
		Default {};
	};
};