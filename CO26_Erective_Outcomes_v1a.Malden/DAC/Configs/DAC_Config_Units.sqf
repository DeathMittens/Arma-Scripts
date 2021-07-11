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
// REDFOR (A3)
  case 0:
  {
    _Unit_Pool_S = ["O_crew_F","O_Helipilot_F","O_Soldier_SL_F","O_soldier_AR_F","O_soldier_AR_F","O_soldier_exp_F","O_soldier_GL_F","O_soldier_GL_F","O_soldier_M_F","O_medic_F","O_soldier_AA_F","O_soldier_repair_F","O_Soldier_F","O_Soldier_F","O_soldier_LAT_F","O_soldier_LAT_F","O_soldier_lite_F","O_soldier_TL_F","O_soldier_TL_F"];
    _Unit_Pool_V = ["O_MRAP_02_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"];
    _Unit_Pool_T = ["O_MBT_02_arty_F","I_APC_Wheeled_03_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"];
	_Unit_Pool_A = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Light_02_armed_F"];
  };
//-------------------------------------------------------------------------------------------------
// BLUFOR (A3)
  case 1:
  {
    _Unit_Pool_S = ["B_crew_F","B_Helipilot_F","B_Soldier_SL_F","B_soldier_AR_F","B_soldier_AR_F","B_soldier_exp_F","B_soldier_GL_F","B_soldier_GL_F","B_soldier_AA_F","B_soldier_M_F","B_medic_F","B_soldier_repair_F","B_Soldier_F","B_Soldier_F","B_soldier_LAT_F","B_soldier_LAT_F","B_soldier_lite_F","B_soldier_TL_F","B_soldier_TL_F"];
    _Unit_Pool_V = ["B_MRAP_01_F","B_MRAP_01_gmg_F","B_MRAP_01_hmg_F"];
    _Unit_Pool_T = ["B_APC_Wheeled_01_cannon_F","B_APC_Tracked_01_AA_F","B_APC_Tracked_01_rcws_F","B_MBT_01_cannon_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F"];
    _Unit_Pool_A = ["B_Heli_Light_01_armed_F","B_Heli_Transport_01_camo_F","B_Heli_Light_01_F"];
  };
//-------------------------------------------------------------------------------------------------
// Independent (A3)
  case 2:
  {
    _Unit_Pool_S = ["I_crew_F","I_helipilot_F","I_officer_F","I_Soldier_AT_F","I_Soldier_AA_F","I_Soldier_M_F","I_Soldier_GL_F","I_Soldier_exp_F","I_engineer_F","I_medic_F","I_Soldier_AR_F","I_Soldier_A_F"];
    _Unit_Pool_V = ["I_Truck_02_covered_F","I_Truck_02_transport_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F","I_MRAP_03_F"];
    _Unit_Pool_T = ["I_MBT_03_cannon_F","I_APC_tracked_03_cannon_F","I_APC_Wheeled_03_cannon_F"];
    _Unit_Pool_A = ["I_Heli_light_03_F"];
  };
