//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_TwoKneepads";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_CableTie";
_unit addVest "CUP_V_B_MTV_noCB";
for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "RH_15Rnd_9x19_M9";
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "SmokeShellGreen";
_unit addHeadgear "CUP_H_USMC_Headset_GoggleW_HelmetWDL";
_unit addBackpack "B_AssaultPack_cbr";

_unit addWeapon "RH_M16A4";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";
_unit addWeapon "ACE_Vector";
_unit addItem "ACE_Flashlight_XL50";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";



sleep 2;

_unit addItem "itemRadio";
_unit addItem "ACRE_PRC117F";




if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

