//to prevent MP / JIP issues
//waitUntil {!isNull player};
// this addAction ["<t color='#FF0000'>MP7</t>","loadout\B_Loadout.sqf",[],1,false,true,"","_this distance _target < 10"];  
//[0,player,0,["AA-12"]]execVM "loadout\B_Loadout.sqf" - in mission testing

/* Loadouts:
//MP7
this addAction ["<t color='#FF0000'>MP7</t>","loadout\B_Loadout.sqf",["MP7"],1,false,true,"","_this distance _target < 10"];  
//MP5
this addAction ["<t color='#FF0000'>MP5</t>","loadout\B_Loadout.sqf",["MP5"],1,false,true,"","_this distance _target < 10"];  
//MP5 (SD)
this addAction ["<t color='#FF0000'>MP5 (SD)</t>","loadout\B_Loadout.sqf",["MP5 (SD)"],1,false,true,"","_this distance _target < 10"];  
//AWP
this addAction ["<t color='#FF0000'>AWP</t>","loadout\B_Loadout.sqf",["AWP"],1,false,true,"","_this distance _target < 10"];  
//vz 61
this addAction ["<t color='#FF0000'>vz 61</t>","loadout\B_Loadout.sqf",["vz 61"],1,false,true,"","_this distance _target < 10"];  
//mp44
this addAction ["<t color='#FF0000'>MP44</t>","loadout\B_Loadout.sqf",["MP44"],1,false,true,"","_this distance _target < 10"];  
//Mosin SBR
this addAction ["<t color='#FF0000'>Mosin SBR</t>","loadout\B_Loadout.sqf",["Mosin SBR"],1,false,true,"","_this distance _target < 10"];  
//Deagle
this addAction ["<t color='#FF0000'>Deagle</t>","loadout\B_Loadout.sqf",["Deagle"],1,false,true,"","_this distance _target < 10"];  
//AUG 9mm (CZ)
this addAction ["<t color='#FF0000'>AUG 9mm (CZ)</t>","loadout\B_Loadout.sqf",["AUG 9mm (CZ)"],1,false,true,"","_this distance _target < 10"];  
//AA-12
this addAction ["<t color='#FF0000'>AA-12</t>","loadout\B_Loadout.sqf",["AA-12"],1,false,true,"","_this distance _target < 10"];  
//Mauser
this addAction ["<t color='#FF0000'>Mauser</t>","loadout\B_Loadout.sqf",["Mauser"],1,false,true,"","_this distance _target < 10"];  
//SKS
this addAction ["<t color='#FF0000'>SKS</t>","loadout\B_Loadout.sqf",["SKS"],1,false,true,"","_this distance _target < 10"];  
//Saiga-12
this addAction ["<t color='#FF0000'>Saiga-12</t>","loadout\B_Loadout.sqf",["Saiga-12"],1,false,true,"","_this distance _target < 10"];  
//PP-19-01 Vityaz
this addAction ["<t color='#FF0000'>PP-19-01 Vityaz</t>","loadout\B_Loadout.sqf",["PP-19-01 Vityaz"],1,false,true,"","_this distance _target < 10"];  
//Izh-18
this addAction ["<t color='#FF0000'>Izh-18</t>","loadout\B_Loadout.sqf",["Izh-18"],1,false,true,"","_this distance _target < 10"];  



this addAction ["<t color='#FF0000'>MP7</t>","loadout\B_Loadout.sqf",["MP7"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>MP5</t>","loadout\B_Loadout.sqf",["MP5"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>MP5 (SD)</t>","loadout\B_Loadout.sqf",["MP5 (SD)"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>AWP</t>","loadout\B_Loadout.sqf",["AWP"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>vz 61</t>","loadout\B_Loadout.sqf",["vz 61"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>MP44</t>","loadout\B_Loadout.sqf",["MP44"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>Mosin SBR</t>","loadout\B_Loadout.sqf",["Mosin SBR"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>Deagle</t>","loadout\B_Loadout.sqf",["Deagle"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>AUG 9mm (CZ)</t>","loadout\B_Loadout.sqf",["AUG 9mm (CZ)"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>AA-12</t>","loadout\B_Loadout.sqf",["AA-12"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>Mauser</t>","loadout\B_Loadout.sqf",["Mauser"],1,false,true,"","_this distance _target < 10"]; 
this addAction ["<t color='#FF0000'>SKS</t>","loadout\B_Loadout.sqf",["SKS"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>Saiga-12</t>","loadout\B_Loadout.sqf",["Saiga-12"],1,false,true,"","_this distance _target < 10"];  
this addAction ["<t color='#FF0000'>PP-19-01 Vityaz</t>","loadout\B_Loadout.sqf",["PP-19-01 Vityaz"],1,false,true,"","_this distance _target < 10"];
this addAction ["<t color='#FF0000'>Izh-18</t>","loadout\B_Loadout.sqf",["Izh-18"],1,false,true,"","_this distance _target < 10"];  


];  

//["Open", true] spawn BIS_fnc_arsenal;

*/

