//Briefing stuff
//player createDiaryRecord ["Diary", ["Credits", "
//credits go here
//"]];
/////////////////
player createDiaryRecord ["Diary", ["ACE Medical Settings", "
 - Use server ACE Medical settings<br/>
 <br/>
 Other Mission Settings:<br/>
 - Disabled ACE Hearing<br/>
 - ACE Fatigue disabled.<br/>
 - ACRE2 Terrain loss coefficient reduced<br/>
 
 <br/>
 Any feedback on better tuning these settings is appreciated.<br/>
 

"]];
/////////////////
player createDiaryRecord ["Diary", ["Mission notes", "

Meta mission-maker go here.<br/>
<br/>
Mission Notes:<br/>
 - 'Secondary' markers on map are not objectives, but additional targets or threat locations.<br/>
 - A supply point is available for infantry to rearm in the field if required.<br/>
 - The intention for the Air support assets are for after the crashed pilot is returned to base that they are unlocked for use by both pilots, who would then be called in by the JTACs to support the mission.<br/>
 - Logged admin or zues can force respawn all players by executing the following: execVM ''forceRespawn''.sqf or dropping down the custom a3g zues 'Respawn all' module. <br/>
 - You may choose to skip the crash site objective to play a conventional mission. A logged admin can do this through the radio menu (Press 0-0) <br/>
 - A medical tent at base will allow for a full ACE Medical heal on entry.<br/>
 - Starting Radio channels are set via script for Short range ANPRC343 and ANPRC117F.<br/>
 - A firing range has been placed for CAS pilots to practice on laser designated targets. Static laser targets are placed.<br/>
 <br/>

"]];
/////////////////

player createDiaryRecord ["Diary", ["Radios & Assets", "
Radio Channel Presets:<br/>
<br/>
Short Range Radios - AN/PRC-343:<br/>
 - Alpha Squad - SR preset Ch.1<br/>
 - Bravo Squad - SR preset Ch.2<br/>
 - Recon Squad - SR preset Ch.3<br/>
 - Platoon Team - SR preset Ch.4 / LR Ch.1<br/>
<br/>

Long Range Radios - AN/PRC-148/117F:<br/>
 - Command Net - LR preset Ch.1<br/>
 - Air / JTAC - LR preset Ch.2<br/>
<br/>

Vehicle Assets:<br/>
- MH-60 Transport Helicopter<br/>
- UH-1Y (FFAR, Minigun)      - (Available after Phase 1)<br/>
- A-10  (FFAR, GBU-12)        - (Available after Phase 1)<br/>
   (6x GBU-12: Laser Guided Bomb)<br/>
- MH-60 (FFAR, AGM-114)   - (Available after Phase 1)<br/>
   (4x AGM-114K: Laser Guided Anti-Tank Missile)<br/>
<br/>
A repair and Rearm pad is available for vehicle assets. Stay stationary within the marked area.<br/>

"]];
/////////////////
player createDiaryRecord ["Diary", ["Briefing", "

This mission has two phases, Phase one is to rescue a recon team and pilot, while the Second phase will lead on to conventional objectives to destroy enemy assets.<br/>
<br/>
<br/>
Phase 1: <br/>
A Helicopter extracting a Recon scout team was shot down over enemy territory, your first objective is to rescue the scout team and pilot from hostile territory.<br/>
<br/>
You will begin with all the neccessary equipment to carry out your mission, you should plan out your movements during pre-mission map briefing and board the helicopter at base for immediate deployment for Combat Search and Rescue.<br/>
<br/>
Phase 2: <br/>
The objectives for the second phase of this mission will be revealed on the map after completion of Phase 1. <br/>
This will be a straight forward destruction of key enemy assets, utilize the available Close Air Support assets with your JTACs to effectively neutralize threats and destroy key targets.<br/>

<br/>
Threats:<br/>
 - Armed Technicals<br/>
 - Armor (APCs, IFVs and Possibly Tanks in small numbers)<br/>
 - Static Anti-Aircraft emplacements<br/>
<br/>

Assets:<br/>
 - MH-60 Utility Helicopter<br/>
 - A-10 Close Air Support armed with GBU-12<br/>
 - AH-6 Littlebird gunship<br/>
 - JTACs with Laser Designators<br/>
 - Rearm and Repair pad at base for air assets.<br/>
 <br/>
 NOTE: A-10 and AH-6 assets unlocked after completion of Phase 1. The intention is for the rescued pilot to take one of the air support assets after returning to base.
 <br/>
 <br/>

Read the tasks for further information.

"]];

//Tasks
task1 = player createSimpleTask ["Phase 1: Combat Search and Rescue"];
task1 setSimpleTaskDescription ["

An MH-60 Helicopter was shot down while extracting a reconnaissance and scouting team over enemy territory, move quickly to secure the friendly forces in hostile territory. <br/>

<br/>

NOTES: <br/>
 - Once any member of the scout team is extracted (such as the pilot) additional CAS assets are unlocked for use at the base (AH-6 and A-10) <br/>
 - If there are no Scout team units alive or slotted at mission start, complete this objective by locating and interacting with the downed helicopter. <br/>

","Phase 1: Combat Search and Rescue","CSAR"];
task1 setSimpleTaskDestination (getMarkerPos "csarArea"); 

//Tasks
task2 = player createSimpleTask ["Phase 2: Engage and Destroy"];
task2 setSimpleTaskDescription ["

Engage and destroy enemy assets on the Island. <br/>
<br/>

Information on this objective is revealed after retrieving intelligence and observation records from the downed MH-60 helicopter and scout team. <br/>
<br/>

Targets may include: <br/>
 - Fuel, equipment and/or munition Depots <br/>
 - Communications Infrastructure <br/>
 - Anti-Aircraft and Artillery threats <br/>

","Phase 2: Engage and Destroy","Engage"];
//task2 setSimpleTaskDestination (getMarkerPos "csarArea"); 

/*

//Tasks
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["
task 1 description
","TaskName","TaskName"];
task1 setSimpleTaskDestination (getMarkerPos "taskMarker"); 

*/