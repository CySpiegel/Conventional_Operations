

_TRG = _this select 0;
_RADS = _this select 1;

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_Chance = selectRandom [1, 2, 3]; 
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_allWatchposts = [ 
"Watchpost_1", 
"Watchpost_2", 
"Watchpost_3", 
"Watchpost_4", 
"Watchpost_5", 
"Watchpost_6",
"Watchpost_7",
"Watchpost_8",
"Watchpost_9",
"Watchpost_10"
]; 

_MR = _RADS / 6 ;
_Mounts = nearestLocations [ _TRG, ["Mount"], _MR];   

 
if (_RADS >= 2000) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
};

if (_RADS >= 1000) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
};

if (_DANSCORE > 5) then {
	
if (_RADS >= 2000) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
};
	
if (_RADS >= 1000) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
};
};

if (_DANSCORE > 10) then {
	
if (_RADS >= 2000) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
sleep 1;
};

if (_RADS >= 1500) then {
_Mount = selectRandom _Mounts; 
_Watchpost = selectRandom _allWatchposts; 
[_Mount, _Watchpost] execVM "Scripts\WatchPost.sqf";
sleep 1;
};
};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

if ( INFDIS == 0 ) then {
	

if (_RADS >= 2000) then {
PRL = [_TRG getPos [(10 +(random 90)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _TRG getPos [(10 +(random 90)), (0 + (random 360))], 2000] call BIS_fnc_taskPatrol;
};

if (_RADS >= 1000) then {
PRL = [_TRG getPos [(10 +(random 90)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _TRG getPos [(10 +(random 90)), (0 + (random 360))], 50] call BIS_fnc_taskPatrol;
PRLL = Leader PRL;
PRLL addEventHandler ["Killed", { 
 _QRF = selectRandom [ "Scripts\HeliInsert_CSAT.sqf", "Scripts\VehiInsert_CSAT.sqf"]; 
 [(_this select 0)] execVM _QRF;
 _flare = "F_20mm_Red" createVehicle [getPos (_this select 0) select 0, getPos (_this select 0) select 1, 120]; 
_flare setVelocity [0,0,-0.1];
 }];
};


if (_DANSCORE > 5) then {
	
if (_RADS >= 2000) then {
PRL = [_TRG getPos [(10 +(random 90)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _TRG getPos [(10 +(random 90)), (0 + (random 360))], 2000] call BIS_fnc_taskPatrol;
};

if (_RADS >= 1000) then {
PRL = [_TRG getPos [(10 +(random 90)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _TRG getPos [(10 +(random 90)), (0 + (random 360))], 50] call BIS_fnc_taskPatrol;
PRLL = Leader PRL;
PRLL addEventHandler ["Killed", { 
 _QRF = selectRandom [ "Scripts\HeliInsert_CSAT.sqf", "Scripts\VehiInsert_CSAT.sqf"]; 
 [(_this select 0)] execVM _QRF;
 _flare = "F_20mm_Red" createVehicle [getPos (_this select 0) select 0, getPos (_this select 0) select 1, 120]; 
_flare setVelocity [0,0,-0.1];
 }];
};

};

if (_DANSCORE > 10) then {
if (_RADS >= 2000) then {
PRL = [_TRG getPos [(10 +(random 90)), (0 + (random 360))], East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _TRG getPos [(10 +(random 90)), (0 + (random 360))], 2000] call BIS_fnc_taskPatrol;
	};
};

};

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

[_TRG, 360] execVM "Scripts\INTLitems.sqf";

