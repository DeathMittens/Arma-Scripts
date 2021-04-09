//to prevent MP / JIP issues
waitUntil {!isNull player};

_unit = _this select 0;

// Common gear

_unit removePrimaryWeaponItem "optic_aco";
_unit addPrimaryWeaponItem "optic_arco";

_unit addItem "ItemAndroid";
