

 ////////////////////////////////////////////////Intro
MissionLoadedLitterally = 0 ; 
publicVariable "MissionLoadedLitterally";

        titleText ["B.S.P Group Presents...", "BLACK IN",9999];
		5 fadeSound 0;

if (isServer) then { 

		FreshStartVal = "FreshStart" call BIS_fnc_getParamValue;
		 if (FreshStartVal == 1) then { _FS = execVM "Scripts\MissionReset.sqf";   waitUntil { scriptDone _FS }; } ;
		 
		ReviveSwitchVal = "ReviveSwitch" call BIS_fnc_getParamValue;
		 if (ReviveSwitchVal == 1) then { 
		 _mrkr = createMarker ["Revive_Handle", [0, 0, 0]]; 
		_mrkr setMarkerType "loc_SafetyZone";
		_mrkr setMarkerColor "Color1_FD_F";
		_mrkr setMarkerSize [0.6, 0.6]; 
		_mrkr setMarkerText "Activate"; 
		_mrkr setMarkerAlpha 0.005;
		 } else {
		 _mrkr = createMarker ["Revive_Handle", [0, 0, 0]]; 
		_mrkr setMarkerType "loc_SafetyZone";
		_mrkr setMarkerColor "Color1_FD_F";
		_mrkr setMarkerSize [0.6, 0.6]; 
		_mrkr setMarkerText "DeActivate"; 
		_mrkr setMarkerAlpha 0.005;	 
		 };
	};

sleep 10;
 ////////////////////////////////////////////////Mission Loading - Variables // Server & HC
if (isServer) then { _Load = execVM "Scripts\MissionLoad.sqf"; waitUntil { scriptDone _Load }; 
TRG1LOCC = 0;
publicVariable "TRG1LOCC";
TRG2LOCC = 0;
publicVariable "TRG2LOCC";
TRG3LOCC = 0;
publicVariable "TRG3LOCC";
MarLOCC = 0;
publicVariable "MarLOCC";
DIALOCC = 0;
publicVariable "DIALOCC";
AVENGLOCC = 1 ;
publicVariable "AVENGLOCC";
};

if ((isServer) or (!(isServer) && !(hasInterface))) then {
COMMSDIS = 0;
HELIDIS = 0;
AIRDIS = 0;
LOGDIS = 0;
INFDIS = 0;
ARMDIS = 0;
ConVLocc = 0 ;
AVENGLOCC = 1 ;
publicVariable "AVENGLOCC";
};

sleep 2;


waitUntil {MissionLoadedLitterally == 1};


////////////////////////////////////////////// //Mission Parameters   // TheCommander ////////////////////////////////////////////////

sleep 2;

if ((count (allMapMarkers select {markerType _x == "loc_SafetyZone"}) != 7) && (player == TheCommander) && (not didJIP)) then { execVM "Scripts\Dialog_Faction.sqf"; };
waitUntil {(count (allMapMarkers select {markerType _x == "loc_SafetyZone"}) == 7) && (count (allMapMarkers select {markerText _x == "Respawn"}) > 0)};

Hints = true ;
[] spawn {  
  while {Hints == true} do{  
_HMS = selectRandom ["Hints0"];
titleRsc [_HMS, "BLACK"];
 sleep 10;  
  }  
};

////////////////////////////////////////////// // MAIN Init   // Everyone ////////////////////////////////////////////////

_InitMain = execVM "init_Main.sqf"; waitUntil { scriptDone _InitMain }; 



playMusic "LeadTrack01_F_EPA";

hintSilent "LOADING . . . "; 

HCIV = 0;
cooldn = 0 ;

enableSaving [false, false] ;
setViewDistance 1000;
setobjectViewDistance [1000, 200];



////////////////////////////////////////////// // Custom Factions Init   // SERVER ////////////////////////////////////////////////


waitUntil {F_Init == "Done"};
waitUntil {E_Init == "Done"}; 
waitUntil {C_Init == "Done"};


waitUntil {(count (allMapMarkers select {markerType _x == "loc_SafetyZone"}) == 7)};

if ((isServer)  && !(didJIP)) then {SYSINT = 0} else {SYSINT = 1} ;


////////////////////////////////////////////// // SYSTEMs Init   // Everyone ////////////////////////////////////////////////

