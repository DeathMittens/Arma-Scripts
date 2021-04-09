//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1 - 2013    //
//--------------------------//
//    DAC_Config_Creator    //
//--------------------------//
//    Script by Silola      //
//    Fixed by Pansyfaust   //
//////////////////////////////

DAC_Activate 	= compile preprocessFileLineNumbers "DAC\Scripts\DAC_Activate_Zone.sqf";
DAC_Deactivate 	= compile preprocessFileLineNumbers "DAC\Scripts\DAC_Deactivate_Zone.sqf";
DAC_Weapons 	= compile preprocessFileLineNumbers "DAC\Scripts\DAC_Change_Weapons.sqf";
scalar = "any";DAC_Init_Camps = 0;

waituntil{time > 0.3};

if(isServer) then {if(local player) then {DAC_Code = 1} else {DAC_Code = 0}} else {if(isnull player) then {DAC_Code = 3} else {DAC_Code = 2}};

//===============|
// DAC_Settings	 |
//===============|=============================================================================================|

	if(isNil "DAC_AI_Count_Level")	then {		DAC_AI_Count_Level  = [[2,4],[2,6],[3,8],[5,8],[5,6],[4,6],[4,4],[3,5]]	};
	if(isNil "DAC_Dyn_Weather") 	then {		DAC_Dyn_Weather		= [0,0,0,0]									};
	if(isNil "DAC_Reduce_Value") 	then {		DAC_Reduce_Value	= [1300,1500,0.3]							};
	if(isNil "DAC_AI_Spawn") 		then {		DAC_AI_Spawn		= [[10,5,5],[10,5,15],0,120,250,0]			};
	if(isNil "DAC_Delete_Value") 	then {		DAC_Delete_Value	= [[500,600],[500,600],5000]				};
	if(isNil "DAC_Del_PlayerBody") 	then {		DAC_Del_PlayerBody	= [0,0]										};
	if(isNil "DAC_Com_Values") 		then {		DAC_Com_Values		= [0,0,0]									};
	if(isNil "DAC_AI_AddOn") 		then {		DAC_AI_AddOn		= 1											};
	if(isNil "DAC_AI_Level") 		then {		DAC_AI_Level		= 2											};
	if(isNil "DAC_Res_Side") 		then {		DAC_Res_Side		= 1											};
	if(isNil "DAC_VehAllowed") 		then {		DAC_VehAllowed 		= [0,1]										};
	if(isNil "DAC_Marker") 			then {		DAC_Marker			= 0;										};
	if(isNil "DAC_WP_Speed") 		then {		DAC_WP_Speed		= 0.01										};
	if(isNil "DAC_Join_Action")		then {		DAC_Join_Action		= false										};
	if(isNil "DAC_Fast_Init") 		then {		DAC_Fast_Init		= false										};
	if(isNil "DAC_Player_Marker")	then {		DAC_Player_Marker	= false										};
	if(isNil "DAC_Direct_Start")	then {		DAC_Direct_Start	= false										};
	if(isNil "DAC_Activate_Sound")	then {		DAC_Activate_Sound	= false										};
	if(isNil "DAC_Auto_UnitCount")	then {		DAC_Auto_UnitCount	= [8,10]									};
	if(isNil "DAC_Player_Support")	then {		DAC_Player_Support	= [10,[10,2000,3,1000]]						};
	if(isNil "DAC_SaveDistance")	then {		DAC_SaveDistance	= [500,["DAC_Save_Pos"]]					};

	
	DAC_BadBuildings 	= 	["Land_vez"];
	DAC_SP_Soldiers		= 	["O_soldier_AR_F","B_soldier_AR_F","I_soldier_AR_F", "I_G_Soldier_AR_F", "B_G_Soldier_AR_F"];
	DAC_GunAllowed 		= 	[
								"B_Mortar_01_F","O_Mortar_01_F","I_Mortar_01_F", "B_HMG_01_F", "B_HMG_01_high_F",
								"B_GMG_01_F", "B_GMG_01_high_F", "B_static_AA_F", "B_static_AT_F", "O_HMG_01_F",
								"O_HMG_01_high_F", "O_GMG_01_F", "O_GMG_01_high_F", "O_static_AA_F",
								"O_static_AT_F", "I_HMG_01_F", "I_HMG_01_high_F", "I_GMG_01_F", "I_GMG_01_high_F",
								"I_static_AA_F", "I_static_AT_F", "B_G_Mortar_01_F"
							];

	//=============================================================================================================|
	
	[]execVM "DAC\Scripts\DAC_Start_Creator.sqf";
	waituntil{!isNil "DAC_Basic_Value"};
	sleep 0.1;
	waituntil {(DAC_Basic_Value > 0)};
	
if(DAC_Code < 2) then
{
	//===========================================|
	// StartScriptOnServer                       |
	//===========================================|
	//player sidechat "ServerStart"
	//[] execVM "myServerScript.sqf";
	//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	//[[sec1,""]] execVM "DAC\Scripts\DAC_Init_Sector.sqf";
}
else
{
	if(DAC_Code == 3) then
	{
		//===========================================|
		// StartScriptOnJipClient                    |
		//===========================================|
		//player sidechat "JipClientStart"
		//[] execVM "myJipClientScript.sqf";
	}
	else
	{
		//===========================================|
		// StartScriptOnClient                       |
		//===========================================|
		//player sidechat "ClientStart"
		//[] execVM "myClientScript.sqf";
		//onMapSingleClick "_fun = [_pos,_shift]execVM ""Action.sqf""";
	};
};