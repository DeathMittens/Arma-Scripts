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
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
_unit addVest "CUP_V_B_RRV_MG";
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
_unit addBackpack "CUP_B_USMC_AssaultPack";
_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M";
for "_i" from 1 to 2 do {_unit addItemToBackpack "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M";};
_unit addHeadgear "CUP_H_FR_ECH";
_unit addItem "ACE_epinephrine";

_unit addWeapon "CUP_lmg_Mk48_wdl_Aim_Laser";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_compM2_tan";
_unit addWeapon "RH_m1911";
_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

sleep 2;

_unit additem "itemRadio";

if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

