// Write your briefing here
// <br /> is line break.

player createDiaryRecord
["Diary",["Intel","

	Intel on what we're facing:
<br />
The island is garrisoned by two Motorised Rifle Companies with ex-soviet bloc equipment and supporting assets including an anti-air battery and a tank platoon.
<br />
<br />
Skies above and around the island are covered by a SAM battery, helicopters departing USS Khe Sahn must fly at or below 50 meters ASL to be clear from the SAM site. AV-8B air support should stay grounded until the SAM site is neutralized. (Knocking out the anti-air radar will disable the SAM site)
<br />
<br />
There is a military camp south east of the port, there is a significant portion of the enemy garrisoned there.
<br />
To the south of the port there is also a military depot.
<br />
<br />
<br />
	Our Available assets:
<br />
There are several Humvees that may be airlifted into the AO. The CH-53E Super Stallions will need to be used to airlift humvees.
<br />
Vehicle rearm and repair is available at base.
<br />
<br />
<br />
(Dev note: For convenience, the artificial airfield base is pretending to be the LHD 'USS Khe Sahn')

"]];

player createDiaryRecord
["Diary",["Execution","

Main Objectives:
<br />
<br />
	1)Secure Key Positions.
<br />
Key strategic points of interest and defensible positions in support of the amphibious landing. 
<br />
<br />
	2)Neutralize Priority targets.
<br />
Priority targets may include Anti-Aircraft assets, artillery assets, coastal ATGMs and enemy command and control.
<br />

"]];

player createDiaryRecord
["Diary",["Briefing","

It is the opening of a major conflict with the nation of Syraq, the Mediterranean island of Capraia exists within the boundary's of Syraq's territorial waters.
<br />
Your Marine Force Reconnaissance Platoon was assigned to and embarked upon an Expeditionary Strike Group in the region at the outbreak of the conflict, the Strike Group has been tasked with immediately securing the island of Capraia. This will be the first ground engagement with Syraq in the war.
<br />
<br />
Your primary objective in this operation is to neutralize priority targets and secure key positions in north of the island to enable the amphibious landings of Marine forces.
<br />The only suitable location to land the amphibious force is at the islands port, securing and defending this region is the top priority of this mission.
<br />
<br />
<br />
This scenario portrays a war against an entirely fictional soviet-equipped nation in an Iraq war era time period.


"]];


//Radio channels
player createDiarySubject ["fp_radios"," - Radio channels"];

player createDiaryRecord ["fp_radios", ["Plt-Radio", "
    [ Alpha Plt ]<br />
    Chan 1<br />
    [ Bravo Plt ]<br />
    Chan 2<br />
    [ COMPANY ]<br />
    Chan 3<br />
    [ CAS/AIR ]<br />
    Chan 4<br />
	
"]];

player createDiaryRecord ["fp_radios", ["Group channels", "
    [ Alpha-1 ] : 1 <br />
    [ Alpha-2 ] : 2 <br />
    [ Alpha-3 ] : 3 <br />
    [ Bravo-1 ] : 4 <br />
    [ Bravo-2 ] : 5 <br />
    [ Bravo-3 ] : 6 <br />
    [ Crew / Pilot] : 7 or 8 <br />
	
"]];

//  Unomment  next line to not have squads show on the briefing
// if (true) exitWith {};

/*
    Adds squads to the map screen
    Full credits CPC-Skippy

        (optional) Mission Maker can change groups name using :
        (group this) setGroupID ["Group Name"];
        on all units in the group

        (optional) Mission Maker can change groups color using :
        (group this) setVariable ["color",'#000000']; where 000000 can be changed to whatever hexa code

        You can set a custom name on one unit by doing
        this setVariable ["displayName","Noob #1"];

*/
private["_includeAI","_rank","_role","_strRank","_strRole","_strGrp","_strColorGrp","_strFinal","_oldGrp","_newGrp","_unitsArr"];

_includeAI     = 0;//0->only players, 1->both AI and players, 2->playable units only (includes player and some AI)
_rank         = false;//true->display unit's rank        false->hide unit's rank
_role         = true;//true->display unit's role        false->hide unit's role

_strRank         = "";//will contain unit's rank
_strRole         = "";//will contain unit's role
_strGrp         = "";//will contain unit's group name
_strColorGrp     = "";//will contain unit's group color
_strFinal         = "";//will contain final string to be displayed
_oldGrp         = grpNull;//group of last checked unit
_newGrp         = grpNull;//group of current unit
_unitsArr         = [];//will contain all units that have to be processed

switch(_includeAI) do {
    case 0:{//only players
            _unitsArr = call CBA_fnc_players;
    };
    case 1:{//both AI and players
        _unitsArr = allUnits;
    };
    case 2:{//only playable units
        if(isMultiplayer) then {
            _unitsArr = playableUnits;
        } else {
            _unitsArr = switchableUnits;
        };
    };
    default{
        _unitsArr = allUnits;
    };
};

{
    if(side _x == side player) then {
        _newGrp = group _x;
        _strGrp = "";

        if(_rank) then {
            switch(rankID _x) do {
                case 0:{
                    _strRank = "Pvt. ";
                };
                case 1:{
                    _strRank = "Cpl. ";
                };
                case 2:{
                    _strRank = "Sgt. ";
                };
                case 3:{
                    _strRank = "Lt. ";
                };
                case 4:{
                    _strRank = "Cpt. ";
                };
                case 5:{
                    _strRank = "Maj. ";
                };
                case 6:{
                    _strRank = "Col. ";
                };
                default{
                    _strRank = "Pvt. ";
                };
            };
        };

        if(_role) then {
            _strRole = " - " + getText(configFile >> "CfgVehicles" >> typeOf(_x) >> "displayName");
        };

        if((_x getVariable "displayName") != "") then {
            _strRole = " - " +(_x getVariable "displayName");
        };

        if(_newGrp != _oldGrp) then {
            _strGrp = "<br/>" + (groupID(group _x)) + "<br/>";

            if((_this find ("Color"+str(side _x)))>-1) then {
                if(count _this > ((_this find ("Color"+str(side _x))) + 1)) then {
                    _strColorGrp = _this select ((_this find ("Color"+str(side _x))) + 1);
                } else {
                    hint "Skippy-Roster - Missing Param";
                    _strColorGrp = "";
                };
            } else {
                switch (side _x) do {
                    case EAST:{
                        _strColorGrp = "'#990000'";
                    };
                    case WEST:{
                        _strColorGrp = "'#0066CC'";
                    };
                    case RESISTANCE:{
                        _strColorGrp = "'#339900'";
                    };
                    case CIVILIAN:{
                        _strColorGrp = "'#990099'";
                    };

                };
            };

            if(((group _x) getVariable "color") != "") then {
                _strColorGrp = (group _x) getVariable "color";
            };
        };

        _strFinal =  _strFinal + "<font color="+_strColorGrp+">"+_strGrp+"</font>" + _strRank + format ["%1%2",if (leader group _x == _x) then {"- "}else{"  - "}, name _x] + _strRole + "<br/>";

        _oldGrp = group _x;
    };
}forEach _unitsArr;

player createDiarySubject ["fp_squads"," - Squads"];
player createDiaryRecord ["fp_squads",["Squads",_strFinal]];


// ADMIN from F3 framework

if (serverCommandAvailable '#kick') then {
    player createDiarySubject ["fp_admin"," - Admin"];
    _briefing ="
    <br />
    ADMIN SECTION<br/>
    This briefing section can only be seen by the admin.
    <br /><br />
    ";

    // ENDINGS
    // This block of code collects all valid endings and formats them properly

    _title = [];
    _ending = [];
    _endings = [];

    _i = 1;
    while {true} do {
        _title = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "title");
        _description = getText (missionconfigfile >> "CfgDebriefing" >> format ["end%1",_i] >> "description");
        if (_title == "") exitWith {};
        _ending = [_i,_title,_description];
        _endings set [count _endings,_ending];
        _i = _i + 1;
    };

    _briefing = _briefing + "
    ENDINGS<br />
    These endings are available. To trigger an ending click on its link.<br /><br />
    ";

    {
        _briefing = _briefing + format [
        "<execute expression=""[{['end' + str(%1),true,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;"">'end%1 WIN'</execute> - %2 : - <execute expression=""[{['end' + str(%1),false,true] call BIS_fnc_endMission},'BIS_fnc_spawn',nil,true] call BIS_fnc_MP;"">'end%1 FAIL'</execute>
        <br />
        %3<br /><br />"
        ,_x select 0,_x select 1,_x select 2];
    } forEach _endings;

    if (count _endings > 0) then {
        player createDiaryRecord ["fp_admin", [" - Ending",_briefing]];
    };
    _cmds = " <br />You may run these commands.<br /><br />";
    CUL_a_showUnits = {
        hint format ['UNITS\n\nWEST:%1\nEAST:%2\nINDEP:%3\nCIV:%4\nDEAD MEN:%5\nPLAYERS:%6',
            {side _x == WEST} count allUnits,{side _x == EAST} count allUnits,{side _x == independent} count allUnits,{side _x == civilian} count allUnits,count allDeadMen, count call CBA_fnc_players]
    };
    _cmds =  _cmds + "'<execute expression=""call CUL_a_showUnits"">Count all units</execute><br />'";
    CUL_serverFPSTimeout = time;
    CUL_serverFPS = {
        if (time < CUL_serverFPSTimeout) exitWith{
            hintSilent "You must wait";
        };
        CUL_serverFPSTimeout = time + 15;
        [[[player], {
            [[[diag_fps], {hint format ["Server fps: %1",_this select 0]}],"BIS_fnc_spawn",(_this select 0),false] call BIS_fnc_MP;
        }],"BIS_fnc_spawn",false,false] call BIS_fnc_MP;
    };
    _cmds =  _cmds + "'<execute expression=""call CUL_serverFPS"">Server FPS</execute>'";
    player createDiaryRecord ["fp_admin", [" - Ending",_cmds]];
};
