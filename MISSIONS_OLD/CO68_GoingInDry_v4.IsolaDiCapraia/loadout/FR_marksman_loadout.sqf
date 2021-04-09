//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear


comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform "CUP_U_B_FR_Light";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_epinephrine";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_ATragMX";
_unit addItemToUniform "ACE_Kestrel4500";
_unit addItemToUniform "ACE_RangeCard";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addItemToUniform "SmokeShellRed";
_unit addItemToUniform "SmokeShellGreen";
_unit addVest "CUP_V_B_RRV_Officer";
for "_i" from 1 to 8 do {_unit addItemToVest "RH_20Rnd_762x51_M80A1";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
_unit addHeadgear "CUP_H_FR_BoonieMARPAT";
_unit addItem "ACE_epinephrine";

_unit addWeapon "RH_SR25EC";
_unit addPrimaryWeaponItem "optic_SOS";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
_unit addWeapon "RH_m9";
_unit addWeapon "ACE_Vector";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit addItem "ACE_Flashlight_XL50";


sleep 2;

_unit additem "itemradio";



if (groupID (group _unit) == "NullGroup") then 
{




}
else
{




};

