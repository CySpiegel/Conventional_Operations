


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  
//////Resources/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_objectLocT = allMapMarkers select {markerType _x == "b_installation"  && markerColor _x == "colorBLUFOR"};

{
_TERR = nearestTerrainObjects [(getMarkerpos _x), ["FOREST", "TREE", "SMALL TREE", "BUSH", "ROCK", "ROCKS"], 40]; 
{[_x, true] remoteExec ["hideObjectGlobal", 2];} forEach _TERR ;
} forEach _objectLocT;
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == 'loc_mine' };

{
_trgMine = createTrigger ["EmptyDetector", (getMarkerpos _x), false];
_trgMine setTriggerArea [1000, 1000, 0, false, 100];
_trgMine setTriggerTimeout [2, 2, 2, true];
_trgMine setTriggerInterval 3;
_trgMine setTriggerActivation ["WEST", "PRESENT", false];
_trgMine setTriggerStatements [
"this","[thisTrigger] execVM 'Scripts\Minefield.sqf';", ""];

sleep 0.1 ;

} forEach _objectLocT;

//////////////////////////////////////////////////////////////////////////////////////////////
sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "o_antiair"};

{

_trg = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trg setTriggerArea [2000, 2000, 0, false, 100];
_trg setTriggerTimeout [7, 7, 7, true];
_trg setTriggerInterval 3;
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Insurgents_Init.sqf';


_TERR = nearestTerrainObjects [(getPos thisTrigger), ['FOREST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 40]; 
{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

[thisTrigger] execVM 'Scripts\AAA_CSAT.sqf';

", ""];


_P1 =  [ 
 "AAA_01",  
 "AAA_02",  
 "AAA_03"    
]; 	

_dir = 0 + (random 360);
if (count (nearestObjects [(getMarkerpos _x), ["House"], 200]) != 0) then {
_dir = getDirVisual ((nearestObjects [(getMarkerpos _x), ["House"], 200]) select 0);
};

_compReference = [ selectRandom _P1, (getMarkerpos _x), [0,0,0], _dir, true ] call LARs_fnc_spawnComp;

sleep 0.1 ;

_ARRAY = [ _compReference ] call LARs_fnc_getCompObjects;
{_x setVectorUp [0,0,1];} forEach _ARRAY; 

} forEach _objectLocT;

sleep 1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "n_installation"};

{

_trg = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trg setTriggerArea [2000, 2000, 0, false, 100];
_trg setTriggerInterval 3;
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Insurgents_Init.sqf';

_trgA = createTrigger ['EmptyDetector', getPos thisTrigger, false];
_trgA setTriggerArea [1000, 1000, 0, false, 100];
_trgA setTriggerTimeout [17, 17, 17, true];
_trgA setTriggerInterval 3;
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Capital_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Recon_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"", ""

[thisTrigger] execVM 'Scripts\HeliInsert_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"", ""

[thisTrigger] execVM 'Scripts\VehiInsert_CSAT.sqf';

"",""""];

if ( count (nearestobjects [thisTrigger, ['LocationCityCapital_F'], 100]) != 0) then {

_trgA = createTrigger ['EmptyDetector', getPos thisTrigger, false];
_trgA setTriggerArea [1000, 1000, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [17, 17, 17, true];
_trgA setTriggerActivation ['ANYPLAYER', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Capital_Civ.sqf';

"",""""];

};

", ""];

} forEach _objectLocT;


["LOADING . . . "] remoteExec ["hint", 0];
sleep 1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLoc = nearestobjects [position player, ["LocationVillage_F"], 40000]; 
_objectCountFull = count _objectLoc;
_objectCountNew = round ( _objectCountFull / 1.5 );
if (_objectCountNew == 0) then {_objectCountNew = 1;};
_allobjectsShuffled = _objectLoc call BIS_fnc_arrayShuffle;
_allobjectsNew = _allobjectsShuffled select [0, _objectCountNew];


{

_trgA = createTrigger ['EmptyDetector', (getPos _x), false];
_trgA setTriggerArea [1000, 1000, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [8, 8, 8, true];
_trgA setTriggerActivation ['ANYPLAYER', 'PRESENT', false];
_trgA setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Town_Civ.sqf';

", ""];

} forEach _allobjectsNew;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "o_support"};

{
	
_trg = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trg setTriggerArea [2000, 2000, 0, false, 100];
_trg setTriggerInterval 3;
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements [
"this","	

[thisTrigger] execVM 'Scripts\Insurgents_Init.sqf';
	
if ( count (nearestObjects [thisTrigger, ['Land_Cargo_Tower_V3_F', 'Land_Cargo_Tower_V2_F', 'Land_Cargo_Tower_V1_F', 'Land_Cargo_HQ_V3_F', 'Land_Cargo_HQ_V2_F', 'Land_Cargo_HQ_V1_F'], 100] ) == 0) then {

_TERR = nearestTerrainObjects [(getPos thisTrigger), ['FOREST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 40]; 
{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

_mrkrs = allMapMarkers select {markerColor _x == 'Color6_FD_F'};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_P1 = [ 
'Outpost_01',  
'Outpost_02',  
'Outpost_03',  
'Outpost_04',  
'Outpost_05',  
'Outpost_06',  
'Outpost_07',
'Factory_1',  
'Factory_2',
'Factory_1',  
'Factory_2'        
]; 	

if (_DANSCORE > 5) then {
_P1 = [ 
'Outpost_08',  
'Outpost_09',  
'Outpost_10',  
'Outpost_11',  
'Outpost_12',  
'Outpost_13',
'Factory_3',  
'Factory_4',
'Factory_3',  
'Factory_4'
]; };

if (_DANSCORE > 10) then {
_P1 = [ 
'Outpost_14',  
'Outpost_15',  
'Outpost_16',  
'Outpost_17',  
'Outpost_18',
'Factory_5',  
'Factory_6',  
'Factory_5',  
'Factory_6'   
]; };


_dir = 0 + (random 360);
if (count (nearestObjects [(getPos thisTrigger), ['House'], 200]) != 0) then {
_dir = getDirVisual ((nearestObjects [(getPos thisTrigger), ['House'], 200]) select 0);
};


_compReference = [ selectRandom _P1, (getPos thisTrigger), [0,0,0], _dir, true ] call LARs_fnc_spawnComp;

_ARRAY = [ _compReference ] call LARs_fnc_getCompObjects;
{_x setVectorUp [0,0,1];} forEach _ARRAY; 
};

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
_trgA setTriggerArea [1000, 1000, 0, false, 100];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [11,11, 11, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Outpost_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\Recon_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"", ""

[thisTrigger] execVM 'Scripts\HeliInsert_CSAT.sqf';

"",""""];

_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
_trgA setTriggerArea [500, 500, 0, false, 60];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"", ""

[thisTrigger] execVM 'Scripts\VehiInsert_CSAT.sqf';

"",""""];


", ""];

} forEach _objectLocT;




["LOADING . . . "] remoteExec ["hint", 0];
sleep 1;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_objectLocT = allMapMarkers select { markerType _x == "o_service"};

{


_trg = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trg setTriggerArea [2000, 2000, 0, false, 100];
_trg setTriggerInterval 3;
_trg setTriggerTimeout [1, 1, 1, true];
_trg setTriggerActivation ["WEST", "PRESENT", false];
_trg setTriggerStatements [
"this","	

_TERR = nearestTerrainObjects [(getPos thisTrigger), ['FOREST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 40]; 
{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

_mrkrs = allMapMarkers select {markerColor _x == 'Color6_FD_F'};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_P1 = [ 
'Road_Post_CSAT_01',  
'Road_Post_CSAT_02',
'Road_Post_CSAT_01',  
'Road_Post_CSAT_02',
'Road_Post_CSAT_01',  
'Road_Post_CSAT_02',
'Road_Post_CSAT_01',  
'Road_Post_CSAT_02',
'Watchpost_1', 
'Watchpost_2', 
'Watchpost_3', 
'Watchpost_4', 
'Watchpost_5', 
'Watchpost_6',
'Watchpost_7',
'Watchpost_8',
'Watchpost_9',
'Watchpost_10'
 ]; 

if (_DANSCORE > 5) then {
_P1 =  [ 
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Road_Post_CSAT_03',  
'Road_Post_CSAT_04',
'Watchpost_1', 
'Watchpost_2', 
'Watchpost_3', 
'Watchpost_4', 
'Watchpost_5', 
'Watchpost_6',
'Watchpost_7',
'Watchpost_8',
'Watchpost_9',
'Watchpost_10'
]; };

if (_DANSCORE > 10) then {
_P1 =  [ 
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Road_Post_CSAT_05',  
'Road_Post_CSAT_06',
'Watchpost_1', 
'Watchpost_2', 
'Watchpost_3', 
'Watchpost_4', 
'Watchpost_5', 
'Watchpost_6',
'Watchpost_7',
'Watchpost_8',
'Watchpost_9',
'Watchpost_10'
]; };

       _nearRoad = ( (getPos thisTrigger) nearRoads 10 ) select 0;
		_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
		_dir = _nearRoad getDir _nextRoad;
		
		
_COM = [ selectRandom _P1, getPosATL _nearRoad, [0,0,0], _dir, true ] call LARs_fnc_spawnComp;	
_ARRAY = [ _COM ] call LARs_fnc_getCompObjects;
{_x setVectorUp [0,0,1]} forEach _ARRAY;


_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
_trgA setTriggerArea [1000, 1000, 0, false, 100];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [3, 3, 3, true];
_trgA setTriggerActivation ['WEST', 'PRESENT', false];
_trgA setTriggerStatements [
""this"",""

[thisTrigger] execVM 'Scripts\RoadBlock_CSAT.sqf';

"",""""];

", ""];

} forEach _objectLocT;

sleep 1;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_objectLocT = allMapMarkers select { markerType _x == "o_recon" };

{

_trgA = createTrigger ["EmptyDetector", getMarkerpos _x, false];
_trgA setTriggerArea [1500, 1500, 0, false, 100];
_trgA setTriggerInterval 3;
_trgA setTriggerTimeout [1, 1, 1, true];
_trgA setTriggerActivation ["WEST", "PRESENT", false];
_trgA setTriggerStatements [
"this","

[thisTrigger] execVM 'Scripts\Mission_Intel.sqf';

", ""];

sleep 0.2 ;

} forEach _objectLocT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
sleep 4;


_OAA = nearestObjects [position player, ["O_Radar_System_02_F", "O_SAM_System_04_F"], 40000];
{
_gRPcREW = createVehicleCrew _x ;
_Group = createGroup East; 
{[_x] join _Group} forEach units _gRPcREW;

 } foreach _OAA;
 
 _AA = nearestObjects [position player, ["O_SAM_System_04_F"], 40000];
{
_x removeAllEventHandlers "Killed";
_x addEventHandler ["Killed", { 
_MMarks = allMapMarkers select { markerType _x == "o_antiair"};
_M = [_MMarks, (_this select 0)] call BIS_fnc_nearestPosition;

deleteMarker _M ; 

				[40, "AA SITE"] execVM "Scripts\NOtification.sqf" ;

[40] execVM "Scripts\Reward.sqf";

_markerName = "AssaultMark" + (str (position player));  
_mrkr = createMarkerLocal [_markerName, position player]; 
_mrkr setMarkerType "loc_Bunker";
_mrkr setMarkerAlpha 0.003;

[] execVM "Scripts\DangerPlus.sqf";
[(_this select 0), 1000] execVM "Scripts\QuickRF.sqf";
  
}];

 } foreach _AA;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

TRG1LOCC = 1;
publicVariable "TRG1LOCC";