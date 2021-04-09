//////////////////////////////
//    Dynamic-AI-Creator    //
//    Version 2.1 - 2009    //
//--------------------------//
//    DAC_Config_Units      //
//--------------------------//
//    Script by Silola      //
//    silola@freenet.de     //
//////////////////////////////

private ["_TypNumber","_TempArray","_Unit_Pool_S","_Unit_Pool_V","_Unit_Pool_T","_Unit_Pool_A"];
_TypNumber = _this select 0;_TempArray = [];

switch (_TypNumber) do
{
//-------------------------------------------------------------------------------------------------
// Indfor Guerillas (A3)
  case 0:
  {
    _Unit_Pool_S = [
		"I_G_Soldier_TL_F",
		"I_G_Soldier_SL_F",
		"I_G_Soldier_F",
		"I_G_Soldier_AR_F",
		"I_G_medic_F",
		"I_G_Soldier_M_F",
		"I_G_engineer_F",
		"I_G_Soldier_LAT_F"
	];
    _Unit_Pool_V = [
		"I_G_Offroad_01_armed_F"
	];
    _Unit_Pool_T = [
		
	];
    _Unit_Pool_A = [
		
	];
 };
//-------------------------------------------------------------------------------------------------
// Green AAF (A3)
  case 1:
  {
    _Unit_Pool_S = [
		"I_medic_F",
		"I_Soldier_A_F",
		"I_soldier_AA_F",
		"I_soldier_AR_F",
		"I_soldier_AT_F",
		"I_soldier_exp_F",
		"I_Soldier_F",
		"I_Soldier_GL_F",
		"I_soldier_LAT_F",
		"I_Soldier_lite_F",
		"I_soldier_M_F",
		"I_soldier_repair_F",
		"I_Soldier_SL_F",
		"I_Soldier_TL_F"

	];
    _Unit_Pool_V = [

	];
    _Unit_Pool_T = [

	];
    _Unit_Pool_A = [
		"I_Heli_Transport_02_F"
	];
  };
//-------------------------------------------------------------------------------------------------
// Green AAF Alt. (A3)
  case 2:
  {
    _Unit_Pool_S = [
		"I_engineer_F",
		"I_medic_F",
		"I_sniper_F",
		"I_Soldier_A_F",
		"I_soldier_AA_F",
		"I_soldier_AR_F",
		"I_soldier_AT_F",
		"I_soldier_exp_F",
		"I_Soldier_F",
		"I_Soldier_GL_F",
		"I_soldier_LAT_F",
		"I_Soldier_lite_F",
		"I_soldier_M_F",
		"I_soldier_repair_F",
		"I_Soldier_SL_F",
		"I_Soldier_TL_F",
		"I_spotter_F"

	];
    _Unit_Pool_V = [

	];
    _Unit_Pool_T = [

	];
    _Unit_Pool_A = [

	];
  };
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value";
      hintc "Error: DAC_Config_Units > No valid config number";
    };
    if(true) exitwith {};
  };
};

if(count _this == 2) then
{
  _TempArray = _TempArray + [_Unit_Pool_S,_Unit_Pool_V,_Unit_Pool_T,_Unit_Pool_A];
}
else
{
  _TempArray = _Unit_Pool_V + _Unit_Pool_T + _Unit_Pool_A;
};
_TempArray