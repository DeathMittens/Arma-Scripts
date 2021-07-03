sleep 5;

// This file must be used for all DAC configuration to be handed of to the headless client
//
//fun = ["Z1",[111,0,0],[0,0,24,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;

// 5 - APC (BTR/BRDM)
// 6 - IFV (BMP/BMD)
// 7 - Tank (T-72)

// For Armour:
// [4,1,16,8]
// [4 groups, 1 size of group, 16 waypoints ,8 waypoints each]

// Zones

// Bridge obj
fun = ["w11",[111,1,2],[3,3,24,8],[1,1,8,8],[1,1,8,8],[],[0,6,0,0]] spawn DAC_Zone; // East
fun = ["wCamp1",[111,1,2],[],[],[],[1,2,50,1,100,2],[0,5,0,3]] spawn DAC_Zone;

// FARP obj
fun = ["x11",[222,1,2],[3,3,24,8],[],[1,1,8,8],[],[0,5,0,0]] spawn DAC_Zone; // East
fun = ["xCamp1",[222,1,2],[],[],[],[1,2,50,1,100,2],[0,5,0,3]] spawn DAC_Zone;

// AA obj
fun = ["y11",[333,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East

// Arty Obj
fun = ["z11",[444,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East

// Woods patrols
fun = ["p11",[11,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East
fun = ["p22",[22,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East
fun = ["p33",[33,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East

fun = ["p44",[44,1,2],[],[],[1,1,8,8],[],[0,6,0,0]] spawn DAC_Zone; // East

// Test Zone
//fun = ["z1",[1111,1,2],[2,3,16,8],[2,2,16,8],[4,1,16,8],[],[0,5,0,0]] spawn DAC_Zone; // APC
//fun = ["z2",[2222,1,2],[2,3,16,8],[2,2,16,8],[4,1,16,8],[],[0,6,0,0]] spawn DAC_Zone; // IFV
//fun = ["z3",[3333,1,2],[2,3,16,8],[2,2,16,8],[4,1,16,8],[],[0,7,0,0]] spawn DAC_Zone; // tanks

// Factory SCUD Zones
//fun = ["z11",[11,1,2],[1,3,8,8],[1,2,8,8],[2,1,16,8],[],[0,6,0,0]] spawn DAC_Zone; // NW - 2x BMP & Technicals
//fun = ["z22",[22,1,2],[2,3,16,8],[],[1,1,8,8],[],[0,5,0,0]] spawn DAC_Zone; // South - BTR
//fun = ["z33",[33,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // NE
//fun = ["z44",[44,1,2],[1,3,8,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // SE Town

// Elektro - HVT
//fun = ["y11",[111,1,2],[2,3,16,8],[2,2,16,8],[1,1,8,8],[],[0,6,0,0]] spawn DAC_Zone; // NW Field - IFV
//fun = ["y22",[222,1,2],[1,3,8,8],[],[1,1,8,8],[],[0,7,0,0]] spawn DAC_Zone; // SW - Tank
//fun = ["y33",[333,1,2],[1,3,8,8],[],[1,1,8,8],[],[0,5,0,0]] spawn DAC_Zone; // NE - APC????
//fun = ["y44",[444,1,2],[2,3,16,8],[],[],[],[0,6,0,0]] spawn DAC_Zone; // Town-Middle

// Tulga - Arty
//fun = ["x11",[1111,1,2],[1,3,8,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // West road
//fun = ["x22",[2222,1,2],[2,3,16,8],[1,2,8,8],[1,1,8,8],[],[0,5,0,0]] spawn DAC_Zone; // APC
//fun = ["x33",[3333,1,2],[2,3,16,8],[],[],[],[0,5,0,0]] spawn DAC_Zone; // East


// Shamali
//fun = ["z66",[66,1,2],[2,2,16,8],[],[],[],[0,7,0,0]] spawn DAC_Zone;

//fun = ["z77",[77,1,2],[1,2,8,8],[],[],[],[0,7,0,0]] spawn DAC_Zone;

// Obj1
//fun = ["z55",[55,1,2],[3,2,24,8],[],[],[],[0,7,0,0]] spawn DAC_Zone;

// Road
//fun = ["z44",[44,1,2],[3,2,24,8],[],[1,2,8,8],[],[0,7,0,0]] spawn DAC_Zone; // APC/IFV

//Obj 2
//fun = ["z33",[33,1,2],[3,2,24,8],[],[],[],[0,7,0,0]] spawn DAC_Zone;

//Obj 3 - Nagara
//fun = ["z22",[22,1,2],[4,2,32,8],[],[1,2,8,8],[],[0,7,0,0]] spawn DAC_Zone;


// Crash Site Zones
/*
fun = ["Z2",[111,0,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;
fun = ["Z3",[111,0,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;

fun = ["Zcamp1",[111,0,0],[],[],[],[1,2,50,1,100,2],[2,4,0,3]] spawn DAC_Zone;
fun = ["Zcamp2",[111,0,0],[],[],[],[1,2,50,1,100,2],[2,4,0,3]] spawn DAC_Zone;


// Tavu Town Zones
fun = ["Z4",[222,1,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;
//fun = ["Z4",[222,1,0],[3,2,24,8],[0,0,8,4],[],[],[2,4,0,0]] spawn DAC_Zone;

fun = ["Zcamp3",[222,1,0],[],[],[],[1,2,50,1,100,2],[2,4,0,3]] spawn DAC_Zone;

fun = ["Z5",[22222,1,0],[2,2,16,8],[2,2,8,4],[1,2,8,8],[],[2,5,0,0]] spawn DAC_Zone; // Tank spawn? changed to BMP/IFV

// AA Radar Zone
fun = ["Z6",[333,1,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;

// Big field roaming armour
fun = ["Z7",[444,1,0],[],[2,2,16,8],[1,1,8,8],[],[2,4,0,0]] spawn DAC_Zone; // tank spawn?
fun = ["Z7_2",[4444,1,0],[2,2,16,8],[],[1,1,8,8],[],[2,5,0,0]] spawn DAC_Zone; // split out inf, added bmp

// Comms station & Hills patrol
fun = ["Z8",[555,1,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;
fun = ["Z9",[555,1,0],[3,2,24,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;
fun = ["Zcamp4",[555,1,0],[],[],[],[1,2,50,1,100,2],[2,4,0,3]] spawn DAC_Zone;

// Vehicle Depot base
fun = ["Z10",[666,1,0],[3,2,24,8],[2,2,16,8],[1,1,8,8],[],[2,5,0,0]] spawn DAC_Zone; // added light vehicle spawn & BMP/IFV
fun = ["Z11",[666,1,0],[2,2,16,8],[],[],[],[2,4,0,0]] spawn DAC_Zone;
fun = ["Zcamp5",[666,1,0],[],[],[],[1,2,50,1,100,2],[2,4,0,3]] spawn DAC_Zone;
*/
