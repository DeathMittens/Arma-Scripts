//init

//farooq revive
call compile preprocessFile "FAR_revive\FAR_revive_init.sqf";

skiptime (((paramsarray select 0) - daytime) % 24);

//GroupJoin Script
[player] execVM "scripts\groupsMenu\initGroups.sqf";

//Waiting
waitUntil {!isNull player};
waitUntil {player == player};

//Gear
[] execVM "gear.sqf";

//JiP Task Sync
if (!(isNull player)) then //non-JIP player
{
[]execvm "briefing.sqf";
};
if (!isServer && isNull player) then //JIP player
{
waitUntil {!isNull player};
[]execvm "briefing.sqf";
}; 




