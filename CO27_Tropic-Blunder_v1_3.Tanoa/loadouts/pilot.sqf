params ["_unit", "_type"];

// Plane pilots
if (_type == "B_pilot_F") then {
  _unit addHeadgear "H_PilotHelmetFighter_B";
  _unit forceAddUniform "U_B_PilotCoveralls";
  _unit addBackpack "ACE_NonSteerableParachute";
  clearAllItemsFromBackpack _unit;
  {_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","NVGoggles"];

  {_unit addItemToUniform "ACE_fieldDressing"} count [0,1];
  _unit addItemToUniform "ACE_morphine";
  {_unit addItemToUniform "30Rnd_45ACP_Mag_SMG_01"} count [0,1,2];
  _unit addItemToUniform "SmokeShell";
  _unit addItemToUniform "SmokeShellBlue";
  _unit addItemToUniform "Chemlight_green";

  _unit addWeapon "SMG_01_Holo_F";
  _unit addPrimaryWeaponItem "optic_Holosight_smg";

  _unit addItemToUniform "ItemRadio";
};

// Heli pilots, crew
if (_type == "B_Helipilot_F" || _type == "B_helicrew_F") then {
  _unit addHeadgear "H_PilotHelmetHeli_B";
  _unit forceAddUniform "U_B_HeliPilotCoveralls";
  _unit addVest "V_TacVest_blk";
  {_unit linkItem _x} forEach ["ItemMap","ItemCompass","ItemWatch","NVGoggles"];

  {_unit addItemToUniform "ACE_fieldDressing"} count [0,1];
  _unit addItemToUniform "ACE_morphine";
  {_unit addItemToUniform "30Rnd_45ACP_Mag_SMG_01"} count [0,1];
  _unit addItemToUniform "SmokeShellGreen";
  _unit addItemToUniform "Chemlight_green";

  _unit addItemToVest "30Rnd_45ACP_Mag_SMG_01";
  _unit addItemToVest "SmokeShellBlue";
  _unit addItemToVest "SmokeShellOrange";
  _unit addItemToVest "Chemlight_green";

  _unit addWeapon "SMG_01_Holo_F";
  _unit addPrimaryWeaponItem "optic_Holosight_smg";

  _unit addItemToUniform "ItemRadio";
};
