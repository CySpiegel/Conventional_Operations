// Music Mission EventHandler////////////////////////////////////////////////////////////

addMusicEventHandler ["MusicStop", {
_allTracks = [ 
"LeadTrack01_F_EPA", 
"LeadTrack02_F_EPA",
"LeadTrack01_F",
"MainTheme_F_Tank",
"LeadTrack01_F_Mark",
"AmbientTrack03_F",
"AmbientTrack04a_F",
"BackgroundTrack01_F",
"Track02_SolarPower",
"Track14_MainMenu",
"EventTrack01a_F_EPA",
"EventTrack01_F_EPA",
"EventTrack02a_F_EPA",
"EventTrack03_F_EPA",
"EventTrack03a_F_EPA",
"LeadTrack01_F_EPB",
"LeadTrack02_F_EPC",
"LeadTrack04_F_EPC",
"LeadTrack06_F_EPC",
"LeadTrack06b_F_EPC",
"BackgroundTrack03_F_EPC",
"LeadTrack02_F_EXP",
"AmbientTrack01_F_EXP",
"AmbientTrack02_F_EXP",
"LeadTrack02_F_Jets",
"LeadTrack01_F_Orange"
]; 


_Track = selectRandom _allTracks;
playMusic _Track;

}];


//Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////Server Script //////////

if (isServer) then {
	
 if (markerText "Friendly_Handle" == "CUSTOM_PLAYER_FACTION") then {  null = execVM "CUSTOM_PLAYER_FACTION.sqf" };
 if (markerText "Enemy_Handle" == "CUSTOM_ENEMY_FACTION") then {  null = execVM "CUSTOM_ENEMY_FACTION.sqf" };
 if (markerText "Civilian_Handle" == "CUSTOM_CIVILIAN_FACTION") then {  null = execVM "CUSTOM_CIVILIAN_FACTION.sqf" };

};


//All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script ////////

sleep 5 ; 



_Enemy = execVM "Scripts\Enemy_Vars.sqf"; 
waitUntil { scriptDone _Enemy };

_Friendly = execVM "Scripts\Friendly_Vars.sqf"; 
waitUntil { scriptDone _Friendly };

_Civilian = execVM "Scripts\Civilian_Vars.sqf"; 
waitUntil { scriptDone _Civilian };





//////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script ////////

