/*  
    Author: Death Mittens | /a3g/
    
    Spawn a defined group and occupy nearby buildings using LAMBS Danger Garrison waypoints
    See documentation: https://github.com/nk3nny/LambsDanger/wiki/waypoints
    
    The purpose of this script is for a reusable method to garrison buildings from a trigger late in a mission for performance purposes.
    Settings: All units from the selected _garrisonUnits array will be spawned. Set the side of the spawned group.
    
    Call this script a 'Blufor present' trigger or similar, for example:
        Create group at a marker and garrison nearby buildings within default 50 meters;
            _nul=["garrisonMark1"]execVM "SpawnLAMBSGarrison.sqf";
        Create group at a marker and garrison nearby buildings witin 100 meters radius;         
            _nul=["garrisonMark1",100]execVM "SpawnLAMBSGarrison.sqf";
        Create group at a defined named trigger location and garrison buildings within the area of the trigger;
            _nul=["",0,[], trigger1]execVM "SpawnLAMBSGarrison.sqf";
        Create group within a manually defined area (Not recommended use the trigger instead.):
            _nul=["garrisonMark1",50,[500,500,0,True]]execVM "SpawnLAMBSGarrison.sqf"
        Create group at a marker location, group will move to garrison buildings on foot form where they spawn:
            _nul=["garrisonMark1",0,[], trigger1, false]execVM "SpawnLAMBSGarrison.sqf";
        
        Added - Parameter for selecting a preset squad size defined in the below settings
            _nul=["",0,[], trigger1, True, 6]execVM "SpawnLAMBSGarrison.sqf"; // 6 - would use _garrisonUnits6
    
        Added - Enable custom loadout parameter
            _nul=["",0,[], trigger1, True, 0, true]execVM "SpawnLAMBSGarrison.sqf"; // True - Calls _Spawn_Loadout for each unit created.
*/
if (!isServer) exitWith {}; // Run Only On Server. This method may not support Headless Client.
 
//!---------User Settings--------!//
 
// Define all members of the spawning group - Default group:
_garrisonUnits = ["rhsgref_tla_g_squadleader","rhsgref_tla_g_machinegunner","rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_specialist_at","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman_pm63","rhsgref_tla_g_rifleman_akms","rhsgref_tla_g_rifleman_akms"]; // Large 12 man group (Town garrison)
 
// Additional group size parameter presets
_garrisonUnits2 = ["rhsgref_tla_g_squadleader","rhsgref_tla_g_machinegunner","rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_specialist_at","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman_pm63","rhsgref_tla_g_rifleman_akms"]; // 8 man mixed group
_garrisonUnits3 = ["rhsgref_tla_g_squadleader","rhsgref_tla_g_machinegunner","rhsgref_tla_g_specialist_at","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman_pm63","rhsgref_tla_g_rifleman_vz58"]; // 6 Mixed units
_garrisonUnits4 = ["rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_rifleman_akms","rhsgref_tla_g_rifleman","rhsgref_tla_g_rifleman"]; // 4 riflemen
_garrisonUnits5 = ["rhsgref_tla_g_rifleman_vz58","rhsgref_tla_g_rifleman_akms","rhsgref_tla_g_rifleman"]; // 3 Riflemen
_garrisonUnits6 = ["rhsgref_tla_g_grenadier","rhsgref_tla_g_machinegunner","rhsgref_tla_g_specialist_at"]; // 3 specialists
 
// Define the group side. Options are: West, east & resistance
_side = resistance;
 
//Loadout Function - Optionally enabled
_Spawn_Loadout = {
    private _unit = _this select 0; // unit selected param
    // Define your custom loadout or additional settings here:
    _unit setSkill 0.3;
    
    /* Examples:
    _unit addHeadgear selectRandom ["H_ShemagOpen_tan", "H_Shemag_olive", "H_ShemagOpen_khk", "H_Bandanna_gry"];
    _unit setSpeaker selectRandom ["Male01PER", "Male02PER", "Male03PER"];
    */
};
 
//!------------------------------!//
 
// Parameters for script call 
_spawnMarker = _this param [0, "nul", [""]]; // Map Marker name, defaults to empty, if empty will use a trigger position
_radius = _this param [1,50,[0]]; // Optional Param: Radius to garrison. Default = 50. Will also need to match the AREA if used
_spawnArea = _this param [2, [], [[]]]; // Optional Param: Area to garrison. Default = empty (uses radius).
//spawnArea variable Format: https://community.bistudio.com/wiki/inArea
_trigger = _this param [3, [], []]; // Using the position, size and rotation of a trigger for the garrison area. Overrides the above.
_teleport = _this param [4, true, [false]]; // Teleport units to positions, change to false to the group move into building positions from where they spawn.
_size = _this param [5, 0, [0]]; // Preset group sizes
_loadout = _this param [6, false, [false]]; // Param to enable adding custom loadout to spawned group
 
