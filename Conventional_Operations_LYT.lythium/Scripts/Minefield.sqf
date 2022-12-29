
_thisMineFieldTrigger = _this select 0;
 _allForcesMarks = allMapMarkers select {markerType _x == "loc_DangerousForces" && markerColor _x == "colorOPFOR"};  

if (count (_allForcesMarks) < 6) then {
_Mines = [ "APERSMine", "APERSBoundingMine" ]; 
 
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 100))];
};

if ((count (_allForcesMarks) > 5) && (count (_allForcesMarks) < 11)) then {
_Mines = [ "APERSMine", "APERSBoundingMine" ]; 
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 250))];
};

if (count (_allForcesMarks) > 10) then {
_Mines = [ "APERSMine", "APERSBoundingMine" ]; 
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine [selectRandom _Mines,  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];
_mine = createMine ["ATMine",  getpos _thisMineFieldTrigger, [], (0 + (random 450))];

};


_TFOBA = createTrigger ["EmptyDetector", getpos _thisMineFieldTrigger];  
_TFOBA setTriggerArea [350, 350, 0, false, 50];  
_TFOBA setTriggerInterval 2;  
_TFOBA setTriggerActivation ["ANYPLAYER", "PRESENT", false];  
_TFOBA setTriggerStatements [  
"count (allMines select {position _x inArea thisTrigger}) == 0",  
"
_MMarks = allMapMarkers select { markerType _x == 'loc_mine'};
_M = [_MMarks,  thisTrigger] call BIS_fnc_nearestPosition;

deleteMarker _M ; 

				[50, 'MINEFIELD'] execVM 'Scripts\NOtification.sqf' ;

[50] execVM 'Scripts\Reward.sqf';
[] execVM 'Scripts\ReputationPlus.sqf';
[] execVM 'Scripts\ReputationPlus.sqf';
execVM 'Scripts\Civ_Relations.sqf';

", ""];
