//-------------------------------------------------------------------------------------------------
// Civilians (A3)
  case 3:
  {
    _Unit_Pool_S = ["C_man_1","C_man_1","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
    _Unit_Pool_V = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_T = ["C_Van_01_box_F","C_Van_01_transport_F","C_Offroad_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F"];
    _Unit_Pool_A = [];
  };
// tanoan rebels tanks -------------------------------------------------------------------------
    case 4:
  {
    _Unit_Pool_S = [
	// Order of units first in array:
	// Tank crewman
	// Pilot
	// Squad Leader/officer
	
	/*	
	"rhsgref_nat_crew",
	"lop_afr_driver",
	"lop_afr_infantry_sl",
	*/
	
	"rhsgref_tla_g_crew", // crewman
	"rhsgref_tla_g_crew", // pilot
	"rhsgref_tla_g_squadleader", // squad leader
	
	/*
	"lop_afr_infantry_corpsman",
	"lop_afr_infantry_ar_asst",
	"lop_afr_infantry_gl",
	"lop_afr_infantry_rifleman",
	"lop_afr_infantry_rifleman_3",
	"lop_afr_infantry_rifleman_2",
	"lop_afr_infantry_ar",
	"lop_afr_infantry_at",
	"lop_afr_infantry_marksman",
	"lop_afr_driver",
	*/
	
	"rhsgref_tla_g_grenadier",
	
	"rhsgref_tla_g_machinegunner",
	"rhsgref_tla_g_rifleman",
	"rhsgref_tla_g_rifleman_pm63",
	"rhsgref_tla_g_rifleman_vz58",
	"rhsgref_tla_g_rifleman_akms",
	
	"rhsgref_tla_g_rpg75",
	"rhsgref_tla_g_specialist_at",
	
	"rhsgref_tla_g_rifleman_l1a1",
	"rhsgref_tla_g_rifleman_m1",
	"rhsgref_tla_g_rifleman_m14",
	
	"rhsgref_tla_g_saboteur", // Explosives
	"rhsgref_tla_g_medic" // medic
	
	/*
	"rhsgref_nat_specialist_aa",
	"rhsgref_nat_specialist_aa",
	"rhsgref_nat_specialist_aa",
	
	"rhsgref_nat_grenadier_rpg",
	"rhsgref_nat_commander",
	"rhsgref_nat_hunter",
	"rhsgref_nat_machinegunner",
	"rhsgref_nat_medic",
	"rhsgref_nat_kar98k",
	"rhsgref_nat_akms",
	"rhsgref_nat_grenadier",
	"rhsgref_nat_rifleman",
	"rhsgref_nat_rifleman_m92",
	"rhsgref_nat_rifleman_saboteur"
	*/
	
	];
    _Unit_Pool_V = [
	//vehicles
	"rhsgref_cdf_reg_uaz_ags",
	"rhsgref_tla_g_offroad_armed",
	"rhsgref_cdf_reg_uaz_dshkm",
	"rhsgref_cdf_reg_uaz_spg9"
	];
    _Unit_Pool_T = [
	//armour
	"rhs_t72bb_tv",
	"rhsgref_cdf_t72ba_tv"
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };
  // ChDKZ Insurgents BTR -------------------------------------------------------------------------
    case 5:
  {
    _Unit_Pool_S = [
	// Crew, Pilot, Squad leader
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_SL",

	// African Desert Militia
	"UK3CB_ADM_O_TL",
	"UK3CB_ADM_O_GL",
	"UK3CB_ADM_O_MG",
	"UK3CB_ADM_O_AR",
	"UK3CB_ADM_O_LAT",
	"UK3CB_ADM_O_AT",
	"UK3CB_ADM_O_MK",
	"UK3CB_ADM_O_SPOT",
	"UK3CB_ADM_O_RIF_1",
	"UK3CB_ADM_O_RIF_2",

	// African Desert Extremists
	//"UK3CB_ADE_O_SL",
	"UK3CB_ADE_O_TL",
	"UK3CB_ADE_O_RIF_1",
	"UK3CB_ADE_O_RIF_2",
	"UK3CB_ADE_O_MD",
	"UK3CB_ADE_O_MG",
	"UK3CB_ADE_O_AR",
	"UK3CB_ADE_O_MK",
	"UK3CB_ADE_O_GL",
	"UK3CB_ADE_O_LAT",
	"UK3CB_ADE_O_AT",

	// African Desert Civilian Militia
	//"UK3CB_ADG_O_SL",
	"UK3CB_ADG_O_TL",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_2",
	"UK3CB_ADG_O_MD",
	"UK3CB_ADG_O_MG",
	"UK3CB_ADG_O_AR",
	"UK3CB_ADG_O_AT"
		
	];
    _Unit_Pool_V = [
	//vehicles
	"UK3CB_ADM_O_Hilux_Pkm",
	"UK3CB_ADM_O_Hilux_Dshkm",
	"UK3CB_ADM_O_LR_M2",
	"UK3CB_ADM_O_Pickup_DSHKM",
	"UK3CB_ADM_O_BTR40_MG"
	];
    _Unit_Pool_T = [
	//armour BTR
	"UK3CB_ADM_O_MTLB_PKT",
	"UK3CB_ADM_O_BRDM2",
	"UK3CB_ADA_O_BTR60",
	"UK3CB_ADA_O_BTR70"
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };
  // ChDKZ Insurgents IFV -------------------------------------------------------------------------
    case 6:
  {
    _Unit_Pool_S = [
	// Crew, Pilot, Squad leader
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_SL",

	// African Desert Militia
	"UK3CB_ADM_O_TL",
	"UK3CB_ADM_O_GL",
	"UK3CB_ADM_O_MG",
	"UK3CB_ADM_O_AR",
	"UK3CB_ADM_O_LAT",
	"UK3CB_ADM_O_AT",
	"UK3CB_ADM_O_MK",
	"UK3CB_ADM_O_SPOT",
	"UK3CB_ADM_O_RIF_1",
	"UK3CB_ADM_O_RIF_2",

	// African Desert Extremists
	//"UK3CB_ADE_O_SL",
	"UK3CB_ADE_O_TL",
	"UK3CB_ADE_O_RIF_1",
	"UK3CB_ADE_O_RIF_2",
	"UK3CB_ADE_O_MD",
	"UK3CB_ADE_O_MG",
	"UK3CB_ADE_O_AR",
	"UK3CB_ADE_O_MK",
	"UK3CB_ADE_O_GL",
	"UK3CB_ADE_O_LAT",
	"UK3CB_ADE_O_AT",

	// African Desert Civilian Militia
	//"UK3CB_ADG_O_SL",
	"UK3CB_ADG_O_TL",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_2",
	"UK3CB_ADG_O_MD",
	"UK3CB_ADG_O_MG",
	"UK3CB_ADG_O_AR",
	"UK3CB_ADG_O_AT"
	
	];
    _Unit_Pool_V = [
	//vehicles
	"UK3CB_ADM_O_Hilux_Pkm",
	"UK3CB_ADM_O_Hilux_Dshkm",
	"UK3CB_ADM_O_LR_M2",
	"UK3CB_ADM_O_Pickup_DSHKM",
	"UK3CB_ADM_O_BTR40_MG"
	];
    _Unit_Pool_T = [
	//armour IFV
	"UK3CB_ADA_O_BMP1",
	"UK3CB_ADA_O_BMP2"
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };
    // ChDKZ Insurgents Tank -------------------------------------------------------------------------
    case 7:
  {
    _Unit_Pool_S = [
	// Crew, Pilot, Squad leader
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_RIF_2",
	"UK3CB_ADM_O_SL",

	// African Desert Militia
	"UK3CB_ADM_O_TL",
	"UK3CB_ADM_O_GL",
	"UK3CB_ADM_O_MG",
	"UK3CB_ADM_O_AR",
	"UK3CB_ADM_O_LAT",
	"UK3CB_ADM_O_AT",
	"UK3CB_ADM_O_MK",
	"UK3CB_ADM_O_SPOT",
	"UK3CB_ADM_O_RIF_1",
	"UK3CB_ADM_O_RIF_2",

	// African Desert Extremists
	//"UK3CB_ADE_O_SL",
	"UK3CB_ADE_O_TL",
	"UK3CB_ADE_O_RIF_1",
	"UK3CB_ADE_O_RIF_2",
	"UK3CB_ADE_O_MD",
	"UK3CB_ADE_O_MG",
	"UK3CB_ADE_O_AR",
	"UK3CB_ADE_O_MK",
	"UK3CB_ADE_O_GL",
	"UK3CB_ADE_O_LAT",
	"UK3CB_ADE_O_AT",

	// African Desert Civilian Militia
	//"UK3CB_ADG_O_SL",
	"UK3CB_ADG_O_TL",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_2",
	"UK3CB_ADG_O_MD",
	"UK3CB_ADG_O_MG",
	"UK3CB_ADG_O_AR",
	"UK3CB_ADG_O_AT"
	];
    _Unit_Pool_V = [
	//vehicles
	"UK3CB_ADM_O_Hilux_Pkm",
	"UK3CB_ADM_O_Hilux_Dshkm",
	"UK3CB_ADM_O_LR_M2",
	"UK3CB_ADM_O_Pickup_DSHKM",
	"UK3CB_ADM_O_BTR40_MG"
	];
    _Unit_Pool_T = [
	//armour TANKS/IFV/BTR?
	"UK3CB_ADA_O_T72A",
	"UK3CB_ADM_O_T55"	
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };

  
  
// middle east indfor (A3) -------------------------------------------------------------------------------------------------
  case 8:
  {
    _Unit_Pool_S = [
	// Crew, Pilot, Squad leader
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_SL",

	// African Desert Civilian Militia
	//"UK3CB_ADG_O_SL",
	"UK3CB_ADG_O_TL",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_2",
	"UK3CB_ADG_O_MD",
	"UK3CB_ADG_O_MG",
	"UK3CB_ADG_O_AR",
	"UK3CB_ADG_O_AT"
	];
    _Unit_Pool_V = [
	//vehicles
	"UK3CB_ADM_O_Hilux_Pkm",
	"UK3CB_ADM_O_Hilux_Dshkm",
	"UK3CB_ADM_O_LR_M2",
	"UK3CB_ADM_O_Pickup_DSHKM",
	"UK3CB_ADM_O_BTR40_MG"
	];
    _Unit_Pool_T = [
	//armour BTR
	"UK3CB_ADM_O_MTLB_PKT",
	"UK3CB_ADM_O_BRDM2",
	"UK3CB_ADA_O_BTR60",
	"UK3CB_ADA_O_BTR70"
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };
// syndikat indfor (A3) -------------------------------------------------------------------------------------------------
  case 9:
  {
    _Unit_Pool_S = [
	// Crew, Pilot, Squad leader
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_SL",

	// African Desert Civilian Militia
	//"UK3CB_ADG_O_SL",
	"UK3CB_ADG_O_TL",
	"UK3CB_ADG_O_RIF_1",
	"UK3CB_ADG_O_RIF_2",
	"UK3CB_ADG_O_MD",
	"UK3CB_ADG_O_MG",
	"UK3CB_ADG_O_AR",
	"UK3CB_ADG_O_AT"
		
	];
    _Unit_Pool_V = [
	//vehicles
	"UK3CB_ADM_O_Hilux_Pkm",
	"UK3CB_ADM_O_Hilux_Dshkm",
	"UK3CB_ADM_O_LR_M2",
	"UK3CB_ADM_O_Pickup_DSHKM",
	"UK3CB_ADM_O_BTR40_MG"
	];
    _Unit_Pool_T = [
	//armour BTR
	"UK3CB_ADM_O_MTLB_PKT",
	"UK3CB_ADM_O_BRDM2",
	"UK3CB_ADA_O_BTR60",
	"UK3CB_ADA_O_BTR70"
	];
    _Unit_Pool_A = [
	//air
	"I_C_Heli_Light_01_civil_F"
	];
  };
  
//-------------------------------------------------------------------------------------------------
  Default
  {
    if(DAC_Basic_Value != 5) then
    {
      DAC_Basic_Value = 5;publicvariable "DAC_Basic_Value",
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