(findDisplay 46) displayAddEventHandler ["MouseButtonDown", "params ['_displayOrControl', '_button', '_xPos', '_yPos', '_shift', '_ctrl', '_alt'];  if ((_ctrl) && (_button == 1) && ((ctrlMapMouseOver (findDisplay 12 displayCtrl 51)) select 0 == 'marker')) then {[(ctrlMapMouseOver (findDisplay 12 displayCtrl 51)) select 1] execVM 'Scripts\MarkerIntro.sqf';}"]; 
(findDisplay 46) displayAddEventHandler ["KeyDown", {params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"]; if ((_ctrl) && (_key == 24) && (!dialog)) then { createDialog "Satellite_Control_Tablet"; HCAM_0 cameraEffect ["Internal", "Back", "HCAM_S"]; }; }];
(findDisplay 46) displayAddEventHandler ["KeyDown", {params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"]; if (_key == 24) then { titleFadeOut 0.01;}; }];
(findDisplay 46) displayAddEventHandler ["KeyDown", {params ["_displayorcontrol", "_key", "_shift", "_ctrl", "_alt"]; if ((_ctrl) && (_key == 37) && (!dialog) && ((player getVariable ["AIS_unconscious", false]) != true)) then {execVM "Scripts\TEAMS.sqf" ;};}];

////////////////////////////////////////////// // R3F Init   // Everyone ////////////////////////////////////////////////

execVM "R3F_LOG\init.sqf";

////////////////////////////////////////////// // ETV Init   // Everyone ////////////////////////////////////////////////

execVM "Scripts\EtV.sqf";
waitUntil {!isNil "EtVInitialized"};

////////////////////////////////////////////// // Exec Vcom AI function ////////////////////////////////////////////////
[] execVM "Vcom\VcomInit.sqf";	


sleep 2;


HC1Present = if ( isNil "HC_1" ) then { False } else {True } ; 
HC2Present = if ( isNil "HC_2" ) then { False } else {True } ; 
HC3Present = if ( isNil "HC_3" ) then { False } else {True } ; 

waitUntil {(DIALOCC == 1) || (MarLOCC == 1) || (count (allMapMarkers select {markerType _x == "b_installation"}) > 0) || (count (allMapMarkers select {markerType _x == "b_unknown"}) > 0)};

if (!HC1Present && !HC2Present && !HC3Present) then {
	if  (isServer)  then {
	_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
					waitUntil { scriptDone _Triggers1 };
	_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
					waitUntil { scriptDone _Triggers2 };
	_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
					waitUntil { scriptDone _Triggers3 };
		};
	}else{ 
		if ((HC1Present && !HC2Present && !HC3Present) or (!HC1Present && HC2Present && !HC3Present) or (!HC1Present && !HC2Present && HC3Present)) then {
				if (!(isServer) && !(hasInterface)) then {				
				_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
				waitUntil { scriptDone _Triggers1 };
				};
				if  (isServer)  then {				
				_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
				waitUntil { scriptDone _Triggers2 };				
				_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
				waitUntil { scriptDone _Triggers3 };				
					};
		};

		if (HC1Present && HC2Present && !HC3Present) then {
				if	(player == HC_1) then { 
				_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
				waitUntil { scriptDone _Triggers1 };
				_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
				waitUntil { scriptDone _Triggers2 };			
					};
				if	(player == HC_2) then { 
				_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
				waitUntil { scriptDone _Triggers3 };			
					};
		};
		if (!HC1Present && HC2Present && HC3Present) then {		
				if	(player == HC_2) then { 
				_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
				waitUntil { scriptDone _Triggers1 };
				_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
				waitUntil { scriptDone _Triggers2 };			
					};
				if	(player == HC_3) then { 
				_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
				waitUntil { scriptDone _Triggers3 };			
					};
		};
		if (HC1Present && !HC2Present && HC3Present) then {
				if	(player == HC_1) then { 		
				_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
				waitUntil { scriptDone _Triggers1 };
				_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
				waitUntil { scriptDone _Triggers2 };			
					};
				if	(player == HC_3) then { 
				_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
				waitUntil { scriptDone _Triggers3 };			
					};
		};

		if (HC1Present && HC2Present && HC3Present) then {	
				if	(player == HC_1) then { 
				_Triggers1 = execVM "Scripts\init_Triggers_1.sqf";
				waitUntil { scriptDone _Triggers1 };
					};
				if	(player == HC_2) then { 
				_Triggers2 = execVM "Scripts\init_Triggers_2.sqf";
				waitUntil { scriptDone _Triggers2 };			
					};					
				if	(player == HC_3) then { 
				_Triggers3 = execVM "Scripts\init_Triggers_3.sqf";
				waitUntil { scriptDone _Triggers3 };			
					};
		};		
	};

waitUntil {(didJIP) or (TRG1LOCC == 1)};
waitUntil {(didJIP) or (TRG2LOCC == 1)};
waitUntil {(didJIP) or (TRG3LOCC == 1)};

_alltriggers = allMissionObjects "EmptyDetector";
	{_x setTriggerInterval 5; } forEach _alltriggers ;

	
if  (isServer)  then {
SAT1 = "camera" camCreate [0,0,0];
SAT1 attachTo [TSAT, [0, 0, 300] ];  
SAT1 camSetFov 0.9; 
SAT1 setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
SAT1 cameraEffect ["Internal", "Back", "SATELLITE_V"]; 
SAT1 cameraEffect ["Internal", "Back", "SATELLITE"]; 
TSAT setPos (position player);
"SATELLITE_V" setPiPEffect [0];
"SATELLITE" setPiPEffect [0];	

_Weather = execVM "Scripts\init_Weather.sqf";
waitUntil { scriptDone _Weather };

_Groups = execVM "Scripts\MissionLoadGroups.sqf";
waitUntil { scriptDone _Groups };

_FOB_Actions = execVM "Scripts\init_FOBs.sqf";
waitUntil { scriptDone _FOB_Actions };

_OP_Actions = execVM "Scripts\init_OPs.sqf";
waitUntil { scriptDone _OP_Actions };

_Actions_2 = execVM "Scripts\init_Actions.sqf";

_Enemy_Assault = execVM "Scripts\Mission_Defend_0.sqf";
};

				if (hasInterface) then {
				_Triggers0 = execVM "Scripts\init_Triggers.sqf";
				waitUntil { scriptDone _Triggers0 };		
				};

sleep 1;



if (isServer) then {
{	{[_x] execVM "Scripts\LDTInit.sqf" ;} forEach allPlayers ;  } remoteExec ["call", 0];
};

//  Resource producer////////////////////////////////////////////////////////////


if (isServer) then {
[] spawn {  
while { sleep 90 ; time > 0  } do{  
 
 _allENMMarks = allMapMarkers select {markerShape _x == "RECTANGLE"};   
	{deleteMarker _x} forEach _allENMMarks ;

  if (count (allMapMarkers select { markerType _x == "loc_Transmitter" && markerColor _x == "colorBLUFOR"}) > 0) then {
	  
 {  
 _objectLocT = allMapMarkers select { markerType _x == "loc_Transmitter" && markerColor _x == "colorBLUFOR"};  
 _NearFOBMark = [_objectLocT,  position _x] call BIS_fnc_nearestPosition ;  
    if ((getMarkerPos _NearFOBMark) distance (position _x) < 3500 ) then {   
_radius = 50 + (random 250) ;  
_markerName = "Enm_East" + (str (_x getPos [(5 + (random 15)),(0 + (random 360))]));    
_mrkr = createMarkerLocal [_markerName,_x getPos [(5 + (random 15)),(0 + (random 360))]];   
_mrkr setMarkerTypeLocal "Unknown";  
_mrkr setMarkerColorLocal "colorOPFOR";  
_mrkr setMarkerBrushLocal "FDiagonal";  
_mrkr setMarkerShapeLocal "RECTANGLE";   
_mrkr setMarkerSize [_radius, _radius];  
_mrkr setMarkerAlpha (0 + (random 0.4));} ;  
 } foreach (allUnits select {side _x == east && alive _x  && leader _x == _x});  

 {  
 _objectLocT = allMapMarkers select { markerType _x == "loc_Transmitter" && markerColor _x == "colorBLUFOR"};  
 _NearFOBMark = [_objectLocT,  position _x] call BIS_fnc_nearestPosition ;  
    if ((getMarkerPos _NearFOBMark) distance (position _x) < 3500 ) then {   
_radius = 50 + (random 100) ;  
_markerName = "Enm_Guer" + (str (_x getPos [(5 + (random 15)),(0 + (random 360))]));    
_mrkr = createMarkerLocal [_markerName,_x getPos [(5 + (random 15)),(0 + (random 360))]];   
_mrkr setMarkerTypeLocal "Unknown";  
_mrkr setMarkerColorLocal "colorIndependent";  
_mrkr setMarkerBrushLocal "FDiagonal";  
_mrkr setMarkerShapeLocal "RECTANGLE";   
_mrkr setMarkerSize [_radius, _radius];  
_mrkr setMarkerAlpha (0 + (random 0.4));} ;  
 } foreach (allUnits select {side _x == independent && alive _x  && leader _x == _x});  
 
  };

if  (ConVLocc == 1 ) then {
	
 _RoadMrks = allMapMarkers select {markerType _x == "mil_dot"  && markerColor _x == "colorCivilian" &&  markerAlpha _x == 0.3};  
	{deleteMarker _x} forEach _RoadMrks ;

{deleteWaypoint((waypoints CGM)select 0);}forEach waypoints CGM; 


(calculatePath ["wheeled_APC","safe",position V0,position (selectRandom ((getMarkerPos "ConvoyDest") nearRoads 500))]) addEventHandler ["PathCalculated", {   
_posesArr = _this select 1;  
_posesArrCnt = count _posesArr ;  
_posesArrCntndd = round (_posesArrCnt / 10) ;  
 _indexed = [1,2,3,4,5,6,7,8,9] ;   
 
 {  
   _Waypos = _posesArr select (_x * _posesArrCntndd) ;  
   _wp = CGM addWaypoint [_Waypos, 0];   
   _wp SetWaypointType "MOVE";   
   _wp setWaypointBehaviour "SAFE";   
   _wp setWaypointSpeed "LIMITED";  
     } forEach _indexed ;  

	{ 
	private _marker = createMarkerLocal [(str position V0) + str _forEachIndex, _x]; 
	_marker setMarkerTypeLocal "mil_dot"; 
	_marker setMarkerSizeLocal [0.5, 0.5]; 
	_marker setMarkerColorLocal "colorCivilian" ;
	_marker setMarkerAlpha 0.3 ;
	} forEach (_this select 1); 
 
}]; 

sleep 2 ; 
CGM setFormation "WEDGE";
sleep 2 ; 
CGM setFormation "COLUMN";

	};
 
_BluezoneMarks = allMapMarkers select { markerType _x == "b_installation" && (markerColor _x == "colorBLUFOR" or markerColor _x == "ColorWEST") };
{ [3] execVM 'Scripts\Reward.sqf'; } foreach _BluezoneMarks;
 
 {_x hideObjectGlobal true; _x enableSimulationGlobal false; } foreach (allUnits select {((driver (vehicle _x)) checkAIFeature "LIGHTS" == true) && (typeOf (vehicle _x) != "O_G_Mortar_01_F" && typeOf (vehicle _x) != "O_G_HMG_02_high_F" && typeOf (vehicle _x) != "O_SAM_System_04_F" && typeOf (vehicle _x) != "O_Radar_System_02_F") && (side _x != west) && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 1000]) == 0)}) ;
   {_x hideObjectGlobal true; _x enableSimulationGlobal false; } foreach (vehicles select {(typeOf _x != "O_G_Mortar_01_F" && typeOf _x != "O_G_HMG_02_high_F" && typeOf _x != "O_SAM_System_04_F" && typeOf _x != "O_Radar_System_02_F") && (side (driver  _x) != west) && !(_x isKindOf "Air") && ((driver  _x) checkAIFeature "LIGHTS" == true) && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 1000]) == 0)}) ;
 
 {_x hideObjectGlobal false; _x enableSimulationGlobal true; } foreach (allUnits select {((driver (vehicle _x)) checkAIFeature "LIGHTS" == true) && (typeOf (vehicle _x) != "O_G_Mortar_01_F" && typeOf (vehicle _x) != "O_G_HMG_02_high_F" && typeOf (vehicle _x) != "O_SAM_System_04_F" && typeOf (vehicle _x) != "O_Radar_System_02_F") && (side _x != west) && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 1000]) != 0)}) ;
   {_x hideObjectGlobal false; _x enableSimulationGlobal true; } foreach (vehicles select {(typeOf _x != "O_G_Mortar_01_F" && typeOf _x != "O_G_HMG_02_high_F" && typeOf _x != "O_SAM_System_04_F" && typeOf _x != "O_Radar_System_02_F") && (side (driver  _x) != west) && !(_x isKindOf "Air") && ((driver  _x) checkAIFeature "LIGHTS" == true) && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 1000]) != 0)}) ;

