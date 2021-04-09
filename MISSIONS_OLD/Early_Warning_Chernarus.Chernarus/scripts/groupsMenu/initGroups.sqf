if (!isServer) then {waitUntil {!isNull player};};
GRPMNU_groupActions = player addAction["<t color='#EB7FAF'>Groups Menu</t>", "scripts\groupsMenu\groupActions.sqf", nil,-200, false, false, "", "_target == vehicle _this || _target == _this"];
