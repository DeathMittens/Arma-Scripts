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


_unit forceAddUniform "CUP_U_B_FR_DirAction";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "RH_7Rnd_45cal_m1911";
_unit addVest "CUP_V_B_RRV_DA1";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "SmokeShellGreen";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
_unit addHeadgear "CUP_H_FR_ECH";
_unit addItemToUniform "ACE_epinephrine";

_unit addWeapon "RH_m4a1_ris_des";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn_tan";
_unit addWeapon "RH_m1911";
_unit addWeapon "CUP_launch_M136";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";


sleep 2;

_unit addItem "ItemRadio";



if (groupID (group _unit) == "NullGroup") then 
{




}
else
{




};

