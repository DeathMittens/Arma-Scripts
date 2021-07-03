// addParachute.sqf
hintSilent "Adding a parachute...";

if (backpack player != "B_Parachute") then {
	player addBackpack "B_Parachute";
};
