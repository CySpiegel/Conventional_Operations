
_nearRoad = _this select 0;
_dir = _this select 1;

_allWatchposts = [ 
"Watchpost_2", 
"Watchpost_3", 
"Watchpost_4", 
"Watchpost_5", 
"Watchpost_7",
"Watchpost_9"
]; 

_COM = [selectRandom _allWatchposts, getPos _nearRoad, [0,0,0], _dir, false, false, true ] call LARs_fnc_spawnComp; 
_ARRAY = [ _COM ] call LARs_fnc_getCompObjects;
_MainARRAY = _ARRAY select { typeof _x != "O_G_Mortar_01_F" && typeof _x != "O_G_HMG_02_high_F"} ; 
{[_x, 0, position _x, "ATL"] call BIS_fnc_setHeight; _x setVectorUp [0,0,1]; } forEach _MainARRAY;

sleep 4;

_HeavGun =  nearestObjects [getPos _nearRoad, ["O_G_Mortar_01_F", "O_G_HMG_02_high_F"], 50] select 0;
_Group = createVehicleCrew _HeavGun; 


_Buildings = nearestObjects [getPos _nearRoad, ["HOUSE", "Strategic"], 20] ;  
_HQW = _allPositionBuildings select 0;

_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  

_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 
((units _G) select 0) disableAI "PATH";  

_G = [ (selectRandom (_HQW buildingPos -1)), East,[selectRandom East_Units]] call BIS_fnc_spawnGroup; 




