//
// Farooq's Revive 1.6
//
// comfy blanket branch v1.1
//
//------------------------------------------//
// Parameters - Feel free to edit these
//------------------------------------------//

// Seconds until unconscious unit bleeds out and dies. Set to 0 to disable.
FAR_BleedOut = 300;	

// Enable teamkill notifications
FAR_EnableDeathMessages = true;

/*
	0 = Unconscious units can use the radio, proximity chat, and hear other people.
	1 = Unconscious units cannot use the radio, proximity chat, and hear other people.
	2 = Unconscious units can use the radio, proximity chat, and hear other people while their screen pulses red.
*/
FAR_MuteACRE = 0;

/*
	0 = Only medics can revive
	1 = All units can revive
	2 = Same as 1 but a medikit is required to revive
	3 = Same as 0 but a medikit is required to revive
*/
FAR_ReviveMode = 0;

//Amount of bleedout time (in seconds) lost whenever you are revived
FAR_Drain = 60;

//Require medics to use FAKs to revive
FAR_ReviveFAK = false;

//------------------------------------------//

call compile preprocessFile "FAR_revive\FAR_revive_funcs.sqf";

#define SCRIPT_VERSION "1.6"
#define BRANCH_VERSION "1.1"

FAR_isDragging = false;
FAR_isDragging_EH = [];
FAR_deathMessage = [];
FAR_isLoading = false;
FAR_Debugging = false;

if (isDedicated) exitWith {};

