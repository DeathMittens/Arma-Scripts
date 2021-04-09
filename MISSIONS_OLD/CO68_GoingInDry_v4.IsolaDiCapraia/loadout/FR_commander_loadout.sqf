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


_unit forceAddUniform "CUP_U_B_FR_Officer";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_CableTie";
_unit addItemToUniform "RH_15Rnd_9x19_M9";
_unit addItemToUniform "Laserbatteries";
_unit addVest "CUP_V_B_RRV_Officer";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addBackpack "B_AssaultPack_cbr";
_unit addItemToBackpack "CUP_NVG_PVS7";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellGreen";};
_unit addItemToBackpack "Laserbatteries";
_unit addHeadgear "CUP_H_FR_Cap_Headset_Green";

_unit addWeapon "RH_m4a1_ris_des";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn_tan";
_unit addWeapon "RH_m9";
_unit addWeapon "Laserdesignator";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit addItem "ACE_Flashlight_XL50";

sleep 2;

_unit additem "itemRadio";
_unit addItem "ACRE_PRC117F";
_unit addItem "ACRE_PRC148";

if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

