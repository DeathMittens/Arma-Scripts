// initPlayerLocal.sqf

//BluforWins=-1;
//OpforWins=-1;
LastWinner="nil";

playerAlive = false;
playerWaiting = false;
setViewDistance 500; // Low view distance for close range TvT
[] call compile preProcessFileLineNumbers "briefing.sqf";

[false , true] call acre_api_fnc_setupMission; // Set different radio channel presets for each side


// Delete body on respawn
player addEventHandler ["Respawn",{ 
	params ["_newObject","_oldObject"];
	deleteVehicle _oldObject; 
	playerAlive = false;
}];

player addEventHandler ["Killed",{ 
	playerAlive = false;
}];

Display_Score = {
	_scoreText = format["Message: Blufor: %1 Opfor: %2", BluforWins, OpforWins];
	systemChat LastWinner;
	systemChat _scoreText;
};

/*
Update_Doors = {
	sleep 1; // Extra time to ensure update recieved
	if (doorsOpen) then {
		BFence setPosASL BFenceUpPos;
		OFence setPosASL OFenceUpPos;
	} else {
		BFence setPosASL BFenceStartPos; // Reset Fences
		OFence setPosASL OFenceStartPos;
	};
};
*/

Open_Doors = {
	
	params ["_open"]; // Open state true/false
	//sleep 0.5; // not needed?
	
	if (_open) then {
		BFence setPosASL BFenceUpPos;
		OFence setPosASL OFenceUpPos;
	} else {
	
		BFence setPosASL BFenceStartPos; // Reset Fences
		OFence setPosASL OFenceStartPos;
	};
};



 
sleep 0.1;

// Round Handler
while {true} do {

	waitUntil {roundState==1};
	systemChat "Message: Prepare for Round Start.";
	
	_timer = [30, false] call BIS_fnc_countdown; // [0] call BIS_fnc_countdown; // Get time left in seconds (0 if zero, -1 if nil)
	
	while {roundState == 1} do {
		//Timer
		_timeRemaining = [0] call BIS_fnc_countdown;
		
		hintSilent format["Round Starting in \n %1 \n seconds...", _timeRemaining ToFixed 0];
		sleep 0.5;
	};
	
	waitUntil {roundState==2};
	
	//BFence setPosASL BFenceUpPos;
	//OFence setPosASL OFenceUpPos;
	
	
	//player sideChat "Message: Round Started.";
	systemChat "Message: Round Started.";
	playSound3D ["A3\Sounds_F\sfx\blip1.wav", BFence];
	playSound3D ["A3\Sounds_F\sfx\blip1.wav", OFence];
	
	//Start Timer - 300 Seconds (5 Minutes)
	_timer = [300, false] call BIS_fnc_countdown; // [0] call BIS_fnc_countdown; // Get time left in seconds (0 if zero, -1 if nil)
	
	while {roundState == 2} do {
		//Timer
		_timeRemaining = [0] call BIS_fnc_countdown;
		
		hintSilent format["Time Remaining: \n %1", _timeRemaining ToFixed 0];
		sleep 0.5;		
	};
	
	waitUntil {roundState==3};
	
	//BFence setPosASL BFenceStartPos; // Reset Fences
	//OFence setPosASL OFenceStartPos;
	
	//player sideChat "Message: Round Ended.";
	_timer = [30, false] call BIS_fnc_countdown;
	
	systemChat "Message: Round Ended.";
	
		while {roundState == 3} do {
		//Timer
		_timeRemaining = [0] call BIS_fnc_countdown;
		
		hintSilent format["Next round begins in: \n %1 \n seconds...", _timeRemaining ToFixed 0];
		sleep 0.5;		
	};
	
	
};










