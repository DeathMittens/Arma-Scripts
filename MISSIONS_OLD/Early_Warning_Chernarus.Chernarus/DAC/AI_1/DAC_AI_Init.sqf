//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013   //
//--------------------------//
//    DAC_AI_Init           //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

DAC_Marker_Groups = [];
DAC_Help_Groups   = [];
DAC_Fire_Groups   = [];
DAC_Hit_Groups    = [];
DAC_Cover_Groups  = [];
DAC_Radio_Groups  = [];
DAC_Call_Groups   = [];
DAC_Fire_Pos      = [];
DAC_No_Support    = [];
DAC_KnowsAbout    = 0.1 / DAC_AI_Level;
DAC_Intern		  = [60,3,0,1];
DAC_AI_Speak      = false;
DAC_AI_SayDummy   = "";
DAC_AI_Radio      = false;
DAC_Old_String    = "";

if(isNil "DAC_Radio_Dist")	then {	DAC_Radio_Dist    = "((1000 * DAC_AI_Level) * _skillgroup)"						};
if(isNil "DAC_Alert_Dist")	then {	DAC_Alert_Dist    = "(100 + (100 * DAC_AI_Level))"								};
if(isNil "DAC_Radio_Time")	then {	DAC_Radio_Time    = "((15 / DAC_AI_Level) / ((skill (leader _group)) + 0.1))"	};
if(isNil "DAC_Radio_Count")	then {	DAC_Radio_Count   = "DAC_AI_Level"												};
if(isNil "DAC_Smoke")		then {	DAC_Smoke		  = [0,"smokeshell",[-15,15],"5 * DAC_AI_Level","((count units (group _leader)) > 3)"]};

waituntil{(DAC_Basic_Value > 0)};

sleep 3;

DAC_AI_RadioDummy1 = "Land_SurvivalRadio_F" createvehicle [0,0,0];
DAC_AI_RadioDummy2 = "Land_SurvivalRadio_F" createvehicle [0,0,0];

sleep 1;
publicvariable "DAC_AI_RadioDummy1";publicvariable "DAC_AI_RadioDummy2";

_data =	[
			[DAC_AI_RadioDummy1,DAC_AI_RadioDummy2,"radio_string","",true],
			[DAC_AI_RadioDummy1,DAC_AI_RadioDummy2,"old_string","",false],
			[DAC_AI_RadioDummy1,DAC_AI_RadioDummy2,"radio_array",[],false],
			[DAC_AI_RadioDummy1,DAC_AI_RadioDummy2,"radio_dist",0,true]
		];

{(_x select 0) setVariable [(_x select 2), (_x select 3),(_x select 4)];(_x select 0) setVariable [(_x select 2), (_x select 3),(_x select 4)]}foreach _data;