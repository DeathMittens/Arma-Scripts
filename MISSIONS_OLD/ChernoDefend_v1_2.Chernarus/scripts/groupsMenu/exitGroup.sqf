private ["_caller"];
_caller = _this select 1;

_caller removeAction GRPMNU_exitGroup;
_caller removeAction GRPMNU_joinGroup;
_caller removeAction GRPMNU_leaveGroup;
_caller removeAction GRPMNU_makeLead;
_caller removeAction GRPMNU_quitLead;

GRPMNU_groupActions = _caller addAction["<t color='#EB7FAF'>Groups Menu</t>", "scripts\groupsMenu\groupActions.sqf", nil, -200, false, false, "", "_target == vehicle _this || _target == _this"];

if true exitWith {};