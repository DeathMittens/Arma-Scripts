//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear



if ((groupID (group _unit) == "Alpha-1")OR(groupID (group _unit) == "Alpha-2")OR(groupID (group _unit) == "Alpha-3")) then 
{


removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform "CUP_U_B_FR_Scout2";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "1Rnd_SmokeGreen_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToUniform "1Rnd_SmokeRed_Grenade_shell";};
_unit addItemToUniform "RH_15Rnd_9x19_M9";
_unit addVest "CUP_V_B_RRV_Scout2";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addHeadgear "CUP_H_FR_ECH";
_unit addItem "ACE_epinephrine";

_unit addWeapon "RH_M4_ris_M203s";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_m9qd";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";


sleep 2;

_unit additem "itemradio";


}
else
{

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;

_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_RolledUp";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "RH_15Rnd_9x19_M9";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShell";};
_unit addVest "CUP_V_B_MTV_TL";
for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 10 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
_unit addHeadgear "CUP_H_USMC_Headset_GoggleW_HelmetWDL";

_unit addWeapon "RH_M16A4gl";
//_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";

sleep 2;

_unit addItem "ItemRadio";


};

