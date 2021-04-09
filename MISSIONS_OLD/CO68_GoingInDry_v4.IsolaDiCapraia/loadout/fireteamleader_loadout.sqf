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



_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_RolledUp";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "RH_15Rnd_9x19_M9";
_unit addItemToUniform "SmokeShell";
_unit addVest "CUP_V_B_MTV_TL";
for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 6 do {_unit addItemToVest "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToVest "1Rnd_Smoke_Grenade_shell";};
_unit addItemToVest "1Rnd_SmokeRed_Grenade_shell";
_unit addItemToVest "1Rnd_SmokeGreen_Grenade_shell";
_unit addHeadgear "CUP_H_USMC_Headset_GoggleW_HelmetWDL";

_unit addWeapon "RH_M16A4gl";
_unit addPrimaryWeaponItem "RH_ta01nsn";
_unit addWeapon "RH_m9";
_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";
_unit addItem "ACE_Flashlight_XL50";


sleep 2;

_unit additem "ItemRadio";




if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

