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

Meta Mission Notes:<br/>
 - Logged admin or zues can force respawn all players using the 'Respawn All Players' custom a3g Zeus module or by executing the following: execVM ''forceRespawn''.sqf; <br/>
 - Starting Radio channels are set via script for Short range ANPRC343 <br/>
 - No mission end trigger: Manually end the mission once completed. <br/>
 - The medical tent will fully heal all ace wounds of anyone inside it. <br/>
 - If you fall off the deck of the carrier, an action is available on the boats on each side to teleport back on board.<br/>
 - Squad and Team leaders have Cable-Ties for the VIP and Capture objectives.<br/>
 - Each destroy objective is destructable by a single demolitions charge.<br/>
 - The Missile Systems may shoot off their missiles on destruction due to ACE cookoffs. Detonate explosive charges at distance (such as on objective extraction) and out of direct line of sight.<br/>
 
 <br/>
 All Intel images:
 <br/>Elektrozavodsk HQ:<br/>
 <img image='briefing\hq-top.jpg' width='300' height='200'/>
 <br/>Tulga:<br/>
 <img image='briefing\arty-top.jpg' width='300' height='200'/>
 <br/>Factory:<br/>
 <img image='briefing\factory-top.jpg' width='300' height='200'/>

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
 - 3x UH-1Y Venom (FFAR, Door-mounted M134 Miniguns<br/>
 - 1x MH-60S Seahawk (Door-Mounted M3M Machineguns)<br/>
 - 1x MV-22B Osprey <br/>
<br/>
Additional equipment, ammuniton and medical supplies can be found in the helicopter cargo.<br/>

"]];
/////////////////
player createDiaryRecord ["Diary", ["Briefing", "

Setting:<br/>
 - This is a continuation from the first Rotor Wash mission, Inspired by the ArmA 2 Harvest Red campaign.<br/>
 - The intervention of a USMC task group in the Chernarus civil war has initiated after evidence was revealed that ChDKZ separatists have carried out warcrimes and genocide on local populations.<br/>
 - This mission involves striking at key targets in support of the USMC amphibious landing on the Southern Chernarussian coast.<br/>
<br/>

Your Force:<br/>
 - Marine Infantry Platoon, airborne deployment.<br/>
<br/>
Objectives:<br/>
 - Elektrozavodsk: ChDZK Separatist HQ and Chernarussian VIP (Rescue)<br/>
 - Tulga: ChDZK Separatist Artillery Battery<br/>
 - Factory: Tactical Ballistic Missile System and Officer (Capture)<br/>
Read the tasks for further information.<br/>
<br/>
Threats:<br/>
 - The ChDKZ are operating several BTRs, BMPs and T-72 MBTs in limited numbers.<br/>
You can expected to encounter ChDKZ armor in Elektrozavodsk and near the Polana Factory.<br/>
 - Anti-Air threats are scattered throughout enemy territory, known threats outside the primary objective areas have been marked on the map.<br/>
These threats are mostly ZU-23 weapon systems and should be avoided if possible.<br/>
 - There are manned anti-aircraft systems at the Polana Factory and Tulga, infantry will need to eliminate these threats before calling in fire-support from the Venom pilots.<br/>
<br/>

"]];

// Task 1 - Elektro
task1 = player createSimpleTask ["Elektrozavodsk: ChDKZ HQ"]; //hqObj
task1 setSimpleTaskDescription ["
The ChDKZ rebels are using the Police station and Administrative building in Elektrozavodsk as their regional command headquarters on the southern Chernarus coast, strike at the ChDKZ leadership in the region by clearing out the HQ.<br/>
<br/>
This will disrupt the ability of ChDKZ forces to coordinate and react to the Marine naval landing and battle for Chernogorsk.<br/>
<br/>
Known threats: T-72 and BMP/BTRs<br/>
<br/>
<img image='briefing\hq-top.jpg' width='300' height='200'/>
","Elektrozavodsk: ChDKZ HQ","ChDKZ HQ"];

// Task 1 - Elektro
task0 = player createSimpleTask ["Elektrozavodsk: VIP"]; //hqVIPObj
task0 setSimpleTaskDescription ["
A Chernarussian VIP is being held captive at the ChDKZ headquarters in Elektrozavodsk. Secure the VIP and extract them back to the USS Khe Sanh.<br/>
<br/>
Note: Squad and Team leaders carry handcuffs to secure and move the VIP.<br/>
<br/>
Known threats: T-72 and BMP/BTRs<br/>
<br/>
<img image='briefing\hq-top.jpg' width='300' height='200'/>
","Elektrozavodsk: VIP","VIP"];

// Task 2 - Arty
task2 = player createSimpleTask ["Tulga: Artillery Battery"]; //artyObj
task2 setSimpleTaskDescription ["
A ChDKZ Artillery battery of three 2S1 Gvozdika 122mm self propelled howitzers is stationed in Tulga and firing upon Chernarus Defence Forces in Chernogorsk.<br/>
<br/>
Eliminate the artillery battery to relieve pressure on our forces fighting over the city.<br/>
<br/>
Known threats: Ant-aircraft emplacements (IGLA, DShKM), BTR/BRDMs.<br/>
<br/>
<img image='briefing\arty-top.jpg' width='300' height='200'/>
","Tulga: Artillery Battery","Artillery Battery"];

// Task 3 - SCUD
task3 = player createSimpleTask ["Factory: SS-21 Scarab"]; //scudObj
task3 setSimpleTaskDescription ["
Forward reconnaissance elements have identified two OTR-21 Tochka (NATO reporting name: SS-21 Scarab) tactical ballsitic missile systems being moved into an abandoned factory just outside of Polana.<br/>
Locate and destory the missile systems before they can be fired on the Marine amphibious landing force.<br/>
<br/>
Note: Destruction of the missile system may result in a significant secondary detonation. Detonate demolition charges well clear of the missile system, at a distance of at least 100 meters.<br/>
<br/>
Known threats: Ant-aircraft emplacements (IGLA, ZU-23), BMP/BTRs.<br/>
<br/>
<img image='briefing\factory-top.jpg' width='300' height='200'/>
","Factory: SS-21 Scarab","SS-21 Scarab"];

// Task 3 - SCUD
task4 = player createSimpleTask ["Factory: Missile Systems Officer"]; //scudHvtObj
task4 setSimpleTaskDescription ["
Forward reconnaissance elements spotted an officer believed to be in command of the Tactical Ballistic Missile systems at the Factory.<br/>
Capture and extract the missile systems officer to the USS Khe Sanh.<br/>
<br/>
Note: Squad and Team leaders carry handcuffs to secure and move the HVT<br/>
<br/>
Known threats: Ant-aircraft emplacements (IGLA, ZU-23), BMP/BTRs.<br/>
<br/>
<img image='briefing\factory-top.jpg' width='300' height='200'/>
","Factory: Missile Systems Officer","Missile Systems Officer"];


/*

//Tasks
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["
task 1 description
","TaskName","TaskName"];
task1 setSimpleTaskDestination (getMarkerPos "taskMarker"); 

*/