////////////////////////////////////////////////
// Player Initialization
////////////////////////////////////////////////
[] spawn
{
    waitUntil { !isNull player };

	// Public event handlers
	"FAR_isDragging_EH" addPublicVariableEventHandler FAR_public_EH;
	"FAR_deathMessage" addPublicVariableEventHandler FAR_public_EH;
	
	[] spawn FAR_Player_Init;

	/*
	//Starting hint with settings displayed
	FAR_InitHint = format ["Farooq's Revive v%1\ncomfy blanket Branch v%2\n\nSettings:\n",SCRIPT_VERSION,BRANCH_VERSION];
	
	switch (FAR_MuteACRE) do
	{
		case 0: {FAR_InitHint = FAR_InitHint + format["Unconscious units can use the radio, proximity chat, and hear other people."]};
		case 1:
		{
			[] spawn FAR_Mute_ACRE;
			FAR_InitHint = FAR_InitHint + format["Unconscious units cannot use the radio, proximity chat, and hear other people."];
		};
		case 2:
		{
			[] spawn FAR_Mute_ACRE;
			FAR_InitHint = FAR_InitHint + format["Unconscious units can use the radio, proximity chat, and hear other people while their screen pulses red."];
		};
	};
	
	if (FAR_EnableDeathMessages) then
	{
		FAR_InitHint = FAR_InitHint + format["\n\nDeath message are enabled."];
	}
	else
	{
		FAR_InitHint = FAR_InitHint + format["\n\nDeath message are disabled."];
	};
	
	switch (FAR_ReviveMode) do
	{
		case 0: {FAR_InitHint = FAR_InitHint + format["\n\nOnly medics can revive. Medikit is not required."]};
		case 1: {FAR_InitHint = FAR_InitHint + format["\n\nAnyone can revive. Medikit is not required."]};
		case 2: {FAR_InitHint = FAR_InitHint + format["\n\nAnyone can revive. Medikit is required."]};
		case 3: {FAR_InitHint = FAR_InitHint + format["\n\nOnly medics can revive. Medikit is required."]};
	};
	
	FAR_InitHint = FAR_InitHint + format["\n\nTotal bleedout health: %1 seconds",FAR_BleedOut];
	
	FAR_InitHint = FAR_InitHint + format["\n\nBleedout health lost on incap: %1 seconds",FAR_Drain];
	
	if (FAR_ReviveFAK) then
	{
		FAR_InitHint = FAR_InitHint + format["\n\nFirst aid kit is required to revive."];
	}
	else
	{
		FAR_InitHint = FAR_InitHint + format["\n\nFirst aid kit is not required to revive."];
	};
	
	hintSilent FAR_InitHint;
	*/
	
	//Diary Entry
	FAR_InitHint = format ["Farooq's Revive v%1<br/>comfy blanket Branch v%2<br/><br/>Settings:<br/>",SCRIPT_VERSION,BRANCH_VERSION];
	
	switch (FAR_MuteACRE) do
	{
		case 0: {FAR_InitHint = FAR_InitHint + format["Unconscious units can use the radio, proximity chat, and hear other people."]};
		case 1:
		{
			[] spawn FAR_Mute_ACRE;
			FAR_InitHint = FAR_InitHint + format["Unconscious units cannot use the radio, proximity chat, and hear other people."];
		};
		case 2:
		{
			[] spawn FAR_Mute_ACRE;
			FAR_InitHint = FAR_InitHint + format["Unconscious units can use the radio, proximity chat, and hear other people while their screen pulses red."];
		};
	};
	
	if (FAR_EnableDeathMessages) then
	{
		FAR_InitHint = FAR_InitHint + format["<br/><br/>Death message are enabled."];
	}
	else
	{
		FAR_InitHint = FAR_InitHint + format["<br/><br/>Death message are disabled."];
	};
	
	switch (FAR_ReviveMode) do
	{
		case 0: {FAR_InitHint = FAR_InitHint + format["<br/><br/>Only medics can revive. Medikit is not required."]};
		case 1: {FAR_InitHint = FAR_InitHint + format["<br/><br/>Anyone can revive. Medikit is not required."]};
		case 2: {FAR_InitHint = FAR_InitHint + format["<br/><br/>Anyone can revive. Medikit is required."]};
		case 3: {FAR_InitHint = FAR_InitHint + format["<br/><br/>Only medics can revive. Medikit is required."]};
	};
	
	FAR_InitHint = FAR_InitHint + format["<br/><br/>Total bleedout health: %1 seconds",FAR_BleedOut];
	
	FAR_InitHint = FAR_InitHint + format["<br/><br/>Bleedout health lost on incap: %1 seconds",FAR_Drain];
	
	if (FAR_ReviveFAK) then
	{
		FAR_InitHint = FAR_InitHint + format["<br/><br/>First aid kit is required to revive."];
	}
	else
	{
		FAR_InitHint = FAR_InitHint + format["<br/><br/>First aid kit is not required to revive."];
	};
	
	player createDiarySubject ["FAR_ReviveDiary","FAR Revive"];
	player createDiaryRecord ["FAR_ReviveDiary", ["Parameters", FAR_InitHint]];
	
	// Event Handlers
	player addEventHandler 
	[
		"Respawn", 
		{ 
			[] spawn FAR_Player_Init;
		}
	];
};

FAR_Player_Init =
{
	// Cache player's side
	FAR_PlayerSide = side player;

	// Clear event handler before adding it
	player removeAllEventHandlers "HandleDamage";

	player addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
	player addEventHandler 
	[
		"Killed",
		{
			// Remove dead body of player (for missions with respawn enabled)
			_body = _this select 0;
			
			[_body] spawn 
			{
				waitUntil { alive player };
				_body = _this select 0;
				deleteVehicle _body;
			}
		}
	];
	
	player setVariable ["FAR_isUnconscious", false, true];
	player setVariable ["FAR_isStabilized", false, true];
	player setVariable ["FAR_isDragged", false, true];
	player setVariable ["ace_sys_wounds_uncon", false];
	player setVariable ["FAR_isLoaded", false, true];
	player setVariable ["FAR_inVehicle", false, true];
	player setCaptive false;

	FAR_isDragging = false;
	
	//Prevents the bleedout from ticking multiple times. This is a result of the persistant bleedout not being able to use the "time" command.
	FAR_MultiBug = true;
	
	[] spawn FAR_Player_Actions;
	[] spawn FAR_Vehicle_Actions;
};

