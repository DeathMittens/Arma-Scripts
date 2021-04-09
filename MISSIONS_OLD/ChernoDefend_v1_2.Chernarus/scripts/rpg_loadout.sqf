//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

removeBackpack _unit;

_unit removeWeapon "launch_RPG7V_F";

_unit addBackpack "B_FieldPack_khk";

_unit addMagazines ["PG7V_F",6];

_unit addWeapon "launch_RPG7V_F";