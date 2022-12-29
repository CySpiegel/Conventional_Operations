_thisReconTrigger = _this select 0;
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

_poss = [_thisReconTrigger, 10, 200, 1, 0, 0.5, 0] call BIS_fnc_findSafePos;

if (_DANSCORE < 6) then {
[ "Recon_Camp_CSAT_1", _poss, [0,0,0], 0, true ] call LARs_fnc_spawnComp;
sleep 1;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],50];
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 500] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 1000] call BIS_fnc_taskPatrol;
};

if ((_DANSCORE > 5) && (_DANSCORE < 11)) then {
[ "Recon_Camp_CSAT_2", _poss, [0,0,0], 0, true ] call LARs_fnc_spawnComp;
sleep 1;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],50];
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 500] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 1000] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 2000] call BIS_fnc_taskPatrol;
};

if (_DANSCORE > 10) then {
[ "Recon_Camp_CSAT_3", _poss, [0,0,0], 0, true ] call LARs_fnc_spawnComp;
sleep 1;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],50];
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 500] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 1000] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 2000] call BIS_fnc_taskPatrol;
PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
(_x setUnitPos "MIDDLE") forEach units PRL;
[PRL, _poss, 3000] call BIS_fnc_taskPatrol;
};


{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;