// Drag & Carry animation fix
[] spawn
{
	while {true} do
	{
		if (animationState player == "acinpknlmstpsraswrfldnon_acinpercmrunsraswrfldnon" || animationState player == "helper_switchtocarryrfl" || animationState player == "AcinPknlMstpSrasWrflDnon") then
		{
			if (FAR_isDragging) then
			{
				player switchMove "AcinPknlMstpSrasWrflDnon";
			}
			else
			{
				player switchMove "amovpknlmstpsraswrfldnon";
			};
		};
			
		sleep 3;
	}
};

FAR_Mute_ACRE =
{
	waitUntil { time > 0 };

	waitUntil 
	{
		if (alive player) then 
		{
			// player getVariable ["ace_sys_wounds_uncon", true/false];
			if ((player getVariable["ace_sys_wounds_uncon", false])) then 
			{
				private["_saveVolume"];

				_saveVolume = acre_sys_core_globalVolume;

				player setVariable ["acre_sys_core_isDisabled", true, true];
				
				waitUntil 
				{
					acre_sys_core_globalVolume = 0;

					if (!(player getVariable["acre_sys_core_isDisabled", false])) then 
					{
						player setVariable ["acre_sys_core_isDisabled", true, true];
						[true] call acre_api_fnc_setSpectator;
					};

					!(player getVariable["ace_sys_wounds_uncon", false]);
				};

				if ((player getVariable["acre_sys_core_isDisabled", false])) then 
				{
					player setVariable ["acre_sys_core_isDisabled", false, true];
					[false] call acre_api_fnc_setSpectator;
				};

				acre_sys_core_globalVolume = _saveVolume;
			};
		} 
		else 
		{
			waitUntil { alive player };
		};

		sleep 0.25;

		false
	};
};

//Multiplayer switchMove
switchMoveMP =
{
	_this select 0 switchMove (_this select 1);
};

playMoveMP =
{
	_this select 0 playMove (_this select 1);
};

setDirMP =
{
	_this select 0 setDir (_this select 1);
};

carryDropMP =
{
	_target = _this select 0;
	_caller = _this select 1;
	_loading = _this select 2;
	_target attachTo [_caller, [0.7, -0.1, 0]];
	detach _target;
	/*
	_target setDir (getDir _caller) + 180;
	if (_target getVariable ["FAR_isStabilized",false] && !_loading) then
	{
		_target setDir ((getDir _target) + 180);
	};
	*/
};

moveInCargoMP =
{
	_target = _this select 0;
	_target moveInCargo (_this select 1);
	waitUntil
	{
		vehicle _target != _target;
	};
	sleep 1;
	//_target playMove "AinjPpneMstpSnonWrflDnon_rolltoback";
	[[_target, "AinjPpneMstpSnonWrflDnon_rolltoback"], "playMoveMP",true,false] call BIS_fnc_MP;
};

enableSimulationMP =
{
	_this select 0 enableSimulation (_this select 1);
};

getPosMP =
{
	_caller = _this select 0;
	_target = _this select 1;
	_pos = getPosATL _target;
	[[_caller, _target, _pos], "detachMP",true,false] call BIS_fnc_MP;
};

detachMP =
{
	
	_caller = _this select 0;
	_target = _this select 1;
	_pos = _this select 2;
	if (player == _caller) then
	{
		detach _target;
		_target setVariable ["FAR_isDragged", false, true];
	};
	
	waitUntil
	{
		!(_target getVariable ["FAR_isDragged", false]);
	};
	
	_target setPos _pos;
};

////////////////////////////////////////////////
// [Debugging] Add revive to playable AI units
////////////////////////////////////////////////
if (!FAR_Debugging || isMultiplayer) exitWith {};
//if (!FAR_Debugging) exitWith {};

private "_units";
if (isMultiplayer) then
{
	_units = playableUnits;
}
else
{
	_units = switchableUnits;
};
	
{
	if (!isPlayer _x) then 
	{
		_x addEventHandler ["HandleDamage", FAR_HandleDamage_EH];
		_x setVariable ["FAR_isUnconscious", false, true];
		_x setVariable ["FAR_isStabilized", false, true];
		_x setVariable ["FAR_isDragged", false, true];
	};
} forEach _units;

