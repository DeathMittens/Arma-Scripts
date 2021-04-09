// initServer.sqf

roundCount = 0;
roundStarted = false;
roundState = 0;

BluforWins = 0; // Track round wins
OpforWins = 0;
doorsOpen = false; // State of spawn doors

lastWinner = "Message: Draw."; // Hold text for team that won the last round

roundTally = "";

publicVariable "roundState";

/*
 roundState = 0;
	- 0: mission start
	- 1: preparation
	- 2: running
	- 3: Post-Round
*/


//Bspawn
//Ospawn

//Bfence
//Ofence


// Round Handler

waitUntil { time > 0 };
sleep 5;

// Fence at spawn for prep phase
BFenceStartPos = getPosASL BFence;
BFenceUpPos = [getPosASL BFence select 0, getPosASL BFence select 1, (getPosASL BFence select 2) + 2.5];

OFenceStartPos = getPosASL OFence;
OFenceUpPos = [getPosASL OFence select 0, getPosASL OFence select 1, (getPosASL OFence select 2) + 2.5];

publicVariable "BFenceStartPos";
publicVariable "BFenceUpPos";
publicVariable "OFenceStartPos";
publicVariable "OFenceUpPos";


//_mapArea = triggerArea mapAreaTrigger; // Get area of play

//testing = true; // Mission testing, set variable true for testing

while {true} do {
	/////////////////////////////////////////
	roundState = 1; // Start preparation phase
	roundCount = roundCount + 1; // Increment round count
	LastWinner = "Message: Draw.";
	publicVariable "roundState";
	hint "Debug: Preparation Stage";
	
	//waitUntil{!testing};
	
	// ToDo: Display countdown timer to players for prep time
	
	sleep 30; // Preparation Time
	/////////////////////////////////////////
	roundState = 2; // Start Round
	publicVariable "roundState";
	hint "Debug: Round Started";
	
	// Move Fences Up
	//BFence setPosASL BFenceUpPos;
	//OFence setPosASL OFenceUpPos;
	doorsOpen = true;
	publicVariable "doorsOpen";
	//[] remoteExec ["Update_Doors"];
	[true] remoteExec ["Open_Doors"];
	
	// ToDo: Display countdown timer to players for round end time
	
	// Play sound at fence
	// Needs to be locally on each player: playSound3D ["A3\Sounds_F\sfx\blip1.wav", player]
	
	// Either 5 minutes pass or all of one side alive are dead
	// Need some way to track 'alive' players? Players on side not ACE unconcious within map area
	// myUnit getVariable ["ACE_isUnconscious", false];, alternatively, disable unconciousness or kill on unconcious
	private _endTime = time + 300; // When the round would end by in seconds // 300 seconds - 5 minutes
	
	//waitUntil {time >= _endTime}; // When time passed OR all dead
	roundStarted = true;	
	
	while {roundStarted} do {

		// Check alive players
		_aliveEast = east countside (allplayers inAreaArray mapAreaTrigger);
		_aliveWest = west countside (allplayers inAreaArray mapAreaTrigger);
		
		if ((_aliveEast == 0) && (_aliveWest == 0)) then {
		roundStarted = false; // Draw
		//hint "Debug: Round Ended - No Players Alive (Draw)";
		
		} else {
				if (_aliveEast == 0) then {
					roundStarted = false; // End the Round
					BluforWins = BluforWins + 1;
					LastWinner = "Message: Blufor won the round.";
					//hint "Debug: Round Ended - Blufor Wins";
			} else {
				if (_aliveWest == 0) then {
					roundStarted = false; // End the Round
					OpforWins = OpforWins + 1;
					LastWinner = "Message: Opfor won the round.";
					//hint "Debug: Round Ended - Opfor Wins";
				};
			};
		};
		
		// Check for round reaching Timeout
		if (roundStarted && time >= _endTime) then {
			roundStarted = false; // End the Round
			//hint "Debug: Round Ended - Timeout (Draw)";
			LastWinner = "Message: Draw. Time limit reached.";
		};

	};
	
	publicVariable "BluforWins";
	publicVariable "OpforWins";
	publicVariable "LastWinner";
	
	sleep 5;
	//hint "Debug: Round Ended!";
	
	[] remoteExec ["Display_Score"];

	
	//{systemChat lastWinner} remoteExec ["call"];
	//
	//roundTally = format["Message: Blufor: %1 Opfor: %2", bluforWins, opforWins];
	//{systemChat _roundTally} remoteExec ["call"]; // May not be able to send with variables?
	
	// Play round end sound here
	
	sleep 10; // Post-round extra time
	/////////////////////////////////////////
	roundState = 3; // Post-Round End, send all to spectators
	publicVariable "roundState";
	//hint "Debug: Reset Players";
	
	// Force respawn all: https://community.bistudio.com/wiki/forceRespawn
	{forceRespawn player} remoteExec ["call"];
	
	
	// Add Here: Clear dead bodies
	// Add Here: Clear items off ground
	
	//BFence setPosASL BFenceStartPos; // Reset Fences
	//OFence setPosASL OFenceStartPos;
	doorsOpen = false;
	publicVariable "doorsOpen";
	[false] remoteExec ["Open_Doors"];
	//[] remoteExec ["Update_Doors"];
	
	// Clear weapons and items off ground
	_startCleanup = diag_tickTime;
	{ deleteVehicle _x; } forEach allDead;
	{ deleteVehicle _x; } forEach nearestObjects [getpos mapAreaTrigger,["WeaponHolder","GroundWeaponHolder","WeaponHolderSimulated"],150];
	//hint format ["Server cleanup took %1 seconds",diag_tickTime - _startCleanup];  
	
	sleep 30; // Allow time for players to talk
	/////////////////////////////////////////	
}