if (!(roundState==1)) ExitWith {hint "Can not change loadout after round has started.";};

//Addaction Parameters
//_unit = _this select 0;
_unit = _this select 1;
//_actionID this select 2;
_loadout = _this select 3 select 0; // Input Argument

//hint str(_loadout);

systemChat format["Loadout: %1",_loadout];

// BLUFOR CUP
_uniform = "CUP_U_B_BDUv2_gloves_desert";
_vest = "V_PlateCarrier1_rgr_noflag_F";
_headgear = "CUP_H_LWHv2_desert_comms";
	
if (side _unit == east) then {
	// OPFOR CUP
	_uniform = "CUP_U_O_RUS_Gorka_Green_gloves2";
	_vest = "V_PlateCarrier1_rgr_noflag_F";
	_headgear = "CUP_H_RUS_6B47_headset";
	
};


/*
// BLUFOR RHS
_uniform = "rhs_uniform_g3_tan";
_vest = "rhsusf_mbav_rifleman";
_headgear = "rhsusf_ach_bare_tan_headset";
	
if (side _unit == east) then {
	// OPFOR RHS
	_uniform = "rhs_uniform_gorka_r_y";
	_vest = "rhsgref_6b23_khaki_rifleman";
	_headgear = "rhs_6b47";
	
};
*/

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addHeadgear _headgear;

// Weapons & Magazines:

