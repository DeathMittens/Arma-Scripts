
//Notes

player createDiaryRecord ["Diary", ["Credits", "/a3g/, Anon, etc."]];
player createDiaryRecord ["Diary", ["CTab", "Instructions -
<br/>
Bind a key to 'User Action #12' under controls.
<br/>
While within a CTab enabled vehicle or while having a Commander Tablet or Android device in your inventory press your UserAction#12 key to bring up the interface.
<br/>
<br/>
Unit's with a Helmet Cam item in their inventory can be viewed over CTab, unit's carrying either a Commander Tablet or Android device are tracked and will have their location broadcasted.
"]];


player createDiaryRecord ["Diary", ["Mission Briefing", "Gain a foothold on the North Eastern coastline of Chernarus in preperation for a full CSAT invasion.
<br/>
<br/>
--------TASKS--------
<br/>
The enemy uses the Berezino docks as a logistics center for the distribution of supplys on land, by train and sea.
<br/>
Deny a vital logistical asset to the enemy by detonating their fuel and ammunition supplys before they are transported out of Berezino.
<br/>
<br/>
Locate and disable an Anti-Air battery that is covering the airspace East of the Krasnostav Airstrip, intel suggests searching the location of Grid 129025.
<br/>
<br/>
Take and hold the strategic position 'FOB Manhattan' - Grid 115040. Defend the location from any probable counter-attack.
---------------------
<br/>
<br/>
The Krasnostav Airstrip is believed to be in disuse, with the enemy's aircraft having been relocated west, inland. Only light resistance at the location is expected.
<br/>
<br/>
Squad Leaders, Team Leaders and ships have been equiped with devices on the CTab network, additional handheld devices are available for squad members.

"]];




//Tasks

//
//task1 = player createSimpleTask ["task1"];
//task1 setSimpleTaskDescription ["South East Power Transformer","SE Power",""];
//task1 setSimpleTaskDestination (getMarkerPos "powerSE"); 

//
//task2 = player createSimpleTask ["task2"];
//task2 setSimpleTaskDescription ["West Power Transformer","W Power",""];
//task2 setSimpleTaskDestination (getMarkerPos "powerW"); 

//
//task3 = player createSimpleTask ["task3"];
//task3 setSimpleTaskDescription ["Central Power Transformer","Central Power",""];
//task3 setSimpleTaskDestination (getMarkerPos "powerC"); 

//
//task4 = player createSimpleTask ["task4"];
//task4 setSimpleTaskDescription ["Hill Power Transformer","Hill Power",""];
//task4 setSimpleTaskDestination (getMarkerPos "powerZ"); 

//
task5 = player createSimpleTask ["task5"];
task5 setSimpleTaskDescription ["Logistics Depot supply trucks<br/>Additional information available within the Mission Briefing.","Depot",""];
task5 setSimpleTaskDestination (getMarkerPos "depotMark1"); 

//
task7 = player createSimpleTask ["task7"];
task7 setSimpleTaskDescription ["Coastal Anti-Air Battery<br/>Additional information available within the Mission Briefing.","AA Battery",""];
task7 setSimpleTaskDestination (getMarkerPos "aaMark1");

//
task6 = player createSimpleTask ["task6"];
task6 setSimpleTaskDescription ["Take and hold the strategic hill position 'FOB Manhattan' - Grid 115040<br/>Additional information available within the Mission Briefing.","FOB Manhattan",""];
task6 setSimpleTaskDestination (getMarkerPos "hillmark"); 


