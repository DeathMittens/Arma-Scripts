//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

_uniform = [
	"UK3CB_ADA_B_U_CombatUniform_01_DPP",
	"UK3CB_TKA_I_U_CombatUniform_01_TKA_Brush",
	"UK3CB_TKA_I_U_CombatUniform_02_TKA_Brush",
	"UK3CB_TKA_I_U_CombatUniform_03_TKA_Brush",
	"rhsgref_uniform_altis_lizard"
] call BIS_fnc_selectRandom;

_vest = [
	//"UK3CB_TKA_O_V_6b23_ml_Oli_02",
	//"UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli",
	//"UK3CB_TKA_O_V_6b23_ml_Oli_TKA_Brush",
	//"UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli_TKA_Brush",
	//"UK3CB_TKA_O_V_6b23_ml_Oli_ADPM",
	//"UK3CB_TKA_O_V_6b23_ML_6sh92_radio_Oli_ADPM",
	//"rhsgref_6b23_khaki_rifleman",
	//"rhs_6b3_AK",
	"rhs_6b3_R148"
] call BIS_fnc_selectRandom;

_headgear = [
	//"rhs_headband",
	//"rhssaf_bandana_smb",
	//"H_Cap_oli",
	"H_Booniehat_khk",
	"H_Booniehat_oli",
	"UK3CB_TKA_I_H_Patrolcap_OLI"
] call BIS_fnc_selectRandom;

_gun = [
	//"rhs_weap_pkm",
	//"UK3CB_RPK_74N_PLUM",
	"hlc_rifle_SLRchopmod",
	"rhs_weap_ak74n_2",
	"uk3cb_ak47n",
	"rhs_weap_aks74un",
	"hlc_rifle_L1A1SLR"
] call BIS_fnc_selectRandom;

_Pistol = [
	"rhs_weap_makarov_pm",
	"UK3CB_BHP",
	"rhsusf_weap_m1911a1"
] call BIS_fnc_selectRandom;

_backpack = "UK3CB_B_Alice_K";

_mag = "";
switch (_gun) do {
	case "hlc_rifle_SLRchopmod": {
		_mag = "rhs_mag_20Rnd_762x51_m80_fnfal";
	};
	case "hlc_rifle_L1A1SLR": {
		_mag = "rhs_mag_20Rnd_762x51_m80_fnfal";
	};
	case "rhs_weap_ak74n_2": {
		_mag = "rhs_30Rnd_545x39_7N10_camo_AK";
	};
	case "uk3cb_ak47n": {
		_mag = "rhs_30Rnd_762x39mm";
	};
	case "rhs_weap_aks74un": {
		_mag = "rhs_30Rnd_545x39_7N10_camo_AK";
	};
	case default {
		_mag = "rhs_30Rnd_545x39_7N10_camo_AK"; // default - 5.45x39
	};
};

_pistolMag = "";
switch (_Pistol) do {
	case "UK3CB_BHP": {
		_pistolMag = "UK3CB_BHP_9_13Rnd";
	};
	case "rhs_weap_makarov_pm": {
		_pistolMag = "rhs_mag_9x18_8_57N181S";
	};
	case "rhsusf_weap_m1911a1": {
		_pistolMag = "rhsusf_mag_7x45acp_MHP";
	};
};

// ---------- GEAR ---------- //

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit forceAddUniform _uniform;
_unit addHeadgear _headgear;
_unit addVest _vest;
_unit addBackpack _backpack;

{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
{_unit addItemToUniform "ACE_morphine"} count [1,2];
{_unit addItemToUniform "ACE_tourniquet"} count [1];
_unit addItemToUniform "ACE_Maptools";

{_unit addItemToVest _mag} count [1,2,3,4,5,6];
{_unit addItemToBackpack _mag} count [1,2,3,4];

_unit addWeapon _gun;

_unit addItem _pistolMag;
_unit addWeapon _Pistol;

_unit addWeapon "binocular";

{_unit addItemToBackpack "HandGrenade"} count [1];
{_unit addItemToBackpack "SmokeShell"} count [1,2];
{_unit addItemToBackpack "SmokeShellGreen"} count [1,2,3];
{_unit addItemToBackpack "SmokeShellRed"} count [1,2,3];
{_unit addItemToBackpack "SmokeShellOrange"} count [1,2];
_unit addItemToBackpack _pistolMag;

sleep 1;
_unit addItem "ACRE_PRC343";
_unit additem "ACRE_PRC148";
_unit additem "ACRE_PRC117F";

