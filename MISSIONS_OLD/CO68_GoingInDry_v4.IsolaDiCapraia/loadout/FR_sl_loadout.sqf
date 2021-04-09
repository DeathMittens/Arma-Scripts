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


_unit forceAddUniform "CUP_U_B_FR_SpecOps";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "RH_qdss_nt4_tg";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellGreen";};
_unit addVest "CUP_V_B_RRV_TL";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";};
_unit addHeadgear "CUP_H_FR_Cap_Headset_Green";
_unit addBackpack "B_AssaultPack_cbr";


_unit addWeapon "RH_M4_ris_M203s";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_m9qd";
_unit addWeapon "ACE_Vector";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit addItem "ACE_Flashlight_XL50";


sleep 2;

_unit addItem "itemRadio";
_unit addItem "ACRE_PRC117F";


if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

