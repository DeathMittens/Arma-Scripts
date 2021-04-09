////////////////////////////////////////////////
// Player Actions
////////////////////////////////////////////////
FAR_Player_Actions =
{
	private ["_units"];
	//player addAction ["<t color=""#C90000"">" + "Suicide" + "</t>", "player setDamage 1", nil, 9, false, true, "", "player call FAR_Check_Suicide"];
	while {alive player} do {
		if (isMultiplayer) then {
			_units = playableUnits;
		} else {
			_units = switchableUnits;
		};
		{
			if (alive _x && {_x isKindOf "Man"} && {!(_x getVariable ["FAR_Initialized",false])}) then 
			{
				// addAction args: title, filename, (arguments, priority, showWindow, hideOnUse, shortcut, condition, positionInModel, radius, radiusView, showIn3D, available, textDefault, textToolTip)
				_x addAction ["<t color=""#C90000"">" + "Revive" + "</t>", "_this spawn FAR_HandleRevive", nil, 10, true, true, "", "_target call FAR_Check_Revive"];
				_x addAction ["<t color=""#C90000"">" + "Stabilize" + "</t>", "_this spawn FAR_HandleStabilize", nil, 10, true, true, "", "_target call FAR_Check_Stabilize"];
				_x addAction ["<t color=""#C90000"">" + "Drag" + "</t>", "_this spawn FAR_Drag", nil, 9, false, true, "", "_target call FAR_Check_Dragging"];
				_x addAction ["<t color=""#C90000"">" + "Carry" + "</t>", "_this spawn FAR_Carry", nil, 9, false, true, "", "_target call FAR_Check_Dragging"];
				_x setVariable ["FAR_Initialized", true]; //local variable
			};
		}forEach _units;
		sleep 2;
	};
};

////////////////////////////////////////////////
// Vehicle Actions
////////////////////////////////////////////////
FAR_Vehicle_Actions =
{
	while {alive player} do {
		{
			if (alive _x && {_x isKindOf "AllVehicles"} && {!(_x getVariable ["FAR_Initialized",false])}) then 
			{
				_x addAction ["<t color=""#C90000"">" + "Unload Injured" + "</t>", "_this spawn FAR_HandleUnload", nil, 10, true, true, "", "_this call FAR_Check_Unload"];
				_x setVariable ["FAR_Initialized", true]; //local variable
			};
		}forEach vehicles;
		sleep 2;
	};
};

////////////////////////////////////////////////
// Handle Death
////////////////////////////////////////////////
FAR_HandleDamage_EH =
{
	private ["_unit", "_killer", "_amountOfDamage", "_isUnconscious"];

	_unit = _this select 0;
	_amountOfDamage = _this select 2;
	_killer = _this select 3;
	_isUnconscious = _unit getVariable ["FAR_isUnconscious",false];
	
	if (alive _unit && _amountOfDamage >= 1 && !_isUnconscious) then 
	{
		_unit setDamage 0;
		_unit allowDamage false;
		_amountOfDamage = 0;

		[_unit, _killer] spawn FAR_Player_Unconscious;
	};
	
	_amountOfDamage
};

////////////////////////////////////////////////
// Suicide Action Check
////////////////////////////////////////////////
FAR_Check_Suicide =
{
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",false];
	_isPlayerUnconscious;
};