// Preset group sizes
switch (_size) do {
    case 1: {}; // 0 or 1 - No nothing, default group
    case 2: {_garrisonUnits = _garrisonUnits2}; // Preset 2
    case 3: {_garrisonUnits = _garrisonUnits3}; // Preset 3
    case 4: {_garrisonUnits = _garrisonUnits4}; // Preset 4
    case 5: {_garrisonUnits = _garrisonUnits5}; // Preset 5
    case 6: {_garrisonUnits = _garrisonUnits6}; // Preset 6
};
 
_spawnPos = [0,0,0]; // initialize variable
 
// if a Trigger is used for the Area, Get the dimensions of the trigger and assign as the spawn area
if (_trigger isNotEqualTo []) then {
    // Trigger Area used
    
    _triggerArea = triggerArea _trigger;
    _spawnArea = _triggerArea;
    
    // Set Radius to double of the largest vaule of height/width
    if ((_triggerArea select 0) > (_triggerArea select 1)) then {
        _radius = _triggerArea select 0; // Width is larger
    } else {
        _radius = _triggerArea select 1; // Height is larger 
    };
    
    // Use position of trigger or map marker
    if (_spawnMarker isNotEqualTo "nul") then {
        _spawnPos = position _trigger; // Use trigger position to spawn units and for referencing debug map marker
    } else {
        _spawnPos = getMarkerPos _spawnMarker; // Use map marker position to spawn units (if not teleporting units into positions immediately)
    };
    
    // create Map marker debug in singleplayer/editor
    if (!isMultiplayer) then {      
        _xPos = position _trigger select 0;
        _yPos = position _trigger select 1;
        
        _xWidth = _triggerArea select 0; // Trigger Width
        _yHeight = _triggerArea select 1; // Trigger Height
        _rotation = _triggerArea select 2; // Trigger Rotation      
 
        _markerstr = createMarker [str("Garrison_Mark_"+str(_trigger)), [_xPos,_yPos,0]]; // Create marker with unique name (using trigger name)
        _markerstr setMarkerShape "RECTANGLE";
        _markerstr setMarkerSize [_xWidth, _yHeight];
        _markerstr setMarkerDir  _rotation;
        
        hint format["DEBUG: SpawnGarrison \n width: %1, height: %2, \n rotation: %3,\n x: %4, y: %5",_xWidth, _xWidth, _rotation, _xPos, _yPos];
    };
    
} else {
    // Use position of an input map marker and radius
    _spawnPos = getMarkerPos _spawnMarker;
};
 
//Group creation - Spawn all units in array.
_Group1 = CreateGroup _side;
{
    _unit = _Group1 createUnit [_x, _spawnPos , [], 3, "FORM"];
    
    // Custom loadout options
    if (_loadout) then { 
        // Call defined loadout function
        [_unit] call _Spawn_Loadout;
    }
    
}forEach _garrisonUnits;
_leader = leader _Group1;
 
// Call the LAMBS Danger garrison waypoint function
[_group1,_spawnPos,_radius,_spawnArea,_teleport] call lambs_wp_fnc_taskGarrison; // Call LAMBS garrison function
 
/*
taskGarrison - https://github.com/nk3nny/LambsDanger/wiki/waypoints
 
The AI will take up building positions and man static weapons within a set range. Units will remain static until a triggered, the trigger may be taking damage, shooting weapons, or being near an enemy fire.
 
    Arguments:
 
    0: Group performing action, either unit <OBJECT> or group <GROUP>
    1: Position to occupy, default group location <ARRAY or OBJECT>
    2: Range of tracking, default is 50 meters <NUMBER>
    3: Area the AI Camps in, default [] <ARRAY>
    4: Teleport Units to Position <BOOL>
    5: Sort Based on Height <BOOL>
    6: Exit Conditions that breaks a Unit free (-2 Random, -1 All, 0 Hit, 1 Fired, 2 FiredNear), default -2 <NUMBER>
    7: Sub-group patrols the area <BOOL>
 
[bob, bob, 50] call lambs_wp_fnc_taskGarrison;
*/
