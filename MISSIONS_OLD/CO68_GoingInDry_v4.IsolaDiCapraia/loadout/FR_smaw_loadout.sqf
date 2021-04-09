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
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
_unit addVest "CUP_V_B_RRV_Scout";
for "_i" from 1 to 5 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
_unit addItemToVest "HandGrenade";
_unit addItemToVest "SmokeShell";
_unit addBackpack "CUP_B_USMC_MOLLE";
_unit addItemToBackpack "CUP_SMAW_HEAA_M";
_unit addItemToBackpack "CUP_SMAW_HEDP_M";
_unit addHeadgear "CUP_H_FR_ECH";
_unit addItem "ACE_epinephrine";

_unit addWeapon "RH_m4a1_ris_des";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2";
_unit addPrimaryWeaponItem "RH_ta01nsn_tan";
_unit addWeapon "CUP_launch_Mk153Mod0_SMAWOptics";
_unit addSecondaryWeaponItem "CUP_optic_SMAW_Scope";

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

