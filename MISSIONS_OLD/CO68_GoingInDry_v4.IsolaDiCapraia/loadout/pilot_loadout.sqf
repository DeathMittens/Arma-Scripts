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


_unit forceAddUniform "CUP_U_B_USMC_PilotOverall";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "ACE_microDAGR";
_unit addVest "CUP_V_B_PilotVest";
for "_i" from 1 to 4 do {_unit addItemToVest "30Rnd_556x45_Stanag";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellRed";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShellGreen";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_red";};
for "_i" from 1 to 2 do {_unit addItemToVest "Chemlight_green";};
for "_i" from 1 to 2 do {_unit addItemToVest "RH_15Rnd_9x19_M9";};
_unit addBackpack "B_AssaultPack_cbr";
_unit addHeadgear "CUP_H_USMC_Helmet_Pilot";
_unit addItem "ACE_epinephrine";

comment "Add weapons";
_unit addWeapon "RH_m4";
_unit addWeapon "RH_m9";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit addItem "ACE_Flashlight_XL50";


sleep 2;

_unit additem "itemRadio";
_unit addItem "ACRE_PRC117F";

setviewdistance 8000;


if (groupID (group _unit) == "NullGroup") then 
{



}
else
{



};

