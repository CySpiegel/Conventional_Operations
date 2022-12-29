////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_thisOutpostTrigger = _this select 0;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_Chance = selectRandom [1, 2, 3]; 
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if (count ( nearestobjects [getPos _thisOutpostTrigger, ["Land_HelipadCircle_F","Land_HelipadCivil_F","Heli_H_rescue","Land_HelipadRescue_F","Land_HelipadSquare_F","HeliHRescue","Heli_H_civil","HeliHCivil","HeliH"], 100]) > 0) then { 
_HPAD = nearestobjects [getPos _thisOutpostTrigger, ["Land_HelipadCircle_F","Land_HelipadCivil_F","Heli_H_rescue","Land_HelipadRescue_F","Land_HelipadSquare_F","HeliHRescue","Heli_H_civil","HeliHCivil","HeliH"], 100] select 0;
_V = createVehicle [ selectRandom East_Air_Heli, getpos _HPAD, [], 0, "NONE"]; 
_V setVehicleLock "LOCKED";
_dir =  getDir _HPAD;
_V setDir _dir; 

sleep 3;

_V addEventHandler ["Killed", {  
["ScoreAdded", ["Enemy Aircraft Sabotaged", 20]] remoteExec ["BIS_fnc_showNotification", 0];
[20] execVM "Scripts\Reward.sqf";
 playMusic "EventTrack01_F_Curator"; 
 execVM 'Scripts\HeliDis.sqf';
}];
} ;

if (count ( nearestobjects [getPos _thisOutpostTrigger, ["Land_Tyre_F"], 100]) > 0) then { 
_objectLoc = nearestobjects [getPos _thisOutpostTrigger, ["Land_Tyre_F"], 100] ; 

{  
_x hideObject true ; 
sleep 1;

_dir = getDirVisual _x ;
_pos = position _x ;

_NewVeh = createVehicle [selectRandom East_Ground_Vehicles_Heavy, [0,0, (500 + random 2000)], [], 0, "CAN_COLLIDE"] ;
	_NewVeh setDir _dir ;
	_NewVeh setVehicleLock "LOCKED";

deleteVehicle _x ;

_NewVeh setVehiclePosition [ [_pos select 0, _pos select 1, (_pos select 2) + 2], [], 0, "CAN_COLLIDE"];


sleep 1;
	_NewVeh addEventHandler ["Killed", {
["ScoreAdded", ["Enemy Armor Sabotaged", 30]] remoteExec ["BIS_fnc_showNotification", 0];
[30] execVM "Scripts\Reward.sqf"; 
 playMusic "EventTrack01_F_Curator"; 
 execVM 'Scripts\ArmorDis.sqf';
}];

} forEach _objectLoc;
};

 if (_Chance > 2) then {
_allBuildings = nearestObjects [(getpos _thisOutpostTrigger), ["House"], 100];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)};  
_rndPosX = selectRandom _allPositions;  


_HOSTAGE = selectRandom [ 
F_Assault_Eng,  
F_Recon_Snp,
F_Diver_TL,  
F_Officer
 ]; 

_POWG = [ selectRandom _allPositions , civilian,[_HOSTAGE]] call BIS_fnc_spawnGroup;         
_POW = (units _POWG) select 0;
_POW disableAI "ANIM"; 
_POW disableAI "PATH";
_POW switchMove "Acts_AidlPsitMstpSsurWnonDnon05";
removeAllWeapons _POW;
removeBackpack _POW;
removeVest _POW;
[
  _POW,
"Rescue",
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
"\a3\ui_f\data\IGUI\Cfg\HoldActions\holdAction_unbind_ca.paa",
 "_this distance _target < 5",       
 "_caller distance _target < 5",  
{},
{},
{
_complMessage = selectRandom ["I thought I was gonna die in here!","Thank you so much man.","I'M ALIVE."];
["Hostage", _complMessage] remoteExec ["BIS_fnc_showSubtitle"];
(_this select 0) switchMove "Acts_AidlPsitMstpSsurWnonDnon_out";
(_this select 0) enableAI "PATH";
(_this select 0) enableAI "ANIM";
(_this select 0) setBehaviour "AWARE";
[(_this select 0)] joinSilent player;

[30] execVM 'Scripts\Reward.sqf';
  
["ScoreAdded", ["POW Rescued", 30]] remoteExec ["BIS_fnc_showNotification", 0];
 playMusic "EventTrack01_F_Curator";   

[(_this select 0),(_this select 2)] remoteExec ["bis_fnc_holdActionRemove",[0,-2] select isDedicated,true];
},
{},
[],
3,
0,
true,
false
] remoteExec ["BIS_fnc_holdActionAdd", 0, _POW]; 
 };

