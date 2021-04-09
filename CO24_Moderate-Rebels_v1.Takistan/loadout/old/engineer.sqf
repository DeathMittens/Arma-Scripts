//to prevent MP / JIP issues
//waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

comment "Exported from Arsenal by Death Mittens";

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers";
_unit forceAddUniform "LOP_U_UKR_Fatigue_TanMTP";
for "_i" from 1 to 8 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "itemRadio";
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "rhs_6sh92";
for "_i" from 1 to 8 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
_unit addHeadgear "rhs_tsh4";
//_unit addBackpack "B_AssaultPack_rgr";

comment "Add weapons";
_unit addWeapon "rhs_weap_aks74u_folded";
_unit addPrimaryWeaponItem "rhs_acc_pgs64_74u";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

//sleep 2;
//_unit addItem "acre_prc117F";
_unit addBackpack "tf_rt1523g";
removeBackpack _unit;
sleep 5;
_unit addBackpack "tf_rt1523g";


if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};