////////////////////////////////////////////////
// Make Player Unconscious
////////////////////////////////////////////////
FAR_Player_Unconscious =
{
	private["_unit", "_killer"];
	_unit = _this select 0;
	_killer = _this select 1;
	
	// Death message
	if (FAR_EnableDeathMessages && !isNil "_killer" && isPlayer _killer && _killer != _unit) then
	{
		FAR_deathMessage = [_unit, _killer];
		publicVariable "FAR_deathMessage";
		["FAR_deathMessage", [_unit, _killer]] call FAR_public_EH;
	};
	
	if (isPlayer _unit) then
	{
		disableUserInput true;
		titleText ["", "BLACK FADED"];
	};
	
	// Eject unit if inside a dead vehicle
	
	while {vehicle _unit != _unit && {!alive (vehicle _unit)}} do 
	{
		unAssignVehicle _unit;
		
		_unit action ["eject", vehicle _unit];
		if (vehicle _unit != _unit) then 
		{
			_unit action ["getOut", vehicle _unit];
		};
		sleep 2;
	};
	
	if (vehicle _unit != _unit) then 
	{
		_unit setVariable ["FAR_inVehicle", true, true];
		(vehicle _unit) setVariable ["FAR_VehLoaded", true, true];
		_unit setVariable ["FAR_isLoaded", true, true];
		_unit attachTo [(vehicle _unit),[0,0,0]];
	};
	
	_unit setDamage 0;
    _unit setVelocity [0,0,0];
    _unit allowDamage false;
	_unit setCaptive true;
	//_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
	if (vehicle _unit == _unit) then
	{
		[[_unit, "AcinPercMrunSnonWnonDf_death"], "switchMoveMP",true,false] call BIS_fnc_MP;
		sleep 4.5;
		_unit playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
		[[_unit, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
	}
	else
	{
		[[_unit, "AinjPpneMstpSnonWrflDnon_rolltoback"], "playMoveMP",true,false] call BIS_fnc_MP;
	};
    
	sleep 1;
	
	if (isPlayer _unit) then
	{
		titleText ["", "BLACK IN", 1];
		disableUserInput false;

		 // Mute ACRE
        _unit setVariable ["ace_sys_wounds_uncon", true];

        //Disable action menu, disable all input except ESC
        showHUD false;
        if (FAR_MuteACRE == 1 || FAR_MuteACRE == 2) then {
            FAR_keyEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == 1) then {false} else {true}}];
        };
        FAR_firedEH = player addEventHandler ["fired", {
            deleteVehicle (_this select 6);
            player addMagazine (_this select 5);
        }];
	};
	
	if (vehicle _unit == _unit) then
	{
		[_unit] spawn
		{
			sleep 1;
			(_this select 0) switchMove "AinjPpneMstpSnonWrflDnon";
		};
	};
	_unit enableSimulation false;
	_unit setVariable ["FAR_isUnconscious", true, true];
	[_unit] spawn FAR_InjuredPP;
	
	// Call this code only on players
	if (isPlayer _unit) then 
	{
		if (!FAR_MultiBug) exitWith {};
		FAR_MultiBug = false;
		
		while { !isNull _unit && alive _unit && _unit getVariable ["FAR_isUnconscious",false] && !(_unit getVariable ["FAR_isStabilized",false]) && FAR_BleedOut > 0 } do
		{
			FAR_BleedOut = FAR_BleedOut - 0.5;
			hintSilent format["Bleedout in %1 seconds\n\nYou will lose %3 seconds on your next incap.\n\n%2\n\nHit Escape and click\nrespawn to suicide", round FAR_BleedOut, call FAR_CheckFriendlies, FAR_Drain];
			
			if (_unit getVariable ["FAR_inVehicle", false]) then
			{
				titleText ["You died in a vehicle. You will regain vision when you are unloaded.","BLACK FADED"];
			};
			
			if (vehicle _unit != _unit && {!alive (vehicle _unit)}) then
			{
				_unit setVariable ["FAR_inVehicle", false, true];
				titleText ["", "BLACK IN", 1];
				detach _unit;
				_unit action ["eject", vehicle _unit];
				if (vehicle _unit != _unit) then 
				{
					_unit action ["getOut", vehicle _unit];
				};
				waitUntil {vehicle _unit == _unit};
				_unit enableSimulation true;
				sleep 1;
				[[_unit, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
				sleep 1;
				_unit enableSimulation false;
			};
			
			sleep 0.5;
		};
		
		if (_unit getVariable ["FAR_isStabilized",false]) then {
			//Unit has been stabilized. Disregard bleedout timer and umute player
			_unit setVariable ["ace_sys_wounds_uncon", false];
			
			while { !isNull _unit && alive _unit && _unit getVariable ["FAR_isUnconscious",false] } do
			{
				hintSilent format["You have been stabilized at %1 seconds\n\nYou will lose %3 seconds on your next incap.\n\n%2\n\nHit Escape and click\nrespawn to suicide", round FAR_BleedOut, call FAR_CheckFriendlies, FAR_Drain];
				if (vehicle _unit != _unit && {!alive (vehicle _unit)}) then
				{
					detach _unit;
					_unit action ["eject", vehicle _unit];
					if (vehicle _unit != _unit) then 
					{
						_unit action ["getOut", vehicle _unit];
					};
					waitUntil {vehicle _unit == _unit};
					_unit enableSimulation true;
					sleep 1;
					[[_unit, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
					sleep 1;
					_unit enableSimulation false;
				};
				
				sleep 0.5;
			};
		};
		
		// Player bled out
		if (FAR_BleedOut <= 0 && {!(_unit getVariable ["FAR_isStabilized",false])}) then
		{
			_unit setDamage 1;
		}
		else
		{
			_revived = true;
			[_unit,_revived] call FAR_Recover;
		};
	}
	else
	{
		// [Debugging] Bleedout for AI
		
		while { !isNull _unit && alive _unit && _unit getVariable ["FAR_isUnconscious",false] && !(_unit getVariable ["FAR_isStabilized",false]) && FAR_BleedOut > 0 } do
		{
			FAR_BleedOut = FAR_BleedOut - 0.5;
			sleep 0.5;
		};
		
		if (_unit getVariable ["FAR_isStabilized",false]) then {			
			while { !isNull _unit && alive _unit && _unit getVariable ["FAR_isUnconscious",false] } do
			{
				sleep 0.5;
			};
		};
		
		// AI bled out
		if (FAR_BleedOut <= 0 && {!(_unit getVariable ["FAR_isStabilized",false])}) then
		{
			_unit setDamage 1;
			_unit setVariable ["FAR_isUnconscious", false, true];
			_unit setVariable ["FAR_isDragged", false, true];
		}
	};
};

////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
FAR_Recover = 
{
	_unit = _this select 0;
	_revived = _this select 1;
	
	// Player got revived
	_unit setVariable ["FAR_isStabilized", false, true];
	FAR_MultiBug = true;
	FAR_BleedOut = FAR_BleedOut - FAR_Drain;
	
	if (_revived) then
	{
		sleep 6;
	}
	else
	{
		_unit setVariable ["FAR_isUnconscious", false, true];
		_unit setVariable ["FAR_isDragged", false, true];
		_unit setVariable ["FAR_isLoaded", false, true];
	};
	
	// Clear the "medic nearby" hint
	hintSilent "";

	// Unmute ACRE
	if (isPlayer _unit) then
	{
		_unit setVariable ["ace_sys_wounds_uncon", false];

		showHUD true;
		if (FAR_MuteACRE == 1 || FAR_MuteACRE == 2) then {
			if (!isNil "FAR_keyEH") then
			{
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", FAR_keyEH];
			};
		};
		
        if (!isNil "FAR_firedEH") then
		{
			player removeEventHandler ["fired", FAR_firedEH];
		};
	};

	
	_unit enableSimulation true;
	_unit allowDamage true;
	_unit setDamage 0;
	_unit setCaptive false;
	
	_unit playMove "amovppnemstpsraswrfldnon";
	_unit playMove "";
};
////////////////////////////////////////////////
// Revive Player
////////////////////////////////////////////////
FAR_HandleRevive =
{
	private ["_target"];

	_target = _this select 0;
	_caller = _this select 1;

	if (alive _target) then
	{
		//Option to require FAKs for revives
		if (FAR_ReviveFAK && {!("FirstAidKit" in (items player))}) exitWith
		{
			hintSilent "You need a first aid kit to revive!";
		};
		
		if (FAR_ReviveFAK && {"FirstAidKit" in (items player)}) then
		{
			_caller removeItem "FirstAidKit";
		};
		
		//(_this select 1) playMove "AinvPknlMstpSlayWrflDnon_medic";
		_caller playMove "AinvPknlMstpSnonWnonDnon_medic4";
		[[_target, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
		if (_target getVariable ["FAR_isStabilized",false]) then
		{
			[[_target,(getDir _target) + 180], "setDirMP",true,false] call BIS_fnc_MP;
		};
		
		sleep 7;

		_target setVariable ["FAR_isUnconscious", false, true];
		_target setVariable ["FAR_isDragged", false, true];
		_target setVariable ["FAR_isLoaded", false, true];
		
		sleep 6;
		
		// [Debugging] Code below is only relevant if revive script is enabled for AI
		if (!isPlayer _target) then
		{
			_target enableSimulation true;
			_target allowDamage true;
			_target setDamage 0;
			_target setCaptive false;
			
			_target playMove "amovppnemstpsraswrfldnon";
		};
	
	};
};

////////////////////////////////////////////////
// Stabilize Player
////////////////////////////////////////////////
FAR_HandleStabilize =
{
	private ["_target"];

	_target = _this select 0;
	_caller = _this select 1;

	if (alive _target) then
	{
		//_caller playMove "AinvPknlMstpSlayWrflDnon_medic";
		_caller playMove "AinvPknlMstpSnonWnonDnon_medic1";
		
		if (!alive _caller) exitWith {};
		
		if (!("Medikit" in (items _caller))) then {
			_caller removeItem "FirstAidKit";
		};
		
		[[_target, "acts_InjuredAngryRifle01"], "switchMoveMP",true,false] call BIS_fnc_MP;
		[[_target,(getDir _target) + 180], "setDirMP",true,false] call BIS_fnc_MP;

		_target setVariable ["FAR_isStabilized", true, true];
		
		sleep 6;
	};
};

////////////////////////////////////////////////
// Unload Injured Players
////////////////////////////////////////////////
FAR_HandleUnload =
{
	{
		_loaded = _x getVariable ["FAR_isLoaded",false];
		if (_loaded) then
		{
			[_x] spawn
			{
				_unit = _this select 0;
				_unit setVariable ["FAR_isLoaded", false, true];
				_unit setVariable ["FAR_inVehicle", false, true];
				detach _unit;
				_unit action ["GetOut", vehicle FAR_Vehicle];
				waitUntil {vehicle _unit == _unit};
				[[_unit, true], "enableSimulationMP",_unit,false] call BIS_fnc_MP;
				sleep 1;
				titleText ["", "BLACK IN", 1];
				[[_unit, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
				sleep 1;
				[[_unit, false], "enableSimulationMP",_unit,false] call BIS_fnc_MP;
				if (_unit getVariable ["FAR_isStabilized",false]) then
				{
					[[_unit, "acts_InjuredAngryRifle01"], "switchMoveMP",true,false] call BIS_fnc_MP;
					[[_unit,(getDir _unit) + 180], "setDirMP",true,false] call BIS_fnc_MP;
				};
			};
		};
	} forEach crew FAR_Vehicle;	
	
	FAR_Vehicle setVariable ["FAR_VehLoaded",false,true];
};

////////////////////////////////////////////////
// Drag Injured Player
////////////////////////////////////////////////
FAR_Drag =
{
	private ["_target", "_id"];
	

	_target = _this select 0;
	_caller = _this select 1;
	
	if (currentWeapon _caller != primaryWeapon _caller || primaryWeapon _caller == "") exitWith
	{
		hintSilent "You need a primary weapon equipped to drag people.";
	};
	
	FAR_isDragging = true;

	_target attachTo [_caller, [0, 1.1, 0.092]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", true, true];
	
	_caller playMove "AcinPknlMstpSrasWrflDnon";
	
	[_target,_caller] spawn FAR_DragAnim;
	
	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";
	
	// Add release action and save its id so it can be removed
	_id = _caller addAction ["<t color=""#C90000"">" + "Release" + "</t>", "_this spawn FAR_Release", nil, 10, true, true, "", "speed _this == 0"];
	_id2 = _caller addAction ["<t color=""#C90000"">" + "Load Injured" + "</t>", "_this spawn FAR_Load", nil, 10, true, true, "", "_this call FAR_Check_Load"];
	hintSilent "Press 'C' if you can't move.";
	
	// Wait until release action is used
	waitUntil 
	{ 
		!alive _caller || player getVariable ["FAR_isUnconscious",false] || !alive _target || !(_target getVariable ["FAR_isUnconscious",false]) || !FAR_isDragging || !(_target getVariable ["FAR_isDragged",false])
	};
	
	FAR_isDragging = false;
	
	if (!isNull _target && alive _target && !FAR_isLoading) then
	{
		[[_target, "AinjPpneMrunSnonWnonDb_release"], "switchMoveMP",true,false] call BIS_fnc_MP;
		sleep 1;
		if (_target getVariable ["FAR_isStabilized",false]) then
		{
			[[_target, "acts_InjuredAngryRifle01"], "switchMoveMP",true,false] call BIS_fnc_MP;
		};
		
		//_target setVariable ["FAR_isDragged", false, true];
		//detach _target;
		
		//Possible fix for disappearing bodies when released
		[[_caller, _target], "getPosMP",_target,false] call BIS_fnc_MP;
		
		if (_target getVariable ["FAR_isStabilized",false]) then
		{
			sleep 1;
			[[_target,(getDir _target) + 180], "setDirMP",true,false] call BIS_fnc_MP;
		};
	};
	
	if (!isNull _target && alive _target && FAR_isLoading) then
	{
		[[_target, "AinjPpneMrunSnonWnonDb_release"], "switchMoveMP",true,false] call BIS_fnc_MP;
		sleep 1;
		_target setVariable ["FAR_isDragged", false, true];
		detach _target;
		
		sleep 1;
		
		[[_target, FAR_Vehicle], "moveInCargoMP",_target,false] call BIS_fnc_MP;
		_target attachTo [FAR_Vehicle,[0,0,0]];
		_target setVariable ["FAR_isLoaded", true, true];
		FAR_Vehicle setVariable ["FAR_VehLoaded", true, true];
		
		FAR_isLoading = false;
	};
	
	_caller removeAction _id;
	_caller removeAction _id2;
};

FAR_DragAnim =
{
	_target = _this select 0;
	_caller = _this select 1;
	
	[[_target, "AinjPpneMrunSnonWnonDb_grab"], "switchMoveMP",true,false] call BIS_fnc_MP;
	sleep 1;
	if (!FAR_isDragging) exitWith {};
	
	[[_target, "AinjPpneMrunSnonWnonDb_still"], "switchMoveMP",true,false] call BIS_fnc_MP;
	
	while {FAR_isDragging} do
	{
		waitUntil {speed _caller != 0};
		if (!FAR_isDragging) exitWith {};
		[[_target, "AinjPpneMrunSnonWnonDb"], "switchMoveMP",true,false] call BIS_fnc_MP;
		
		waitUntil {speed _caller == 0};
		if (!FAR_isDragging) exitWith {};
		[[_target, "AinjPpneMrunSnonWnonDb_still"], "switchMoveMP",true,false] call BIS_fnc_MP;
	};
};

////////////////////////////////////////////////
// Carry Injured Player
////////////////////////////////////////////////
FAR_Carry =
{
	private ["_target", "_id"];
	

	_target = _this select 0;
	_caller = _this select 1;
	
	if (currentWeapon _caller != primaryWeapon _caller || primaryWeapon _caller == "") exitWith
	{
		hintSilent "You need a primary weapon equipped to carry people.";
	};
	
	FAR_isDragging = true;
	
	_target attachTo [_caller, [0.3, 0.6, 0]];
	_target setDir 180;
	_target setVariable ["FAR_isDragged", true, true];
	
	[[_target, "AinjPfalMstpSnonWrflDnon_carried_Up"], "switchMoveMP",true,false] call BIS_fnc_MP;
	[[_caller, "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
	_caller playMove "AcinPercMstpSnonWnonDnon";
	
	//Carry animation
	[_target,_caller] spawn FAR_CarryAnim;
	
	// Rotation fix
	FAR_isDragging_EH = _target;
	publicVariable "FAR_isDragging_EH";
	
	// Add release action and save its id so it can be removed
	_id = _caller addAction ["<t color=""#C90000"">" + "Release" + "</t>", "_this spawn FAR_Release", nil, 10, true, true, "", "speed _this == 0"];
	_id2 = _caller addAction ["<t color=""#C90000"">" + "Load Injured" + "</t>", "_this spawn FAR_Load", nil, 10, true, true, "", "_this call FAR_Check_Load"];

	//This doesn't seem to be a problem with carrying
	//hint "Press 'C' if you can't move.";
	
	// Wait until release action is used
	waitUntil 
	{ 
		!alive _caller || player getVariable ["FAR_isUnconscious",false] || !alive _target || !(_target getVariable ["FAR_isUnconscious",false]) || !FAR_isDragging || !(_target getVariable ["FAR_isDragged",false])
	};
	
	FAR_isDragging = false;
	
	if (!isNull _target && alive _target && !FAR_isLoading) then
	{
		if (player getVariable ["FAR_isUnconscious",false]) then
		{
			[[_caller, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
		};
		
		detach _target;
		_target attachTo [_caller, [0, 0, 0]];
		[[_target, "AinjPfalMstpSnonWrflDnon_carried_Down"], "switchMoveMP",true,false] call BIS_fnc_MP;
		sleep 5;
		
		[[_target, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
		if (_target getVariable ["FAR_isStabilized",false]) then
		{
			[[_target, "acts_InjuredAngryRifle01"], "switchMoveMP",true,false] call BIS_fnc_MP;
		};
		//_target setVariable ["FAR_isDragged", false, true];
		
		[[_target,_caller,FAR_isLoading], "carryDropMP",true,false] call BIS_fnc_MP;
		
		//Possible fix for disappearing bodies when released
		[[_caller, _target], "getPosMP",_target,false] call BIS_fnc_MP;
		
		
		if (!(_target getVariable ["FAR_isStabilized",false])) then
		{
			sleep 1;
			_target setDir ((getDir _target) + 180);
		};
	};
	
	if (!isNull _target && alive _target && FAR_isLoading) then
	{
		if (player getVariable ["FAR_isUnconscious",false]) then
		{
			[[_caller, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
		};
		
		detach _target;
		_target attachTo [_caller, [0, 0, 0]];
		[[_target, "AinjPfalMstpSnonWrflDnon_carried_Down"], "switchMoveMP",true,false] call BIS_fnc_MP;
		sleep 5;
		
		[[_target, "AinjPpneMstpSnonWrflDnon"], "switchMoveMP",true,false] call BIS_fnc_MP;
		_target setVariable ["FAR_isDragged", false, true];
		[[_target,_caller,FAR_isLoading], "carryDropMP",true,false] call BIS_fnc_MP;
		
		_target playMove "AinjPpneMstpSnonWrflDnon";
		sleep 1;
		
		[[_target, FAR_Vehicle], "moveInCargoMP",_target,false] call BIS_fnc_MP;
		_target attachTo [FAR_Vehicle,[0,0,0]];
		_target setVariable ["FAR_isLoaded", true, true];
		FAR_Vehicle setVariable ["FAR_VehLoaded", true, true];
		
		FAR_isLoading = false;
	};
	
	_caller removeAction _id;
	_caller removeAction _id2;
};

FAR_CarryAnim =
{
	_target = _this select 0;
	_caller = _this select 1;
	
	sleep 10;
	if (!FAR_isDragging) exitWith {};
	
	//Adjust the attachTo position to match the end of the animation in increments
	//_target attachTo [_caller, [0.5, 0.0, 0]];
	_iteration = 100;
	_attachX = 0.3;
	_attachY = 0.6;
	_incX = 0.2 / _iteration;
	_incY = 0.6 / _iteration;
	for "_i" from 0 to _iteration do 
	{
		_target attachTo [_caller, [_attachX, _attachY, 0]];
		_attachX = _attachX + _incX;
		_attachY = _attachY - _incY;
		sleep (2 / _iteration);
	};
	sleep 2;
	
	if (!FAR_isDragging) exitWith {};
	
	[[_target, "AinjPfalMstpSnonWrflDnon_carried_still"], "switchMoveMP",true,false] call BIS_fnc_MP;
	[[_target,0], "setDirMP",true,false] call BIS_fnc_MP;
	_target attachTo [_caller, [0.2, 0.15, 0]];
	
	while {FAR_isDragging} do
	{
		waitUntil {speed _caller != 0};
		if (!FAR_isDragging) exitWith {};
		[[_target, "AinjPfalMstpSnonWrflDf_carried"], "switchMoveMP",true,false] call BIS_fnc_MP;
		
		waitUntil {speed _caller == 0};
		if (!FAR_isDragging) exitWith {};
		[[_target, "AinjPfalMstpSnonWrflDnon_carried_still"], "switchMoveMP",true,false] call BIS_fnc_MP;
	};
};

////////////////////////////////////////////////
// Release Injured Player
////////////////////////////////////////////////
FAR_Release =
{
	// Switch back to default animation
	(_this select 1) playMove "amovpknlmstpsraswrfldnon";

	FAR_isDragging = false;
};

////////////////////////////////////////////////
// Load Injured Player
////////////////////////////////////////////////
FAR_Load =
{
	// Switch back to default animation
	(_this select 1) playMove "amovpknlmstpsraswrfldnon";

	FAR_isLoading = true;
	FAR_isDragging = false;
};

////////////////////////////////////////////////
// Post Process Effects While Injured
////////////////////////////////////////////////
FAR_InjuredPP =
{
	_unit = _this select 0;
	
	if (!isPlayer _unit) exitWith {};
	
	FAR_WetDistortion = ppEffectCreate ["WetDistortion", 301];
	FAR_WetDistortion ppEffectEnable true;
	FAR_WetDistortion  ppEffectAdjust [0.5, 0, 0, 4.1, 3.7, 2.5, 1.85, 0.0051, 0.0051, 0.0051, 0.0051, 0.5, 0.3, 10, 6.0];
	FAR_WetDistortion ppEffectCommit 99999;

	FAR_chromAberration = ppEffectCreate ["chromAberration", 201];
	FAR_chromAberration ppEffectEnable true;
	FAR_chromAberration ppEffectAdjust [0.2,0.2,false];
	FAR_chromAberration ppEffectCommit 99999;

	FAR_colorCorrections = ppEffectCreate ["colorCorrections", 1501];
	FAR_colorCorrections ppEffectEnable true;
	FAR_colorCorrections ppEffectCommit 0.001;
	FAR_colorCorrections ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.95], [0.0, 0.4, 0.3, 1.0], [0.199, 0.587, 0.114, 0.0]];

	while {alive _unit && _unit getVariable ["FAR_isUnconscious",false] && !(_unit getVariable ["FAR_isStabilized",false])} do
	{
		
		sleep 1;
		
		FAR_colorCorrections ppEffectCommit 2;
		FAR_colorCorrections ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.9], [0.0, 0.4, 0.3, 1.0], [0.199, 0.587, 0.114, 0.0]];
		
		_roll = random 100;
		if (_roll > 90) then
		{
			FAR_colorCorrections ppEffectCommit 0.5;
			FAR_colorCorrections ppEffectAdjust [1.0, 1.0, 0.0, [0.2, 0, 0, 0.5], [0.0, 0.4, 0.3, 1.0], [0.199, 0.587, 0.114, 0.0]];
		
			if (FAR_MuteACRE == 2) then
			{
				cutText ["You can speak.","PLAIN DOWN",0.5];
				
                _unit setVariable ["ace_sys_wounds_uncon", false];
				(findDisplay 46) displayRemoveEventHandler ["KeyDown", FAR_keyEH];
				
				sleep 1;
				if (!alive _unit || !(_unit getVariable ["FAR_isUnconscious",false]) || _unit getVariable ["FAR_isStabilized",false]) exitWith {};
				
				FAR_colorCorrections ppEffectCommit 2;
				FAR_colorCorrections ppEffectAdjust [1.0, 1.0, 0.0, [0, 0, 0, 0.9], [0.0, 0.4, 0.3, 1.0], [0.199, 0.587, 0.114, 0.0]];
				
				sleep 1;
				if (!alive _unit || !(_unit getVariable ["FAR_isUnconscious",false]) || _unit getVariable ["FAR_isStabilized",false]) exitWith {};
				sleep 1;
				if (!alive _unit || !(_unit getVariable ["FAR_isUnconscious",false]) || _unit getVariable ["FAR_isStabilized",false]) exitWith {};
				
				cutText ["","PLAIN DOWN",0];
				
                _unit setVariable ["ace_sys_wounds_uncon", true];
				FAR_keyEH = (findDisplay 46) displayAddEventHandler ["KeyDown", {if (_this select 1 == 1) then {false} else {true}}];
			};
		};
	};
	titleText ["", "BLACK OUT", 1];
	
	sleep 2;
	
	ppEffectDestroy FAR_WetDistortion;
	ppEffectDestroy FAR_chromAberration;
	ppEffectDestroy FAR_colorCorrections;
	
	titleText ["", "BLACK IN", 1];
};

////////////////////////////////////////////////
// Event handler for public variables
////////////////////////////////////////////////
FAR_public_EH =
{
	if(count _this < 2) exitWith {};
	
	_EH  = _this select 0;
	_target = _this select 1;

	// FAR_isDragging
	if (_EH == "FAR_isDragging_EH") then
	{
		_target setDir 180;
	};
	
	// FAR_deathMessage
	if (_EH == "FAR_deathMessage") then
	{
		_killed = _target select 0;
		_killer = _target select 1;

		if (isPlayer _killed && isPlayer _killer) then
		{
			systemChat format["%1 was injured by %2", name _killed, name _killer];
		};
	};
};

////////////////////////////////////////////////
// Revive Action Check
////////////////////////////////////////////////
FAR_Check_Revive = 
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;
	
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",false];
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf player >> "attendant");
	_target = _this;

	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable ["FAR_isUnconscious",false];
	_isDragged = _target getVariable ["FAR_isDragged",false]; 
	
	// Make sure target is unconscious and player is a medic 
	if (_isTargetUnconscious && !_isDragged && (_isMedic == 1 || FAR_ReviveMode == 1 || FAR_ReviveMode == 2) ) then
	{
		_return = true;

		// [ReviveMode] Check if player has a Medikit
		if ( (FAR_ReviveMode == 2 || FAR_ReviveMode == 3) && !("Medikit" in (items player))) then
		{
			_return = false;
		};
	};
	
	_return
};

////////////////////////////////////////////////
// Stabilize Action Check
////////////////////////////////////////////////
FAR_Check_Stabilize = 
{
	private ["_target", "_isTargetUnconscious", "_isDragged"];

	_return = false;
	
	// Unit that will excute the action
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",false];
	_target = _this;
	

	// Make sure player is alive and target is an injured unit
	if( !alive player || _isPlayerUnconscious || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return
	};

	_isTargetUnconscious = _target getVariable ["FAR_isUnconscious",false];
	_isTargetStabilized = _target getVariable ["FAR_isStabilized",false];
	_isDragged = _target getVariable ["FAR_isDragged",false]; 
	
	// Make sure target is unconscious and hasn't been stabilized yet, and player has a FAK/Medikit 
	if (_isTargetUnconscious && !_isTargetStabilized && !_isDragged && ( ("FirstAidKit" in (items player)) || ("Medikit" in (items player)))) then
	{
		_return = true;
	};
	
	_return
};

////////////////////////////////////////////////
// Dragging Action Check
////////////////////////////////////////////////
FAR_Check_Dragging =
{
	private ["_target", "_isPlayerUnconscious", "_isDragged"];
	
	_return = false;
	_target = _this;
	_isPlayerUnconscious = player getVariable ["FAR_isUnconscious",false];

	if( !alive player || _isPlayerUnconscious || FAR_isDragging || isNil "_target" || !alive _target || (!isPlayer _target && !FAR_Debugging) || (_target distance player) > 2 ) exitWith
	{
		_return;
	};
	
	// Target of the action
	_isTargetUnconscious = _target getVariable ["FAR_isUnconscious",false];
	_isDragged = _target getVariable ["FAR_isDragged",false]; 
	
	if(_isTargetUnconscious && !_isDragged) then
	{
		_return = true;
	};
		
	_return
};

////////////////////////////////////////////////
// Loading Action Check
////////////////////////////////////////////////
FAR_Check_Load =
{
	_return = false;
	_vehicle = cursorTarget;
	if (FAR_isDragging && alive _this && alive _vehicle && _vehicle isKindOf "AllVehicles" && _vehicle emptyPositions "cargo" > 0 && _this distance _vehicle < 7 && speed _this == 0) then
	{
		FAR_Vehicle = _vehicle;
		_return = true;
	};
	
	_return;
	
	
};

////////////////////////////////////////////////
// Unloading Action Check
////////////////////////////////////////////////
FAR_Check_Unload =
{
	private "_loadedUnit";
	_return = false;
	_vehicle = cursortarget;
	_loadedUnit = 0;
	
	{
		_loaded = _x getVariable ["FAR_isLoaded",false];
		if (_loaded) then
		{
		 _loadedUnit = _loadedUnit + 1;
		};
	} forEach crew _vehicle;	
	
	if (speed _vehicle < 1 && {_vehicle getVariable ["FAR_VehLoaded", false]} && {!FAR_isDragging} && {_this distance _vehicle < 7} && _loadedUnit > 0) then
	{
		FAR_Vehicle = _vehicle;
		_return = true;
	};
	
	_return
};

////////////////////////////////////////////////
// Show Nearby Friendly Medics
////////////////////////////////////////////////
FAR_IsFriendlyMedic =
{
	private ["_unit"];
	
	_return = false;
	_unit = _this;
	_isMedic = getNumber (configfile >> "CfgVehicles" >> typeOf _unit >> "attendant");
	_hasMedikit = "Medikit" in (items _unit);
	_hasFAK = "FirstAidKit" in (items _unit);
	if ( alive _unit && (isPlayer _unit || FAR_Debugging) && side _unit == FAR_PlayerSide && !(_unit getVariable ["FAR_isUnconscious",false]) && (FAR_ReviveMode == 0 && _isMedic == 1 || FAR_ReviveMode == 1 || FAR_ReviveMode == 2 && _hasMedikit || FAR_ReviveMode == 3 && _hasMedikit && _isMedic == 1) && (!far_ReviveFAK || _hasFAK) ) then
	{
		_return = true;
	};
	
	_return
};

FAR_CheckFriendlies =
{
	private ["_unit", "_units", "_medics", "_hintMsg"];
	
	_units = nearestObjects [getpos player, ["Man", "Car", "Air", "Ship"], 800];
	_medics = [];
	_dist = 800;
	_hintMsg = "";
	
	// Find nearby friendly medics
	if (count _units > 1) then
	{
		{
			if (_x isKindOf "Car" || _x isKindOf "Air" || _x isKindOf "Ship") then
			{
				if (alive _x && count (crew _x) > 0) then
				{
					{
						if (_x call FAR_IsFriendlyMedic) then
						{
							_medics = _medics + [_x];
							
							if (true) exitWith {};
						};
					} forEach crew _x;
				};
			} 
			else 
			{
				if (_x call FAR_IsFriendlyMedic) then
				{
					_medics = _medics + [_x];
				};
			};
			
		} forEach _units;
	};
	
	// Sort medics by distance
	if (count _medics > 0) then
	{
		{
			if (player distance _x < _dist) then
			{
				_unit = _x;
				_dist = player distance _x;
			};
		
		} forEach _medics;
		
		if (!isNull _unit) then
		{
			_unitName	= name _unit;
			_distance	= floor (player distance _unit);
			
			_hintMsg = format["Nearby Medic:\n%1 is %2m away.", _unitName, _distance];
		};
	} 
	else 
	{
		_hintMsg = "No medic nearby.";
	};
	
	_hintMsg
};