_alltriggers = allMissionObjects 'EmptyDetector';
_triggers = _alltriggers select {triggerInterval _x == 3 && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 3000]) == 0)};
 {_x hideObjectGlobal true; _x enableSimulationGlobal false; } foreach _triggers ;

_alltriggers = allMissionObjects 'EmptyDetector';
_triggers = _alltriggers select {triggerInterval _x == 3 && ({(side _x == west) && (alive _x == true)} count (_x nearEntities [["Man","Car","Tank", "Air", "Ship", "LandVehicle"], 3000]) != 0)};
 {_x hideObjectGlobal false; _x enableSimulationGlobal true; } foreach _triggers ;

  };  
};
};

///////////////////////////////////////////////////////////////////////////////////
if (isClass (configfile >> "CfgVehicles" >> "Box_cTab_items") == true ) then { player addItem "ItemAndroid"; player addItem "ItemcTab"; };

if (isServer) then {
 AutoSaveSwitchVal = "AutoSaveSwitch" call BIS_fnc_getParamValue;
 AutoSaveIntervalVal = "AutoSaveInterval" call BIS_fnc_getParamValue;

	if (AutoSaveSwitchVal == 1) then {
		
			[] spawn {  
			while { true } do{  

			execVM "Scripts\MissionSave.sqf" ;
			execVM "Scripts\MissionSaveGroups.sqf" ;

			sleep AutoSaveIntervalVal;  
			};  
			};

	};
};