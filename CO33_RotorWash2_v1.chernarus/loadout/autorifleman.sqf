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
	// CHARLIE / DELTA GEAR
	_unit addMagazine "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch";
	_unit addWeapon "rhs_weap_m249_pip";
	_unit addPrimaryWeaponItem "rhsusf_acc_saw_bipod";
	
	_unit addMagazine "rhsusf_mag_7x45acp_MHP";
	_unit addWeapon "rhsusf_weap_m1911a1";

	_unit addHeadgear "rhsusf_mich_helmet_marpatwd_headset"; // alt - rhsusf_mich_helmet_marpatwd_headset / rhsusf_opscore_ut_pelt
	_unit addVest "rhsusf_spc_mg"; // alt - rhsusf_plateframe_rifleman / rhsusf_spc_rifleman
	{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

	// Uniform
	{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
	{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
	{_unit addItemToUniform "ACE_morphine"} count [1,2];
	{_unit addItemToUniform "ACE_tourniquet"} count [1];
	//{_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855_Stanag"} count [1];
	_unit addItemToUniform "ACE_Maptools";
	{_unit addItemToUniform "rhsusf_mag_7x45acp_MHP"} count [1,2];

	// Vest
	//_unit addItemToVest "rhs_mag_m18_red";
	//_unit addItemToVest "rhs_mag_m18_green";
	{_unit addItemToVest "rhs_mag_an_m8hc"} count [1];
	{_unit addItemToVest "rhs_mag_m67"} count [1];
	{_unit addItemToVest "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"} count [1,2,3,4];
}
else
{
	// ALPHA / BRAVO GEAR
	_unit addMagazine "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch";
	_unit addWeapon "rhs_weap_m249_pip_S_para_vfg3";
	_unit addPrimaryWeaponItem "rhsusf_acc_compm4";
	_unit addPrimaryWeaponItem "rhsusf_acc_kac_grip_saw_bipod";
	
	_unit addMagazine "rhsusf_mag_7x45acp_MHP";
	_unit addWeapon "rhsusf_weap_m1911a1";

	_unit addHeadgear "rhsusf_opscore_ut_pelt"; // alt - rhsusf_mich_helmet_marpatwd_headset / rhsusf_opscore_ut_pelt
	_unit addVest "rhsusf_plateframe_machinegunner"; // alt - rhsusf_plateframe_rifleman / rhsusf_spc_rifleman
	{_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch"];

	// Uniform
	{_unit addItemToUniform "ACE_fieldDressing"} count [1,2,3,4,5,6,7,8];
	{_unit addItemToUniform "ACE_packingBandage"} count [1,2,3,4];
	{_unit addItemToUniform "ACE_morphine"} count [1,2];
	{_unit addItemToUniform "ACE_tourniquet"} count [1];
	//{_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855_Stanag"} count [1];
	_unit addItemToUniform "ACE_Maptools";
	{_unit addItemToUniform "rhsusf_mag_7x45acp_MHP"} count [1,2];

	// Vest
	//_unit addItemToVest "rhs_mag_m18_red";
	//_unit addItemToVest "rhs_mag_m18_green";
	{_unit addItemToVest "rhs_mag_an_m8hc"} count [1];
	{_unit addItemToVest "rhs_mag_m67"} count [1];
	{_unit addItemToVest "rhsusf_100Rnd_556x45_M855_mixed_soft_pouch"} count [1,2,3,4,5];	
	
};


// radios
sleep 1;
_unit addItem "ACRE_PRC343";
//_unit additem "ACRE_PRC148";

