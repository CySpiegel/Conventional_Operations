_thisRadioTrigger = _this select 0;
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_RadioTower = nearestObjects [(getPos _thisRadioTrigger), ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F", "Land_Communication_F"], 150] select 0;   
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];

_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];

_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];

_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];

_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];

_Mine = selectRandom [ 
"APERSMine", 
"APERSBoundingMine"
 ]; 
_mine = createMine [_Mine,  (getpos _thisRadioTrigger), [], (0 + (random 40))];
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_Position = nearestObjects [(getpos _thisRadioTrigger), ["Land_TTowerBig_2_F", "Land_TTowerBig_1_F", "Land_Communication_F"], 150] select 0;  
_poss = getPos _Position ;

if (_DANSCORE < 6) then {
PRL = [_Position getPos [(40 + (random 10)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 50] call BIS_fnc_taskPatrol;
};

if ((_DANSCORE > 5) && (_DANSCORE < 11)) then {
PRL = [_Position getPos [(40 + (random 10)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 150] call BIS_fnc_taskPatrol;
};

if (_DANSCORE > 10) then {
PRL = [_Position getPos [(40 + (random 10)), (0 + (random 350))], East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 300] call BIS_fnc_taskPatrol;
};

