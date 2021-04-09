- Farooq's Revive 1.6

=====================================
 Installation
=====================================

Copy FAR_Revive folder and onPlayedKilled.sqf into your mission folder. Add this to the top of your init.sqf:

call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";

If you already have an onPlayedKilled.sqf merge it with your own, don't overwrite it.

=====================================
 Spectate with respawn disabled
=====================================

If you want to disable respawn and allow players to spectate, add "respawn=4;" to your description.ext.

=====================================
comfy blanket branch
=====================================
Bleedout does not reset when revived and you can lose a set amount of bleedout health 
defined by FAR_Drain.

A fourth revive mode has been added that requires a player to both be a medic and have the
medikit on him to revive people.

You can now fireman carry people, simply use the action menu and choose "carry".

Option to require FAKs to revive has been added.

Ability to load injured players into empty vehicle cargo/black slots.

KNOWN ISSUES:
-Prone units will still play the death animation rather than straight rolling to their back.

Changelog:
v1.1
-May have fixed issue in regards to respawning and not being able to be treated when being incapped again.

v1.0
-Fixed issues with everyone appearing as a nearby medic when anyone with a medkit is allowed to revive.
-First Aid Kits are also fixed in that regard.
-Downed units in vehicles can no longer voluntarily eject without someone else unloading them.
-If you are killed in a vehicle you'll have a black screen until unloaded from it, but not when loaded into one.
This is to prevent drivers and gunners from effectively using their vehicle/gun.
Their controls can't be disabled short of disableUserInput (which is bad) or forcing ACRE Mute all the time.
-FAR Revive parameters are placed in the map screen briefing instead of a hint.

v0.9
-Added compatibility for respawning.

v0.8a
-Fixed units falling to the bottom floor (sometimes in the floor) when released in a building.

v0.8
-Fixed the "Mute ACRE" option.
-Added a new option to the "Mute ACRE" variable. If enabled, a player can speak, use the radio, and hear for 3 seconds if their screen flashes red while down (low chance to occur every second). They will also get an indicator telling them they can speak.
-Fixed "jelly" effect staying enabled after death.
-Fixed animation misallignment when a player released someone he was carrying.

v0.7
-Healthy units being unloaded as injured should be fixed.
-Post process effects added when downed. You're no longer completely blind. Stabilizing still removes the "unconcious" effects.
-Expiremental fix for disappearing bodies implemented. Worked with a few people and tons of AI for lag, but needs a real op to see if it works.

v0.6
-Dragging animations implemented for picking up, dragging, and dropping units. Time to drag is still the same.
-Death animation implemented to make it very clear when someone has been incapped and not just going prone.
-Players now properly slump over when injured in vehicles. They are now longer bloodied (a placeholder).
-Various fixes in regards to player alignment with stabilize animation and other minor problems.
-You will be automatically ejected from dead vehicles all the time rather than some of the time.
-You will no longer have a black screen when being unloaded from a vehicle (while stabilized).

v0.5a
-Reviving a player that was stabilized will no longer do a 180 when switching animations.

v0.5
-If you die in a vehicle you will no longer auto-eject. You will need to be unloaded manually. (This should make dangerous runs through hot zones more reliable)
-Your remaining bleedout health and blood loss on next incap will remain visible when stabilized.
-Your vision will remain blacked out until stabilized or revived. (Think of it as regaining conciousness. Matches with the ACRE mute option [which is currently broken].)
-Players who are stabilized will be in a different injured animation to easily determine that someone is stable from a distance.
-Dragging now reapplies the target's "lying down" animation on use. This causes no visual difference in normal circumstances but it's in case someone is stuck in an odd standing animation when unloading from a wrecked vehicle.
-Empty vehicles that had injured cargo unload without using the "Unload Injured" action should no longer have that action appear when empty.

v0.4a
-Injured players are now bloody when loaded into a vehicle as an indicator that he is injured. This is just placeholder since the injured animation doesn't work in multiplayer.
-Bug where a player killed in a vehicle that had no "eject" option would be stuck and have no controls whatsoever should be fixed.

v0.4
-You can now load players into empty cargo/back vehicle slots.

v0.3
-Carrying animation is now better aligned.
-Carried player now uses the "shaking" animation while the person carrying is moving.
-Initialization hint now displays the customized settings.
-Option to require FAKs to revive has been added.

v0.2
-Added fireman's carry.

v0.1
-Persistance bleed out and fourth revive mode added.

=====================================
 Changelog
=====================================

V1.6
* FAR_Revive now uses actions for each fallen person instead of CursorTarget
* FAR_Revive now relies on boolean values for variables instead of using numbers

v1.6alpha
* [NEW] Stabilization: Added the ability for a non-medic to stabilize downed players if he has a FAK or a Medkit in his inventory. After a downed player is stabilized the bleed out timer is removed and he is unmuted (if ACRE muting is enabled).

FAR_revive_funcs.sqf
- FAR_Player_Actions: Added stabilize action
- FAR_Player_Unconscious: Added check if player has been stabilized, if true removes the bleedout timer and unmutes ACRE
- FAR_Check_Stabilize: Checks if player is allowed to stabilize (must have either a FAK or a Medkit in inventory)
- FAR_HandleStabilize: Stabilizes the downed player (same animation as revive), removing FAK if no medkit is present in inventory
- FAR_HandleRevive: Added setVariable to set FAR_isStabilized back to 0

FAR_handleAction.sqf
- Added handler for action_stabilize

FAR_revive_init.sqf
- FAR_Player_Init: Added variable FAR_isStabilized

"FAR_isStabilized"
- Default value is 0
- Set to 1 when player is stabilized, removes the bleedout timer (FAR_HandleStabilize)
- Set to 0 again when player is revived after being stabilized (FAR_HandleRevive)

v1.5
* [NEW] Unconscious units will not be able to use ACRE radio, hear other people or use proximity chat

v1.4d
* [NEW] Revive Modes. 0 = Only medics can revive, 1 = All units can revive, 2 = Same as 1 but a Medikit will be required
* [Fixed] Random black screens
* [Fixed] People dying randomly
* Code improvements

v1.4a
* Compatible with latest version of Arma 3
* [NEW] Casual mode. If enabled, all units will be able to revive (not just medics)

v1.4
* [NEW] Identifies medics without class names. You don't have to manually add class names
* [NEW] Bleedout
* [NEW] Death Messages

v1.3a
* [Fixed] Continuous beeping

v1.3
* [Fixed] Revive not working for some medics
* [Fixed] Medic not detected when inside a vehicle

v1.2
* [NEW] Dragging
* [Fixed] Revive not working if you died in a vehicle

v1.1
* Zero division error fixed

v1.0
* Initial version