MENU_COMMS_SUPPLYDROP =
[
	["MenuName", true],
	["Vehicle Quad Bike 10$", [2], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_QDB.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Vehicle Quad Bike 25$", [2], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_QDB.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["OP Container 100$", [3], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_OP.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["FOB Container 5000$", [4], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_FOB.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Supplies VEHICLE AMMO 15$", [5], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_EXP.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Supplies WEAPONS 15$", [6], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_WPN.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Supplies LAUNCHERS 15$", [7], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_LNC.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Supplies AMMUNITION 15$", [8], "", -5, [["expression", "execVM 'Scripts\SupplyDrop_AMM.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"]
];

MENU_COMMS_UAV_RECON =
[
	["MenuName", true],
	["Call UAV_01 80$", [2], "", -5, [["expression", "execVM 'Scripts\CallUAV1.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call UAV_02 80$", [3], "", -5, [["expression", "execVM 'Scripts\CallUAV2.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call UAV_03 80$", [4], "", -5, [["expression", "execVM 'Scripts\CallUAV3.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call UAV AR_2 Darter 80$", [5], "", -5, [["expression", "execVM 'Scripts\CallUAV0.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"]
];

MENU_COMMS_CAS_HELI =
[
	["MenuName", true],
	["Call Transport Helicopter 60$", [2], "", -5, [["expression", "execVM 'Scripts\CallTRS.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call Transport Helicopter (Engineers Squad) 60$ + 10$", [3], "", -5, [["expression", "execVM 'Scripts\CallTRSFE.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call Transport Helicopter (Assault Squad) 60$ + 30$", [4], "", -5, [["expression", "execVM 'Scripts\CallTRSFA.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call Transport Helicopter (Recon Squad) 60$ + 60$", [5], "", -5, [["expression", "execVM 'Scripts\CallTRSFR.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call CAS Gunship Helicopter 80$", [6], "", -5, [["expression", "execVM 'Scripts\CallCAS.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call CAS Strike (Bombs) 70$", [7], "", -5, [["expression", "execVM 'Scripts\CallCASB.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call CAS Strike (Gun & Missiles) 70$", [8], "", -5, [["expression", "execVM 'Scripts\CallCASG.sqf';"]], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"]
];

MENU_COMMS_ARTI =
[
	["MenuName", true],
	["Call Artillery Fire Mission (Mortars) 30$", [2], "#USER:MENU_COMMS_Mortars", -5, [], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call Artillery Fire Mission (Artillery)  40$", [3], "#USER:MENU_COMMS_Artillery", -5, [], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"],
	["Call Artillery Fire Mission (Rockets) 50$", [4], "#USER:MENU_COMMS_Rockets", -5, [], "1", "1", "\A3\ui_f\data\IGUI\Cfg\Cursors\iconcursorsupport_ca.paa"]
];

MENU_COMMS_Mortars =
[
	["Call Artillery Fire Mission (Mortars) 30$", false],
	["82mm HE Shells X3", [2], "", -5, [["expression", "['Sh_82mm_AMOS', 3] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["82mm HE Shells X6", [3], "", -5, [["expression", "['Sh_82mm_AMOS', 6] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["82mm HE Shells X9", [4], "", -5, [["expression", "['Sh_82mm_AMOS', 9] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Smoke Shells X3", [5], "", -5, [["expression", "['Smoke_82mm_AMOS_White', 3] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Smoke Shells X6", [6], "", -5, [["expression", "['Smoke_82mm_AMOS_White', 6] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Flares Shells X3", [7], "", -5, [["expression", "['Flare_82mm_AMOS_White', 3] execVM 'Scripts\CallAR.sqf';"]], "1", "1"]
];

MENU_COMMS_Artillery =
[
	["Call Artillery Fire Mission (Artillery)  40$", false],
	["155mm HE Shells X3", [2], "", -5, [["expression", "['Sh_155mm_AMOS', 3] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["155mm HE Shells X6", [3], "", -5, [["expression", "['Sh_155mm_AMOS', 6] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["155mm HE Shells X9", [4], "", -5, [["expression", "['Sh_155mm_AMOS', 9] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Smoke Shells X3", [5], "", -5, [["expression", "['Smoke_120mm_AMOS_White', 3] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Smoke Shells X6", [6], "", -5, [["expression", "['Smoke_120mm_AMOS_White', 6] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["AP Mine Shells X1", [7], "", -5, [["expression", "['Mine_155mm_AMOS_range', 2] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["AT Mine Shells X1", [8], "", -5, [["expression", "['AT_Mine_155mm_AMOS_range', 2] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["Cluster Shells X1", [9], "", -5, [["expression", "['G_40mm_HEDP', 1] execVM 'Scripts\CallAR.sqf';"]], "1", "1"]
];

MENU_COMMS_Rockets =
[
	["Call Artillery Fire Mission (Rockets) 50$", false],
	["230mm HE Rockets  X4", [2], "", -5, [["expression", "['R_230mm_HE', 4] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["230mm HE Rockets  X8", [3], "", -5, [["expression", "['R_230mm_HE', 8] execVM 'Scripts\CallAR.sqf';"]], "1", "1"],
	["230mm HE Rockets  X12", [4], "", -5, [["expression", "['R_230mm_HE', 12] execVM 'Scripts\CallAR.sqf';"]], "1", "1"]
];

//////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script //////////All Script ////////

if ((isServer) && !(didJIP)) then {
	
_AIRs = nearestobjects [[0,0,0],[
F_Plane_01_CAS,
F_Plane_02_CAS,
F_Plane_03,
F_Plane_04,
F_Plane_05,
F_Plane_06
],40000] ;

{
	{
		[_x] ordergetin false; 
		unassignvehicle _x;  
		doGetOut _x;  
	 } foreach crew _x; 
} foreach  _AIRs; 

};



if ((typeOf player == "B_G_officer_F")) then {

player setUnitLoadout F_Officer;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'B_UavTerminal';
player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player linkItem 'B_UavTerminal';

[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
};

if ((typeOf player == "B_G_engineer_F")) then {
player setUnitLoadout F_Assault_Eng;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'B_UavTerminal';
player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'MineDetector';

[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	


	{[ _x,
'Repair | Refuel | Rearm 5$',
'Screens\FOBA\iconRepairAt_ca.paa',
'Screens\FOBA\iconRepairAt_ca.paa',
'count nearestobjects [ (position player), ["Air", "Ship", "LandVehicle"], 6] > 0',       
'_caller distance _target < 7',  
{},
{},
{
_Cost = 5 ;
_mrkrs = allMapMarkers select {markerColor _x == 'Color2_FD_F'};
_mrkr = _mrkrs select 0;
_Money = parseNumber (markerText _mrkr) ;  
if (_Money >= _Cost) then {
_NewMoney = _Money - _Cost; 
_mrkr setMarkerText str _NewMoney;

_nearVeh = nearestObjects [Player,['Air','Ship','LandVehicle'],10] select 0; 
_nearVeh setDammage 0;
_nearVeh setFuel 1;
_nearVeh setVehicleAmmo 1;
}else{hint 'Not Enough Recources';};
},
{},
[],
11,
0,
false,
false
] call BIS_fnc_holdActionAdd;  } forEach Units group player;
player setUnitLoadout F_Assault_Eng;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'B_UavTerminal';
player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'MineDetector';
};



if ((typeOf player == "B_G_Soldier_SL_F")) then {
 player setUnitLoadout F_Assault_TL;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'B_UavTerminal';
player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addWeapon 'Rangefinder';
player addWeapon 'launch_MRAWS_olive_F';
player addSecondaryWeaponItem 'MRAWS_HEAT_F'; 

[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_TL;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player linkItem 'B_UavTerminal';
player addWeapon 'Rangefinder';
player addWeapon 'launch_MRAWS_olive_F';
player addSecondaryWeaponItem 'MRAWS_HEAT_F'; 
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_Soldier_exp_F")) then {
 player setUnitLoadout F_Assault_Eod;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_Eod;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_medic_F")) then {
 player setUnitLoadout F_Assault_Med;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_Med;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_Soldier_A_F")) then {
 player setUnitLoadout F_Assault_Amm;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_Amm;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_Soldier_LAT_F")) then {
 player setUnitLoadout F_Assault_AT;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_AT;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_Soldier_M_F")) then {
 player setUnitLoadout F_Assault_Mrk;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_Mrk;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};

if ((typeOf player == "B_G_Soldier_AR_F")) then {
 player setUnitLoadout F_Assault_Mg;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';

{[ _x,   
 "<img size=2 color='#FFE496' image='Screens\FOBA\b_hq.paa'/><t font='PuristaBold' color='#FFE496'>Deploy Sandbags",   
'',   
'',   
'_target  == player',          
'_caller distance _target < 1',     
{player playMove "AinvPknlMstpSnonWnonDnon_medic_1" ; },   
{},   
{  
_pos =  player getRelPos [1, 0];  
_dir = getDirVisual player + 180;  
_veh = createVehicle ["Land_BagFence_Round_F", _pos, [], 0, "CAN_COLLIDE"];  
_veh setDir _dir;
_veh setVectorUp [0,0,1];
},   
{},   
[],   
6,   
5,   
false,   
false   
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Assault_Mg;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player linkItem 'NVGoggles_OPFOR';
player addWeapon 'Rangefinder';
player addItem 'optic_Hamr';

};




if ((typeOf player == "B_G_Soldier_TL_F")) then {
	 player setUnitLoadout F_Recon_TL;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'B_UavTerminal';
player linkItem 'NVGogglesB_blk_F';

[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_TL;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'B_UavTerminal';
player linkItem 'NVGogglesB_blk_F';
};

if ((typeOf player == "B_CTRG_soldier_AR_A_F")) then {
	 player setUnitLoadout F_Recon_Mg;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 


[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_Mg;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'NVGogglesB_blk_F';
};

if ((typeOf player == "B_CTRG_soldier_GL_LAT_F")) then {
	 player setUnitLoadout F_Recon_AT;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 


[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_AT;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'NVGogglesB_blk_F';
};

if ((typeOf player == "B_CTRG_soldier_M_medic_F")) then {
	 player setUnitLoadout F_Recon_Med;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 


[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_Med;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'NVGogglesB_blk_F';
};

if ((typeOf player == "B_CTRG_soldier_engineer_exp_F")) then {
	 player setUnitLoadout F_Recon_Eod;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 


[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_Eod;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'NVGogglesB_blk_F';
};

if ((typeOf player == "B_CTRG_Sharphooter_F")) then {
	 player setUnitLoadout F_Recon_Mrk;
if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 


[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
	
	{[
	_x,											
	'H.A.L.O',										
	'Screens\FOBA\iconParachute_ca.paa',	
	'Screens\FOBA\iconParachute_ca.paa',	
	' (getPosATL vehicle player) select 2 > 500 ',					
	'true',					
	{},												
	{},												
	{ 

{_x setPos ((getPos (vehicle player)) vectorAdd [(0 + (random 10)),(0 + (random 10)),(0 - (random 10))])} forEach units group player;
_Height = Position player select 2 ;
{[_x,_Height] spawn BIS_fnc_halo} forEach units group player;
	{ unassignvehicle _x;} forEach units group player;
playMusic 'LeadTrack02_F_Mark';
[player] execVM "Scripts\HALO.sqf"; 

	},				
	{},													
	[],													
	3,													
	0,													
	false,												
	false												
] call BIS_fnc_holdActionAdd;  } forEach Units group player;

player setUnitLoadout F_Recon_Mrk;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'NVGogglesB_blk_F';
};



if ((typeOf player == "B_T_Diver_F")) then {
 player setUnitLoadout F_Diver_TL;
	if (isClass (configfile >> 'CfgVehicles' >> 'Box_cTab_items') == true ) then { player addItem 'ItemAndroid'; player addItem 'ItemcTabHCam'; player addItem 'ItemcTab'; }; 

player addWeapon 'Laserdesignator_03';
player addBinocularItem 'Laserbatteries';
player addItem 'optic_Nightstalker';
player addItem 'B_IR_Grenade';
player addItem 'B_IR_Grenade';
player linkItem 'B_UavTerminal';
player linkItem 'NVGogglesB_blk_F';
[player] call EtV_Actions; 

[player,'MENU_COMMS_SUPPLYDROP',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_UAV_RECON',nil,nil,''] call BIS_fnc_addCommMenuItem;	
[player,'MENU_COMMS_CAS_HELI',nil,nil,''] call BIS_fnc_addCommMenuItem;
[player,'MENU_COMMS_ARTI',nil,nil,''] call BIS_fnc_addCommMenuItem;	
};


if (isServer) then {
{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach allPlayers ;  } remoteExec ["call", 0];
};
