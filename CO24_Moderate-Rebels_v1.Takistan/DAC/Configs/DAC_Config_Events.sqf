//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 3.1b - 2014   //
//--------------------------//
//    DAC_Config_Events     //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private [
			"_TypNumber","_TempArray","_Events_Vehicle",
			"_Events_Unit_S","_Events_Unit_V","_Events_Unit_T","_Events_Unit_A","_Events_Unit_C","_Events_Unit_H"
		];

			_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------------------------------------------------
//------------ Events => Create | ReachWP | NotAliveGroup | NotAliveUnit | (BeforeReduce) | (AfterBuildUp)  | (DetectEnemys) ----------------
//-------------------------------------------------------------------------------------------------------------------------------------------
	case 1:
	{
		_Events_Unit_S =	[
								[],
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_V = 	[
								["_vehc lock true"],
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								["_vehc lock true"],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								["_vehc lock true"],
								[],
								[]
								/*  to lock all DAC vehicles
								["_vehc setVehicleLock ""Locked"""],
								["_vehc lock true"],
								["{_x lock 1}foreach units _vehc"]
								*/
							];
	};
//-------------------------------------------------------------------------------------------------
	
	// "{_x addHeadgear ""H_Shemag_olive""} foreach units _group"
	// "{_x setdamage 1} foreach units _group"], // On create
	// 	_headgear = selectRandom [""H_ShemagOpen_tan"", ""H_Shemag_olive"", ""H_ShemagOpen_khk"", ""H_Bandanna_gry""];
	
	case 2:
	{
		_Events_Unit_S =	[
								["{
								_x addHeadgear selectRandom [""H_ShemagOpen_tan"", ""H_Shemag_olive"", ""H_ShemagOpen_khk"", ""H_Bandanna_gry""];
								_x setSpeaker selectRandom [""Male01PER"", ""Male02PER"", ""Male03PER""];
								vehicle _x setVehicleLock ""LOCKED"";
								vehicle (leader _group) setVehicleLock ""LOCKED"";
								} foreach units _group;
								"], // On create
								[], // on reach waypoint
								[], // on group down
								[], // on unit down
								[], // before reduce
								["{
								_x addHeadgear selectRandom [""H_ShemagOpen_tan"", ""H_Shemag_olive"", ""H_ShemagOpen_khk"", ""H_Bandanna_gry""];
								_x setSpeaker selectRandom [""Male01PER"", ""Male02PER"", ""Male03PER""];
								vehicle _x setVehicleLock ""LOCKED"";
								vehicle (leader _group) setVehicleLock ""LOCKED"";
								} foreach units _group;
								"], // after buildup
								[] // detect enemies
							];
		_Events_Unit_V = 	[
								[],
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								["_vehc setVehicleLock ""LOCKED"""],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								["_vehc setVehicleLock ""LOCKED"""],
								[],
								[]
							];
	};
//-------------------------------------------------------------------------------------------------
	case 3:
	{
		_Events_Unit_S =	[
								[],
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_V = 	[
								[],
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_T = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_A = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Unit_C = 	[
								[],
								[],
								[],
								[],
								[],
								[]
							];
		_Events_Unit_H = 	[
								[],
								[],
								[],
								[]
							];
		_Events_Vehicle =	[
								[],
								[],
								[]
							];
	};
//-------------------------------------------------------------------------------------------------

	Default {
				if(DAC_Basic_Value != 5) then
				{
					DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
					hintc "Error: DAC_Config_Events > No valid config number";
				};
				if(true) exitwith {};
			};
};

_TempArray = [_Events_Unit_S,_Events_Unit_V,_Events_Unit_T,_Events_Unit_A,_Events_Unit_C,_Events_Unit_H,_Events_Vehicle];
_TempArray