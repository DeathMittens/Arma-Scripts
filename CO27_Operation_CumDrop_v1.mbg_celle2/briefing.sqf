//Briefing stuff
//player createDiaryRecord ["Diary", ["Credits", "
//credits go here
//"]];
/////////////////
player createDiaryRecord ["Diary", ["ACE Medical Settings", "
 - Use server ACE Medical Settings<br/>
 <br/>
Other Mission Settings:<br/>
 - Disabled ACE Hearing<br/>
 - ACRE2 Terrain loss coefficient reduced<br/>
 - Disabled ACE Fatigue<br/>
Any feedback on mission ACE Addon settings is appreciated.<br/>
 
"]];
/////////////////
player createDiaryRecord ["Diary", ["Mission notes", "

Meta Mission Notes<br/>
 - IMPORTANT: To paradrop with a backpack, first place your backpack on your chest using self-interact.<br/>
 - You can die when landing in the parachute if you have too much speed, slow before landing.<br/>
 - Only the Commander and Squad Leaders can change the drop zone, all squads will use the same drop zone. (Action menu on the c130)<br/> 
 - Drop zone 1 is the default if none is set.<br/>
 - Soviet forces will counter-attack the bridge, neturalizing the secondary objectives will prevent these soviet assets from participating in the counter attack.<br/>
 - Logged admin or zues can force respawn all players using the 'Respawn All Players' custom a3g Zeus module or by executing the following: execVM ''forceRespawn''.sqf; <br/>
 - Starting Radio channels are set via script for Short range ANPRC343 <br/>
 - No mission end trigger: Manually end the mission once completed. <br/>

 <br/>
 
"]];
/////////////////

player createDiaryRecord ["Diary", ["Assets", "

Radio Channels:<br/>
<br/>
Short Range AN/PRC-343:<br/>
 - Alpha Squad - SR preset Ch.1<br/>
 - Bravo Squad - SR preset Ch.2<br/>
 - Charlie Squad - SR preset Ch.3<br/>
 - Delta Squad - SR preset Ch.4<br/>
 - Command Team - SR preset Ch.5 / LR Ch.1<br/>
<br/>

Long Range AN/PRC-148/117F:<br/>
 - Command Net - LR preset Ch.1<br/>
<br/>

Assets:<br/>
 - Sticks, Stones and parachutes.<br/>
 - Medics will need to put their backpack of medical supplies on their chest before the paradrop.<br/>
   (Self interact > Equipment > Backpack on chest)<br/>
Additional equipment and medical supplies can be found in the C130 cargo.<br/>

"]];
/////////////////
player createDiaryRecord ["Diary", ["Briefing", "

Setting:<br/>
 - 80's Cold War gone hot in Germany against a Soviet offensive.<br/>
 - US/German paratroopers HALO insert before dawn behind Soviet lines to cut off a Mechanized offensive.<br/>
 - Destory key targets then capture and hold the bridge at Winsen to cut off the Soviet mechanized company south of the river.<br/>

<br/>
Your Force:<br/>
 - Light-Infantry Paratroopers. HALO Insertion into enemy territory.<br/>

<br/>
Objectives:<br/>
 - Capture and Hold: Winsen Bridge
 - Disrupt the FARP at Walle supplying Mi-24 Gunships
 - Locate and destory the S-300 SAM Battery
 - Locate and destory the Artillery Battery

<br/>
Threats:<br/>
 - Mechanized and Motorized Soviet infantry platoons (BTR / BMP).<br/>
 - Soviet Infantry are entrenched in urban areas and patrolling the forests.<br/>
 - Artillery, SAM, Mi-24 Gunship (Objectives)<br/>
<br/>

"]];


task1 = player createSimpleTask ["Objective: Bridge"]; //hqObj
task1 setSimpleTaskDescription ["

Main Objective: Bridge at Winsen.<br/><br/>

Capture the bridge at Winsen to cut off the Soviet mechanized company on the south side of the river.<br/>
This is a key position, the Soviet forces can be expected to respond with a counter-attack.<br/>

","Priority: Bridge","Bridge"];

task2 = player createSimpleTask ["Objective: FARP"]; //hqObj
task2 setSimpleTaskDescription ["

Main Objective: FARP at Walle.<br/><br/>

Soviet forces have a Forward Arming and Refuelling point for Mi-24 attack helicopters in Walle.<br/>
Neutralize the FARP and destroy enemy support assets stationed at Walle to deny attack helicopter support on the Soviet bridgehead across the river.<br/>

","Priority: FARP","FARP"];

task3 = player createSimpleTask ["Secondary: SAM"]; //hqObj
task3 setSimpleTaskDescription ["

Secondary Objective: S-300 Surface to Air Missile Battery.<br/><br/>

Locate and neutralize the S-300 SAM battery to allow for air support over the Winsen bridgehead.<br/>

","Secondary - SAM","SAM"];

task1 = player createSimpleTask ["Secondary: Artillery"]; //hqObj
task1 setSimpleTaskDescription ["

Secondary Objective: Artillery Battery.<br/><br/>

Locate and neutralize the Artillery battery supporting Soviet forces across the Winsen Bridge.

","Secondary - Artillery","Artillery"];

/*
//Tasks
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["
task 1 description
","TaskName","TaskName"];
task1 setSimpleTaskDestination (getMarkerPos "taskMarker"); 
*/