
_Mount = _this select 0;
_Watchpost = _this select 1;

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_TERR = nearestTerrainObjects [locationPosition _Mount, ["House", "TREE", "SMALL TREE", "BUSH", "ROCK", "ROCKS"], 15]; 
{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

_COM = [ _Watchpost, locationPosition _Mount, [0,0,0], (0 + (random 350)), false, false, true ] call LARs_fnc_spawnComp; 
_ARRAY = [ _COM ] call LARs_fnc_getCompObjects;
_MainARRAY = _ARRAY select { typeof _x != "O_G_Mortar_01_F" && typeof _x != "O_G_HMG_02_high_F"} ; 
sleep 2 ;

{[_x, 0, position _x, "ATL"] call BIS_fnc_setHeight; _x setVectorUp [0,0,1]; } forEach _MainARRAY;


PRL = [(locationPosition _Mount) getPos [(10 +(random 5)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, locationPosition _Mount, 50] call BIS_fnc_taskPatrol;

if (_DANSCORE > 10) then {
PRL = [(locationPosition _Mount) getPos [(10 +(random 5)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, locationPosition _Mount, 200] call BIS_fnc_taskPatrol;
};

sleep 4 ;

_HeavGun =  nearestObjects [locationPosition _Mount, ["O_G_Mortar_01_F", "O_G_HMG_02_high_F"], 70] select 0;
_Group = createVehicleCrew _HeavGun; 

_allPositionBuildings = nearestObjects [locationPosition _Mount, ["Land_BagBunker_Large_F", "Land_BagBunker_Small_F", "Land_Cargo_House_V3_F", "Land_Cargo_House_V1_F", "Land_Cargo_Patrol_V3_F", "Land_Cargo_Patrol_V2_F", "Land_Cargo_Patrol_V1_F"], 15] ;  



_HQW = selectRandom _allPositionBuildings ;
_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  

_HQW = selectRandom _allPositionBuildings ;
_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  

_HQW = selectRandom _allPositionBuildings ;
_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 





