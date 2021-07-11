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
 - Random Loadouts: All slots will recieve random weapons and uniforms (FALs/AKs)<br/>
 - Logged admin or zues can force respawn all players using the 'Respawn All Players' custom a3g Zeus module or by executing the following: execVM ''forceRespawn''.sqf; <br/>
 - Helicopter Repair and Refuel is available by landing and waiting in the marked area at base. Ammunition is limited, there is no Re-Arm.<br/>
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
 - Command Team - SR preset Ch.4 / LR Ch.1<br/>
<br/>

Long Range AN/PRC-148/117F:<br/>
 - Command Net - LR preset Ch.1<br/>
 - Air Net - LR preset Ch.2<br/>
<br/>

Assets:<br/>
 - Mi-24V Gunship: S-8 KOM (HEAT) Rockets, UPK-23 Gunpods, Ataka ATGMs, YakB 12.7mm.<br/>
 - Mi-8 Gunship: S-5 KO (HEAT/FRAG) Rockets, UPK-23 Gunpods.<br/>
Additional equipment and medical supplies can be found in the Helicopter cargo.<br/>

"]];
/////////////////
player createDiaryRecord ["Diary", ["Briefing", "

Setting:<br/>
 - Private Contractors fighting in a 90's Angolan Civil War setting.<br/>
 - Rebels are distributing weapons amongst the sympathetic population, destroy the weapon caches to prevent the rebel militias from growing.<br/>
 
<br/>
Your Force:<br/>
 - African Mercenaries with Mi-24/Mi-8 Gunship support.<br/>

<br/>
Objectives:<br/>
 - Locate and destory rebel weapons caches.<br/>
 - Supress rebel leadership.<br/>
 - Quell rebel sentiments with force.<br/>

<br/>
Threats:<br/>
 - Numerous Technicals armed with HMGs<br/>
 - Rebels are operating Light to heavy captured armour (BMP / BTR / T-55 / T-72)<br/>
 - Static anti-aircraft guns (DShKM, Zu-23). Anti-aircraft threats are highest around the North Cache mountains.<br/>
<br/>

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


task1 = player createSimpleTask ["Cancon Cache"]; //hqObj
task1 setSimpleTaskDescription ["

Rebel forces have a weapons and munitions cache in Cancon and are arming sympathetic civilian militias. Locate and destory the weapons cache.<br/>
<br/>

","Cancon Cache","Cache"];

task2 = player createSimpleTask ["Villa"]; //hqObj
task2 setSimpleTaskDescription ["

Assault the Villa, neutralize rebel leadership and secure any documents found at the site.<br/>

","Villa","Villa"];

task3 = player createSimpleTask ["Northern Cache"]; //hqObj
task3 setSimpleTaskDescription ["

Locate and destroy the rebel weapons and munitions cache in the North.<br/>
<br/>
Threats: Rebels have Zu-23 anti-aircraft guns concealed in the mountain areas.<br/>

","Northern Cache","Cache"];

task4 = player createSimpleTask ["Optional: Chapoi Unrest"]; //hqObj
task4 setSimpleTaskDescription ["

Quell unrest in Chapoi<br/>

","Optional: Chapoi Unrest","Chapoi Unrest"];

/*
//Tasks
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["
task 1 description
","TaskName","TaskName"];
task1 setSimpleTaskDestination (getMarkerPos "taskMarker"); 
*/