//////GROUPS//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//////////Veicle////////////////////////////////////////////////////////////////////////

if (count ( (getPos _thisOutpostTrigger) nearRoads 200 ) > 0 ) then {

_nearRoad = selectRandom ( (getPos _thisOutpostTrigger) nearRoads 200 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Light, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 

_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_nearRoad2 =_thisOutpostTrigger nearRoads 1500 ; 
_nearRoad1 = _thisOutpostTrigger nearRoads 800 ; 

_nearRoadleft = _nearRoad2 - _nearRoad1;
_nearRoad0 = selectRandom _nearRoadleft; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";


if (_DANSCORE > 10) then {
_nearRoad = selectRandom ( (getPos _thisOutpostTrigger) nearRoads 150 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Heavy, (_nearRoad getRelPos [0, 0]), [], 2, "NONE"]; 

_Group = createVehicleCrew _V; 
_VC = createGroup East;
{[_x] join _VC} forEach units _Group;

sleep 3;
_nearRoad2 =_thisOutpostTrigger nearRoads 1500 ; 
_nearRoad1 = _thisOutpostTrigger nearRoads 800 ; 

_nearRoadleft = _nearRoad2 - _nearRoad1;
_nearRoad0 = selectRandom _nearRoadleft; 
I1_WP_0 = _VC addWaypoint [getPos _nearRoad0, 0];
I1_WP_0 SetWaypointType "MOVE";
I1_WP_0 setWaypointBehaviour "SAFE";
I1_WP_0 setWaypointSpeed "LIMITED";

I1_WP_00 = _VC addWaypoint [getPos _nearRoad, 0];
I1_WP_00 SetWaypointType "MOVE";
I1_WP_00 setWaypointBehaviour "SAFE";
I1_WP_00 setWaypointSpeed "LIMITED";

I1_WP_1 = _VC addWaypoint [getPos _nearRoad, 3];
I1_WP_1 SetWaypointType "CYCLE";
I1_WP_1 setWaypointBehaviour "SAFE";
I1_WP_1 setWaypointSpeed "LIMITED";
};
};
//////Assault////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



if (_DANSCORE > 5) then {
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  
			_AssltDest = [_AssltDestMrks,  _thisOutpostTrigger] call BIS_fnc_nearestPosition;
[_thisOutpostTrigger, _AssltDest] execVM "Scripts\VehiInsert_CSAT_2.sqf";			

};

if (_DANSCORE > 10) then {
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  
			_StrtM = [_AssltDestMrks,  _thisOutpostTrigger] call BIS_fnc_nearestPosition;
[_thisOutpostTrigger, _StrtM] execVM "Scripts\VehiInsert_CSAT_2.sqf";	
};
///////Garrisons//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 


if (_DANSCORE > 5) then {
_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
};


if (_DANSCORE > 10) then {
_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units G) select 0) disableAI "PATH";

_poss = [(getpos _thisOutpostTrigger), 10, 80, 5, 1 , 0] call BIS_fnc_findSafePos;
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_poss = [(getpos _thisOutpostTrigger), 10, 20, 4, 0.1 , 0] call BIS_fnc_findSafePos;
_VLAMP = createVehicle [ "Land_LampAirport_F", _poss, [], 5, "NONE"];

_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 20)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 20)),(0 + (random 350))], [], 0, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), _VLAMP getPos [(0 + (random 20)),(0 + (random 350))], [], 0, "NONE"]; 



