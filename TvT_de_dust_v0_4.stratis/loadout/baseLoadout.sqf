//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;


// BLUFOR CUP
_uniform = "CUP_U_B_BDUv2_gloves_desert";
_vest = "V_PlateCarrier1_rgr_noflag_F"; // CUP_V_B_RRV_DA1 // CUP_V_CPC_weapons_rngr
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

// Gear
_unit forceAddUniform _uniform;
_unit addVest _vest;
_unit addHeadgear _headgear;

// Weapons
{_unit addmagazine "rhsusf_mag_40Rnd_46x30_FMJ"} count [1,2,3,4,5,6];
_unit addWeapon "rhsusf_weap_MP7A2";
_unit addPrimaryWeaponItem "rhsusf_acc_wmx_bk";
_unit addPrimaryWeaponItem "rhsusf_acc_T1_low";

// Grenades
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

