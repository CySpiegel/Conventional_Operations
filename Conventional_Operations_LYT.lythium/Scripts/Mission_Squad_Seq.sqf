
_thisIntelItem = _this select 0;

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

				[50, 'INTEL'] execVM 'Scripts\NOtification.sqf' ;
				[50] execVM 'Scripts\Reward.sqf';

_CRT = [
"Box_IND_WpsSpecial_F",
"Box_East_WpsSpecial_F",
"Box_IND_Support_F",
"Box_East_Support_F",
"Box_CSAT_Equip_F",
"Box_AAF_Equip_F",
"Box_East_WpsLaunch_F",
"Box_IND_WpsLaunch_F",
"Box_East_AmmoOrd_F",
"Box_East_Ammo_F",
"Box_IND_Ammo_F",
"Box_IND_AmmoOrd_F",
"Box_East_Wps_F",
"Box_IND_Wps_F"
];
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if ((typeOf _thisIntelItem == "Land_File2_F") && (_DANSCORE > 5)) then {

_MMarks = allMapMarkers select { markerType _x == "mil_warning"};
_M = [_MMarks,  _thisIntelItem] call BIS_fnc_nearestPosition;
deleteMarker _M ; 

_allMarks = allMapMarkers select {markerType _x == "b_installation"};  
_NOSHs = [] ;
{
_NOSH = nearestObjects [getMarkerPos _x , ["HOUSE"], 500] ; 
_NOSHs append _NOSH ;	
} forEach _allMarks ;

_ALLSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 3000] select {count (_x buildingPos -1) > 2};
_NearSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 1000] select {count (_x buildingPos -1) > 2};
_SHs = _ALLSHs - _NearSHs ; 
_SH = _SHs - _NOSHs ;


_HQB = selectRandom _SH ;
_dir = getDirVisual _HQB;


