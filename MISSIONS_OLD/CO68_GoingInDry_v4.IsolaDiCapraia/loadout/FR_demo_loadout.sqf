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


_unit forceAddUniform "CUP_U_B_FR_Scout3";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "RH_qdss_nt4_des";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addItemToUniform "ACE_Clacker";
_unit addItemToUniform "ACE_DefusalKit";
_unit addItemToUniform "ACE_CableTie";
for "_i" from 1 to 2 do {_unit addItemToUniform "RH_15Rnd_9x19_M9";};
_unit addVest "CUP_V_B_RRV_Scout3";
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "SmokeShellGreen";
_unit addBackpack "CUP_B_USMC_MOLLE_WDL";
for "_i" from 1 to 6 do {_unit addItemToBackpack "DemoCharge_Remote_Mag";};
_unit addHeadgear "CUP_H_FR_ECH";
_unit addItem "ACE_epinephrine";

_unit addWeapon "RH_m4a1_ris_des";
_unit addPrimaryWeaponItem "CUP_acc_ANPEQ_2_camo";
_unit addPrimaryWeaponItem "RH_ta01nsn_tan";
_unit addWeapon "RH_m9";
_unit addHandgunItem "RH_m9qd";
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

