//Notes

player createDiaryRecord ["Diary", ["Credits", "/a3g/, anon and Death Mittens."]];
player createDiaryRecord ["Diary", ["Objectives", "You are a professional, A Kebab Removalist. Kebab has occupied our glorious island, do your duty and Remove Kebab.<br/><br/>There are a number of Kebab positons on this side of the island, these include Camp Maxwell and Camp Tempest. Our home of Girna has been occupied, liberate it while avoiding Greek casualites. Destroy the two patrolling Ifrit to allow freedom of movement about the island.<br/><br/>This mission uses a revive script - if you respawn you will return to the starting location, reviving requires a first aid kit.<br/>The mission should end when all primary tasks are completed and blufor units are present at the Old Outpost."]];


//Tasks

task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["Clear Camp Maxwell of Kebab and destroy the Ifrit.","Camp Maxwell",""];
task1 setSimpleTaskDestination (getMarkerPos "obj1"); 

task2 = player createSimpleTask ["task2"];
task2 setSimpleTaskDescription ["Clear Camp Tempest of Kebab and destroy the Boats.","Camp Tempest",""];
task2 setSimpleTaskDestination (getMarkerPos "obj2"); 

task3 = player createSimpleTask ["task3"];
task3 setSimpleTaskDescription ["Liberate Girna from the Kebab.","Girna",""];
task3 setSimpleTaskDestination (getMarkerPos "obj3"); 


//Optional Tasks

task4 = player createSimpleTask ["task4"];
task4 setSimpleTaskDescription ["Destroy the North Ifrit patrol vehicle.","(Optional) Ifrit Patrol North",""];
task4 setSimpleTaskDestination (getMarkerPos "obj4"); 

task5 = player createSimpleTask ["task5"];
task5 setSimpleTaskDescription ["Destroy the South Ifrit patrol vehicle.","(Optional) Ifrit Patrol South",""];
task5 setSimpleTaskDestination (getMarkerPos "obj5"); 


//Tasks

task6 = player createSimpleTask ["task6"];
task6 setSimpleTaskDescription ["Clear LZ Connor and destroy the KA-60.","Ka-60",""];
task6 setSimpleTaskDestination (getMarkerPos "obj6"); 

task8 = player createSimpleTask ["task8"];
task8 setSimpleTaskDescription ["Exfiltrate. Use the offroads at point 'Vehicles' to assist you with this task.","Exfiltrate",""];
task8 setSimpleTaskDestination (getMarkerPos "end"); 