if (count [(getpos _thisOutpostTrigger) nearRoads 70] > 0) then {

_nearRoad = selectRandom ( (getpos _thisOutpostTrigger) nearRoads 70 ) ; 
_V = createVehicle [selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;

_nearRoad = selectRandom ( (getpos _thisOutpostTrigger) nearRoads 70 ) ; 
_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, (_nearRoad getRelPos [0, 0]), [], 4, "NONE"]; 
_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
_dir = _nearRoad getDir _nextRoad;
_V setDir _dir;
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_allBuildings = nearestObjects [(getpos _thisOutpostTrigger), ["Land_MilOffices_V1_F", "Land_Cargo_Tower_V3_F", "Land_Cargo_Tower_V2_F", "Land_Cargo_Tower_V1_F", "Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V2_F", "Land_Cargo_HQ_V1_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F"], 300];  

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 

_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 


if (_DANSCORE > 5) then {
	_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
};

if (_DANSCORE > 10) then {
_HQ = selectRandom _allBuildings;
_dir = getDirVisual _HQ;
[ "Intel_01", (selectRandom (_HQ buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
};

_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)};  
 

G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;         
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
if (_DANSCORE > 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;         
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
};
if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;         
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
};

sleep 3;

_HeavGuns =  nearestObjects [(getpos _thisOutpostTrigger), ["O_G_HMG_02_high_F", "O_G_Mortar_01_F"], 200];

{
_Group = createVehicleCrew _x; 
{_x setUnitLoadout selectRandom East_Units;} forEach units _Group;
} forEach _HeavGuns;


if (count nearestObjects [(getpos _thisOutpostTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V1_F"], 200] > 0) then {

_allBuildings = nearestObjects [(getpos _thisOutpostTrigger), ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V1_F"], 200];  
_allPositions = [];  
_allBuildings apply {_allPositions append (_x buildingPos -1)}; 
 
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     


if (_DANSCORE > 5) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH";   
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     

};

if (_DANSCORE > 10) then {
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
((units G) select 0) disableAI "PATH";
G = [selectRandom _allPositions, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;     
};
};
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
{
_nvg = hmd _x;
 _x unassignItem _nvg;
 _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 
 
sleep 10;
 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 
_trg = createTrigger ["EmptyDetector", getPos _thisOutpostTrigger, false];  
_trg setTriggerArea [1000, 1000, 0, false, 200];  
_trg setTriggerTimeout [2, 2, 2, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "[thisTrigger, 1500] execVM 'Scripts\ZONEs.sqf';", ""]; 
  
  
_trg = createTrigger ["EmptyDetector", getPos _thisOutpostTrigger, false];  
_trg setTriggerArea [120, 120, 0, false, 200];  
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["WEST SEIZED", "PRESENT", false];  
_trg setTriggerStatements [  
"this",  "  

[parseText '<t color=""#1AA3FF"" font=""PuristaBold"" align = ""right"" shadow = ""1"" size=""3"">SITREP</t><br /><t color=""#959393"" align = ""right"" shadow = ""1"" size=""1.5"">Friendly Forces Dominating the Battle,</t><br /><t color=""#959393"" align = ""right"" shadow = ""1"" size=""1.5"">Keep Up the Fight, We will Capture and Secure the Outpost,</t>', [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ['BIS_fnc_textTiles', 0];
_allMarks = allMapMarkers select {markerColor _x == 'colorOPFOR' && markerType _x == 'o_support'};  
_FOBMrk = [_allMarks,  thisTrigger] call BIS_fnc_nearestPosition;
openMap true;
 [markerSize _FOBMrk, markerPos _FOBMrk, 0.5] call BIS_fnc_zoomOnArea;
				 
				 
					TRG = createTrigger ['EmptyDetector', getPos thisTrigger, false];  
					TRG setTriggerArea [120, 120, 0, false, 200];  
					TRG setTriggerActivation ['WEST SEIZED', 'PRESENT', true];  
					TRG setTriggerStatements [  
					""this"",  """", """"]; 



				[thisTrigger] execVM 'Scripts\Outpost_CSAT_CAPTURE_West.sqf';


", ""]; 






{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[_thisOutpostTrigger, 200] execVM "Scripts\INTLitems.sqf";
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
sleep 2 ;

