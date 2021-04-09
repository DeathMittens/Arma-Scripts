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
 - Disabled ACE Fatigue
 
"]];
/////////////////
player createDiaryRecord ["Diary", ["Mission notes", "

Meta Mission Notes:<br/>
 - Logged admin or zues can force respawn all players using the 'Respawn All Players' custom a3g Zeus module or by executing the following: execVM ''forceRespawn''.sqf; <br/>
 - Starting Radio channels are set via script for Short range ANPRC343 <br/>
 - No mission end trigger: Manually end the mission once completed. <br/>
 - The crossroads objective has a 150 meter radius to clear from the marker location <br/>
 - To complete the Command-Post objective use the action menu on found intel items.<br/>


"]];
/////////////////

player createDiaryRecord ["Diary", ["Assets", "
Radio Channels:<br/>
<br/>
Short Range AN/PRC-343:<br/>
 - Alpha Squad - SR preset Ch.1<br/>
 - Bravo Squad - SR preset Ch.2<br/>
 - Command Team - SR preset Ch.3 / LR Ch.1<br/>
<br/>

Long Range AN/PRC-148/117F:<br/>
 - Command Net - LR preset Ch.1<br/>
<br/>

Assets:<br/>
 - 3x Armoured HMMWV (PKM)<br/>
 - 1x HMMWV (M2)<br/>
 - Transport HMMV, Ural, UAZ <br/>
 - 2x NSV Tripod 12.7mm HMG<br/>
<br/>
Additional equipment, ammuniton and medical supplies can be found in the cargo of the squad vehicles.<br/>


"]];
/////////////////
player createDiaryRecord ["Diary", ["Briefing", "

Setting:<br/>
 - A Middle-eastern civil conflict against foreign funded rebels. <br/>
<br/>

Your Force:<br/>
Light motorized infantry in mixed HMMWVs (Aarmed, armoured and unarmed variants)<br/>
<br/>
Objectives:<br/>
 - The primary objective of this mission is to secure the town of Nagara. The crossroads at Nagara is a key strategic location for the movement of men and materials between the North and South, taking this position would cut off enemy forces in Nur and the western mountain. <br/>
 - We suspect the enemy are recieving support from an as of yet unidentified nation state, air supply drops have been spotted falling on enemy positions during the night. Locate and deny the enemy of the supplies before they can be moved.<br/>
 - A mortar battery has been harrassing friendly positions, the approximate location of the source of fire is marked on your map.<br/>
 - We have intel of an enemy command and communications post in Nagara, secure the command post and any information on site. <br/>
<br/>
Threats:<br/>
 - Hostile forces are well entenched in village areas along the road to Nagara with heavy static weaponry (DShKM) <br/>
 - Enemy Light armour assets are operational in the area (BTR's and BMP-1's) <br/>
 - You may be targeted by artillery until the mortar battery threat is located and neutralized. <br/>
<br/>
Read the tasks for further information.<br/>

"]];




//Task1 - Supplies
task1 = player createSimpleTask ["Supplies"];
task1 setSimpleTaskDescription ["

The enemy forces have been recieving air supply drops at night, it is suspected that a foreign state actor is responsible for supporting the enemy.<br/>
<br/>
The approximate location of the last spotted air-drop is marked on your map. Locate and deny these supplies from the enemy.<br/>

","Supplies","Supplies"];
//task1 setSimpleTaskDestination (getMarkerPos "suppliesObjMark"); 

//Task2 - Mortar
task2 = player createSimpleTask ["Mortar Battery"];
task2 setSimpleTaskDescription ["

The approximate location of an enemy Mortar battery is marked on your Map.<br/>
<br/>
Locate and neutralize the Mortar Battery.<br/>

","Mortar Battery","Mortar Battery"];
//task2 setSimpleTaskDestination (getMarkerPos "mortarObjMark"); 

//Task3 - Crossroads
task3 = player createSimpleTask ["Nagara Crossroads"];
task3 setSimpleTaskDescription ["

The Crossroads at Nagara is a key strategic location for movement and logistics, secure and hold the town center.<br/>

","Crossroads","Crossroads"];
//task3 setSimpleTaskDestination (getMarkerPos "crossroadsObjMark"); 

//Task4 - Intel
task4 = player createSimpleTask ["Command-Post"];
task4 setSimpleTaskDescription ["

The enemy have a forward command-post set up in Nagara, over-run the position and secure any information or intelligence. <br/>
<br/>

","Command-Post","Command-Post"];
//task4 setSimpleTaskDestination (getMarkerPos "crossroadsObjMark"); 


//task2 setSimpleTaskDestination (getMarkerPos "csarArea"); 


/*

//Tasks
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["
task 1 description
","TaskName","TaskName"];
task1 setSimpleTaskDestination (getMarkerPos "taskMarker"); 

*/