[ "Intel_MIS_02", (selectRandom (_HQB buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
_V = createVehicle [(selectRandom _CRT), (selectRandom (_HQB buildingPos -1)), [], 15, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), (selectRandom (_HQB buildingPos -1)), [], 15, "NONE"]; 
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 


PRL = [getPos _HQB, East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 200] call BIS_fnc_taskPatrol;

								_markerName = "InvesMark" + (str (getPos _HQB));   
								_mrkr = createMarker [_markerName, (getPos _HQB)];   
								_mrkr setMarkerType "mil_warning";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								openMap true;
								 [markerSize _mrkr, markerPos _mrkr, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

//////Gaurds/////////////////////////////////////////////////////////////////////////////////////////


G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  

G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  

if (_DANSCORE > 5) then {
G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
}; 

if (_DANSCORE > 10) then {
G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
}; 


//////GROUPS/////////////////////////////////////////////////////////////////////////////////////////

PRL = [_HQB getPos [(300 +(random 700)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 500] call BIS_fnc_taskPatrol;


if (_DANSCORE > 10) then {
PRL = [_HQB getPos [(300 +(random 700)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 1000] call BIS_fnc_taskPatrol;
};

_trgA = createTrigger ["EmptyDetector", (getPos _HQB)];
_trgA setTriggerArea [300, 300, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ["WEST", "PRESENT", false];
_trgA setTriggerStatements [
"this", "

_QRF = selectRandom [ 'Scripts\HeliInsert_CSAT.sqf', 'Scripts\VehiInsert_CSAT.sqf']; 
[thisTrigger] execVM _QRF;

",""];


};

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ((typeOf _thisIntelItem == "Land_Document_01_F") && (_DANSCORE > 10)) then {

_MMarks = allMapMarkers select { markerType _x == "mil_warning"};
_M = [_MMarks,  _thisIntelItem] call BIS_fnc_nearestPosition;
deleteMarker _M ; 

_allMarks = allMapMarkers select {markerType _x == "b_installation"};  
_NOSHs = [] ;
{
_NOSH = nearestObjects [getMarkerPos _x , ["HOUSE"], 500] ; 
_NOSHs append _NOSH ;	
} forEach _allMarks ;

_ALLSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 3000] select {count (_x buildingPos -1) > 2};
_NearSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 1000] select {count (_x buildingPos -1) > 2};
_SHs = _ALLSHs - _NearSHs ; 
_SH = _SHs - _NOSHs ;


_HQB = selectRandom _SH ;
_dir = getDirVisual _HQB;


[ "Intel_MIS_03", (selectRandom (_HQB buildingPos -1)), [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
_V = createVehicle [(selectRandom _CRT), (selectRandom (_HQB buildingPos -1)), [], 15, "NONE"]; 
_V = createVehicle [(selectRandom _CRT), (selectRandom (_HQB buildingPos -1)), [], 15, "NONE"]; 
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
_G = [ (selectRandom (_HQB buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 


PRL = [getPos _HQB, East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 200] call BIS_fnc_taskPatrol;

								_markerName = "InvesMark" + (str (getPos _HQB));   
								_mrkr = createMarker [_markerName, (getPos _HQB)];   
								_mrkr setMarkerType "mil_warning";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								openMap true;
								 [markerSize _mrkr, markerPos _mrkr, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

//////Gaurds/////////////////////////////////////////////////////////////////////////////////////////


G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  

G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  

if (_DANSCORE > 5) then {
G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
}; 

if (_DANSCORE > 10) then {
G = [_HQB getPos [(300 +(random 1500)), (0 + (random 360))], East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
}; 


//////GROUPS/////////////////////////////////////////////////////////////////////////////////////////

PRL = [_HQB getPos [(300 +(random 700)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 500] call BIS_fnc_taskPatrol;


if (_DANSCORE > 10) then {
PRL = [_HQB getPos [(300 +(random 700)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, getPos _HQB, 1000] call BIS_fnc_taskPatrol;
};

_trgA = createTrigger ["EmptyDetector", (getPos _HQB)];
_trgA setTriggerArea [300, 300, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ["WEST", "PRESENT", false];
_trgA setTriggerStatements [
"this", "

_QRF = selectRandom [ 'Scripts\HeliInsert_CSAT.sqf', 'Scripts\VehiInsert_CSAT.sqf']; 
[thisTrigger] execVM _QRF;

",""];


};


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ((typeOf _thisIntelItem == "Land_Map_Malden_F") || ((typeOf _thisIntelItem == "Land_Document_01_F") && (_DANSCORE < 11)) || ((typeOf _thisIntelItem == "Land_File2_F") && (_DANSCORE < 6))) then {


_MMarks = allMapMarkers select { markerType _x == "mil_warning"};
_M = [_MMarks,  _thisIntelItem] call BIS_fnc_nearestPosition;
deleteMarker _M ; 

_allMarks = allMapMarkers select {markerType _x == "b_installation"};  
_NOSHs = [] ;
{
_NOSH = nearestObjects [getMarkerPos _x , ["HOUSE"], 500] ; 
_NOSHs append _NOSH ;	
} forEach _allMarks ;

_ALLSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 3000] select {count (_x buildingPos -1) > 2};
_NearSHs = nearestObjects [_thisIntelItem , ["HOUSE"], 1000] select {count (_x buildingPos -1) > 2};
_SHs = _ALLSHs - _NearSHs ; 
_SH = _SHs - _NOSHs ;


_HQB = selectRandom _SH ;
_dir = getDirVisual _HQB;

_G = [ (selectRandom (_HQB buildingPos -1)), civilian,[F_Assault_TL, F_Assault_Mrk, F_Assault_AT, F_Assault_Mg]] call BIS_fnc_spawnGroup; 

{_x disableAI "PATH"; _x setCaptive true; _x setUnitPos "MIDDLE";} forEach units _G; 

((units _G) select 0) setPos ((_HQB buildingPos -1) select 1);
((units _G) select 1) setPos ((_HQB buildingPos -1) select 2);
((units _G) select 2) setPos ((_HQB buildingPos -1) select 3);
((units _G) select 3) setPos ((_HQB buildingPos -1) select 4);


_TFOBH = createTrigger ["EmptyDetector", getPos _HQB];  
_TFOBH setTriggerArea [10, 10, 0, false, 5];  
_TFOBH setTriggerInterval 2;  
_TFOBH setTriggerActivation ["ANYPLAYER", "PRESENT", false];  
_TFOBH setTriggerStatements [  
"this",  
"  

_MMarks = allMapMarkers select { markerType _x == 'mil_warning'};
_M = [_MMarks,  thisTrigger] call BIS_fnc_nearestPosition;

deleteMarker _M ; 

_POW = nearestObjects [thisTrigger , [F_Assault_TL], 200] ;  
_CPOW = _POW select {side _x == civilian};
_THPOW = _CPOW select 0;
_GRS = group _THPOW;


_Group = createGroup West; 
{[_x] join _Group; _x enableAI 'PATH'; _x setCaptive false; _x setUnitPos 'AUTO';} forEach units _GRS;

_PLYR = (allPlayers select {positon _x inArea thisTrigger}) select 0 ;
{[_x] join (group _PLYR)} forEach units _Group;

				[50, 'MISSING SQUAD'] execVM 'Scripts\NOtification.sqf' ;

[50] execVM 'Scripts\Reward.sqf';
 ", ""]; 
 
}; 
 
 /////////////////////////////////////////////////////////////////////////////////////////
 
 sleep 2 ;


