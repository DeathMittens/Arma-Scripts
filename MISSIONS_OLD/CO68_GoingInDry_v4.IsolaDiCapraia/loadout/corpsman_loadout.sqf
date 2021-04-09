//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear



if ((groupID (group _unit) == "Alpha-1")OR(groupID (group _unit) == "Alpha-2")OR(groupID (group _unit) == "Alpha-3")OR(groupID (group _unit) == "Alpha-Actual")) then 
{


removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;


_unit forceAddUniform "CUP_U_B_FR_Corpsman";
_unit addItemToUniform "CUP_NVG_PVS7";
for "_i" from 1 to 20 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "RH_15Rnd_9x19_M9";
_unit addVest "CUP_V_B_RRV_Medic";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag_Tracer_Red";};
_unit addBackpack "CUP_B_USMC_AssaultPack";
for "_i" from 1 to 30 do {_unit addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_bloodIV";};
_unit addHeadgear "CUP_H_FR_BoonieMARPAT";

_unit addWeapon "RH_m4a1_ris_des";
_unit addPrimaryWeaponItem "RH_ta31rco_tan";
_unit addWeapon "RH_m9";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

sleep 2;

_unit additem "itemRadio";

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

comment "Add containers";
_unit forceAddUniform "CUP_U_B_USMC_MARPAT_WDL_Sleeves";
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 10 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addVest "CUP_V_B_MTV_LegPouch";
for "_i" from 1 to 9 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
_unit addItemToVest "RH_15Rnd_9x19_M9";
for "_i" from 1 to 4 do {_unit addItemToVest "SmokeShell";};
_unit addItemToVest "SmokeShellRed";
_unit addItemToVest "SmokeShellGreen";
_unit addBackpack "CUP_B_USMC_AssaultPack";
for "_i" from 1 to 40 do {_unit addItemToBackpack "ACE_fieldDressing";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_morphine";};
for "_i" from 1 to 15 do {_unit addItemToBackpack "ACE_epinephrine";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "ACE_bloodIV";};
_unit addHeadgear "CUP_H_USMC_Headset_GoggleW_HelmetWDL";

_unit addWeapon "RH_M4A1_ris";
_unit addPrimaryWeaponItem "RH_compM2";
_unit addWeapon "RH_m9";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "CUP_NVG_PVS7";

sleep 2;

_unit additem "itemRadio";


};

