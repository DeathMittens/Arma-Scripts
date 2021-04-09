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
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addItemToUniform "itemRadio";
for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_rdg2_white";};
_unit addVest "LOP_V_6B23_6Sh92_OLV";
for "_i" from 1 to 9 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
//_unit addBackpack "B_AssaultPack_rgr";
_unit addHeadgear "H_MilCap_mcamo";
_unit addGoggles "G_Aviator";

//_unit addBackpack "tf_anprc155_coyote";
//_unit addBackpack "tf_rt1523g";

comment "Add weapons";
_unit addWeapon "rhs_weap_ak74m_fullplum_gp25";
_unit addPrimaryWeaponItem "rhs_acc_dtk";
_unit addWeapon "ACE_VectorDay";

comment "Add items";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";

_unit addItem "ACE_epinephrine";
_unit additem "ace_maptools";

//sleep 2;
//_unit addItem "ACRE_PRC148";
//_unit addItem "ACRE_PRC117F";

_unit addBackpack "tf_anprc155_coyote";
sleep 5;
removeBackpack _unit;
_unit addBackpack "tf_anprc155_coyote";
for "_i" from 1 to 4 do {_unit addItemToBackpack "rhs_VOG25";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_white";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_green";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_GRD40_Red";};


if (groupID (group _unit) == "NullGroup") then 
{

}
else
{

};

