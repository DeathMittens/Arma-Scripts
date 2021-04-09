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


_unit forceAddUniform "CUP_U_B_FR_DirAction2";
_unit addItemToUniform "ACE_RangeCard";
_unit addItemToUniform "ACE_Kestrel4500";
_unit addItemToUniform "ACE_CableTie";
_unit addItemToUniform "ACE_ATragMX";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "RH_qdss_nt4_des";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
_unit addVest "CUP_V_B_RRV_Scout3";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "SmokeShellGreen";
_unit addBackpack "B_AssaultPack_khk";
_unit addItemToBackpack "ACE_SpottingScope";
_unit addItemToBackpack "ACE_Tripod";
for "_i" from 1 to 6 do {_unit addItemToBackpack "RH_20Rnd_762x51_M80A1";};
_unit addHeadgear "CUP_H_FR_BoonieMARPAT";

_unit addWeapon "RH_M4_ris";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_m9qd";
_unit addWeapon "ACE_Vector";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit addItem "ACE_Flashlight_XL50";

sleep 2;

_unit additem "itemradio";
_unit additem "acre_prc148";


if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