switch(_loadout) do {

	case "MP7": {
		{_unit addmagazine "rhsusf_mag_40Rnd_46x30_FMJ"} count [1,2,3,4,5,6];
		_unit addWeapon "rhsusf_weap_MP7A2";
		_unit addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
		_unit addPrimaryWeaponItem "rhsusf_acc_T1_low";
	};
	case "MP5": {
		{_unit addmagazine "hlc_30Rnd_9x19_B_MP5"} count [1,2,3,4,5,6];
		_unit addWeapon "hlc_smg_mp5a2";
		_unit addPrimaryWeaponItem "hlc_acc_Surefiregrip";
		//_unit addPrimaryWeaponItem "rhsusf_acc_T1_low";
	};
	case "MP5 (SD)": {
		{_unit addmagazine "hlc_30Rnd_9x19_SD_MP5"} count [1,2,3,4,5,6];
		_unit addWeapon "hlc_smg_mp5sd6";
		//_unit addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
		//_unit addPrimaryWeaponItem "rhsusf_acc_T1_low";
	};
	case "AWP": {
		{_unit addmagazine "hlc_5rnd_300WM_FMJ_AWM"} count [1,2,3,4,5,6];
		_unit addWeapon "hlc_rifle_awmagnum";
		_unit addPrimaryWeaponItem "rhsusf_acc_M8541";
	};
	case "vz 61": {
		{_unit addmagazine "rhsgref_20rnd_765x17_vz61"} count [1,2,3,4,5,6,7,8];
		_unit addWeapon "rhs_weap_savz61";
	};
	case "MP44": {
		{_unit addmagazine "rhsgref_30Rnd_792x33_SmE_StG"} count [1,2,3,4,5,6];
		_unit addWeapon "rhs_weap_MP44";
	};
	case "Mosin SBR": {
		{_unit addmagazine "rhsgref_5Rnd_762x54_m38"} count [1,2,3,4,5,6];
		_unit addWeapon "rhs_weap_mosin_sbr";
		_unit addPrimaryWeaponItem "rhsgref_sdn6_suppressor";
		_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	};
	case "Deagle": {
		{_unit addmagazine "CUP_7Rnd_50AE_Deagle"} count [1,2,3,4,5,6,7,8];
		_unit addWeapon "CUP_hgun_Deagle";
	};
	case "AUG 9mm (CZ)": {
		// Plus CZ Phantom
		{_unit addmagazine "hlc_25Rnd_9x19mm_M882_AUG"} count [1,2,3,4,5,6];
		{_unit addmagazine "CUP_18Rnd_9x19_Phantom"} count [1,2,3,4];
		
		_unit addWeapon "hlc_rifle_auga2para_t";
		_unit addPrimaryWeaponItem "optic_Yorris";
		
		_unit addWeapon "CUP_hgun_Phantom";
		_unit addHandgunItem "muzzle_snds_L";
		_unit addHandgunItem "CUP_acc_CZ_M3X";
		
	};
	case "AA-12": {
		// Plus Browning HP
		{_unit addmagazine "CUP_20Rnd_B_AA12_Buck_00"} count [1,2,3,4];
		{_unit addmagazine "CUP_13Rnd_9x19_Browning_HP"} count [1,2,3,4];
		
		_unit addWeapon "CUP_sgun_AA12";
		_unit addWeapon "CUP_hgun_Browning_HP";
	};
	case "Mauser": {
		// Plus Mauser Pistol	
		{_unit addmagazine "rhsgref_5Rnd_792x57_kar98k"} count [1,2,3,4,5,6];
		{_unit addmagazine "hlc_20Rnd_763x25_B_M712"} count [1,2,3,4];
		
		_unit addWeapon "rhs_weap_kar98k";
		_unit addWeapon "hlc_pistol_M712";
	};
	case "SKS": {
		// Plus Tokarev	
		{_unit addmagazine "CUP_10Rnd_762x39_SKS_M"} count [1,2,3,4,5,6];
		{_unit addmagazine "rhs_mag_762x25_8"} count [1,2,3,4];
		
		_unit addWeapon "CUP_SKS";
		_unit addWeapon "rhs_weap_tt33";
	};
	case "Saiga-12": {
		// Plus Makarov	
		{_unit addmagazine "CUP_5Rnd_B_Saiga12_Buck_00"} count [1,2,3,4,5,6];
		{_unit addmagazine "rhs_mag_9x18_8_57N181S"} count [1,2,3,4];
		
		_unit addWeapon "hlc_rifle_saiga12k";
		_unit addWeapon "rhs_weap_makarov_pm";
	};
	case "PP-19-01 Vityaz": {
		{_unit addmagazine "CUP_30Rnd_9x19_Vityaz"} count [1,2,3,4,5,6];
		
		_unit addWeapon "CUP_smg_vityaz_vfg_front_rail";
		_unit addPrimaryWeaponItem "CUP_muzzle_Bizon";
		_unit addPrimaryWeaponItem "CUP_optic_ZeissZPoint";
		_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_15_Flashlight_Black_L";
	};
	case "Izh-18": {
		{_unit addmagazine "CUP_1Rnd_12Gauge_HE"} count [1,2,3,4,5,6,7,8,9];
		{_unit addmagazine "rhsgref_1Rnd_Slug"} count [1,2,3,4,5,6,7,8,9];
		{_unit addmagazine "rhs_18rnd_9x21mm_7N29"} count [1,2,3,4,5,6];
		
		_unit addWeapon "rhs_weap_Izh18";
		_unit addPrimaryWeaponItem "optic_Yorris";
		_unit addWeapon "rhs_weap_6p53";
		
	};
	
	
	default { hint "default" };

};

//Grenades
{_unit addItem "HandGrenade"} count [1,2]; // Frag
{_unit addItem "ACE_M84"} count [1,2]; // Flash Bang
{_unit addItem "SmokeShell"} count [1,2]; // Smoke

// Medical
{_unit addItem "FirstAidKit"} count [1,2];

// Base Items
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "NVGoggles_OPFOR";

// Add Radio
_unit addItem "ACRE_PRC343";



/*
if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};
*/
