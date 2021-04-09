
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


player createDiaryRecord ["Diary", ["Notes", "Notes
<br/>
<br/>
Text Goes Here.
<br/>
<br/>
"]];




//Tasks

//
task1 = player createSimpleTask ["task1"];
task1 setSimpleTaskDescription ["Defend yourselves and Survive within the Chernogorsk town square.<br/>Evac helos are expected to arrive and land at the docks within thirty minutes.","Defend","Defend"];
task1 setSimpleTaskDestination (getMarkerPos "AOMark"); 

