//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
//removeGoggles _unit;

_unit forceAddUniform "rhs_uniform_FROG01_wd";


if (groupID (group _unit) == "Charlie" || groupID (group _unit) == "Delta") then 
{
	// ALPHA / BRAVO GEAR
	_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	_unit addMagazine "rhs_mag_M441_HE";
	_unit addWeapon "rhs_weap_m4_carryhandle_m203S";
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	
	_unit addWeapon "ACE_Vector";

	_unit addHeadgear "rhsusf_mich_helmet_marpatwd_headset"; // alt - rhsusf_mich_helmet_marpatwd_headset / rhsusf_opscore_ut_pelt
	_unit addVest "rhsusf_spc_teamleader"; // alt - rhsusf_plateframe_rifleman / rhsusf_spc_rifleman
	{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

	// Uniform
	{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
	{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
	{_unit addItemToUniform "ACE_morphine"} count [1,2];
	{_unit addItemToUniform "ACE_tourniquet"} count [1];
	_unit addItemToUniform "ACE_Maptools";
	_unit addItemToUniform "ACE_microDAGR";
	{_unit addItemToUniform "ACE_CableTie"} count [1,2];

	// Vest
	{_unit addItemToVest "rhs_mag_m67"} count [1];
	{_unit addItemToVest "rhs_mag_M441_HE"} count [1,2,3,4];
	{_unit addItemToVest "rhs_mag_an_m8hc"} count [1,2];
	{_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell"} count [1,2];
	{_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell"} count [1,2];
	{_unit addItemToVest "1Rnd_Smoke_Grenade_shell"} count [1,2];
	{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag"} count [1,2,3,4,5,6,7,8,9];	

}
else
{
	// ALPHA / BRAVO GEAR
	_unit addMagazine "rhs_mag_30Rnd_556x45_M855A1_Stanag";
	_unit addMagazine "rhs_mag_M441_HE";
	_unit addWeapon "rhs_weap_m4a1_carryhandle_m203S";
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	
	_unit addWeapon "ACE_Vector";

	_unit addHeadgear "rhsusf_opscore_ut_pelt"; // alt - rhsusf_mich_helmet_marpatwd_headset / rhsusf_opscore_ut_pelt
	_unit addVest "rhsusf_spc_teamleader"; // alt - rhsusf_plateframe_rifleman / rhsusf_spc_rifleman
	{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

	// Uniform
	{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
	{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
	{_unit addItemToUniform "ACE_morphine"} count [1,2];
	{_unit addItemToUniform "ACE_tourniquet"} count [1];
	_unit addItemToUniform "ACE_Maptools";
	_unit addItemToUniform "ACE_microDAGR";
	{_unit addItemToUniform "ACE_CableTie"} count [1,2];

	// Vest
	{_unit addItemToVest "rhs_mag_m67"} count [1];
	{_unit addItemToVest "rhs_mag_M441_HE"} count [1,2,3,4];
	{_unit addItemToVest "rhs_mag_an_m8hc"} count [1,2];
	{_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell"} count [1,2];
	{_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell"} count [1,2];
	{_unit addItemToVest "1Rnd_Smoke_Grenade_shell"} count [1,2];
	{_unit addItemToVest "rhs_mag_30Rnd_556x45_M855_Stanag"} count [1,2,3,4,5,6,7,8,9];	

};

// radios

if (groupID (group _unit) == "Command") then {

	_unit addHeadgear "rhsusf_mich_bare_norotos_arc_alt_semi"; // Change headgear
	_unit addBackpack "rhsusf_falconii_coy";
	sleep 1;
	_unit addItem "ACRE_PRC343";
	_unit additem "ACRE_PRC148";
	_unit additem "ACRE_PRC117F";
	
	
} else {

	sleep 1;
	_unit addItem "ACRE_PRC343";
	_unit additem "ACRE_PRC148";
};









