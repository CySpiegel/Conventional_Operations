_placement = _this select 0;

ctrlDelete (findDisplay 999 displayCtrl 1600)  ;
ctrlDelete (findDisplay 999 displayCtrl 1955)  ;
ctrlDelete (findDisplay 999 displayCtrl 1956)  ;

(findDisplay 999) closeDisplay 1;

_Revivebox = findDisplay 999 displayCtrl 1954;
_playerbox = findDisplay 999 displayCtrl 1955;
_enemybox = findDisplay 999 displayCtrl 1956;
_civilianbox = findDisplay 999 displayCtrl 1957;
_Presencebox = findDisplay 999 displayCtrl 1958;
_Resourcesbox = findDisplay 999 displayCtrl 1959;
_Reputationbox = findDisplay 999 displayCtrl 1960;
_Difficultybox = findDisplay 999 displayCtrl 1961;
ReviveBoxName = _Revivebox lbText lbCurSel _Revivebox;
PlayerfactionName = _playerbox lbText lbCurSel _playerbox;
EnemyfactionName = _enemybox lbText lbCurSel _enemybox;
CivilianfactionName = _civilianbox lbText lbCurSel _civilianbox;
PresenceName = _Presencebox lbText lbCurSel _Presencebox;
ResourcesName = _Resourcesbox lbText lbCurSel _Resourcesbox;
ReputationName = _Reputationbox lbText lbCurSel _Reputationbox;
DifficultyName = _Difficultybox lbText lbCurSel _Difficultybox;

if ((PlayerfactionName == "") or (EnemyfactionName == "") or (CivilianfactionName == "") or (ReviveBoxName == "") or (PresenceName == "") or (ResourcesName == "") or (ReputationName == "") or (DifficultyName == "")) then {execVM "Scripts\Dialog_Faction.sqf";} else {

hint "Done";

_mrkr = createMarker ["Reputation_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "Color4_FD_F";
_mrkr setMarkerSize [0.6, 0.6]; 
if (ReputationName == "LOW_Enemy to Guerillas") then {_mrkr setMarkerText "2"};
if (ReputationName == "MEDIUM_Neutral to Guerillas") then {_mrkr setMarkerText "9"};
if (ReputationName == "HIGH_Friendly to Guerillas") then {_mrkr setMarkerText "16"};
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Difficulty_Handle",  [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "Color6_FD_F";
_mrkr setMarkerSize [0.6, 0.6]; 
if (DifficultyName == "EASY _ Low Enemy Presence _ progressive") then {_mrkr setMarkerText "0"};
if (DifficultyName == "NORMAL _ Half Enemy Presence _ progressive") then {_mrkr setMarkerText "6"};
if (DifficultyName == "HARD _ Full Enemy Presence _ progressive") then {_mrkr setMarkerText "11"};
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Money_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "Color2_FD_F";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText ResourcesName; 
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Revive_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "Color1_FD_F";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText ReviveBoxName; 
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Friendly_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "ColorGrey";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText PlayerfactionName; 
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Enemy_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "ColorGrey";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText EnemyfactionName; 
_mrkr setMarkerAlpha 0.005;


_mrkr = createMarker ["Civilian_Handle", [0, 0, 0]]; 
_mrkr setMarkerType "loc_SafetyZone";
_mrkr setMarkerColor "ColorGrey";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText CivilianfactionName; 
_mrkr setMarkerAlpha 0.005;


titleText ["", "BLACK IN",7, true, true];
		
HQLOCC = 0;
publicVariable "HQLOCC";
hint "Choose Your Starting Point"; 
openMap [true, true]; 
	
onMapSingleClick {
onMapSingleClick {}; 
player setpos _pos;
TSAT setpos _pos;
hint "Loading..."; 
HQLOCC = 1;
publicVariable "HQLOCC";
titleText ["", "BLACK IN",999, true, true];
};

waitUntil {HQLOCC == 1};
openMap [true, false]; 
openMap [false, false];


_FOBC = createVehicle ["B_Slingload_01_Cargo_F",(position player),[],5,"NONE"];

_FOBC allowDammage false;

if (isMultiplayer) then {
_relpos = _FOBC getRelPos [12, 0];
_markerName = "respawn_west" + (str (position _FOBC));  
_mrkr = createMarker [_markerName, _relpos];  
_mrkr setMarkerType "b_unknown";
_mrkr setMarkerSize [0.6, 0.6]; 
_mrkr setMarkerText "Respawn"; 
_mrkr setMarkerAlpha 1;
 
};

if (PresenceName != "00% _ Mission Making") then {
	
if (PresenceName == "10% _ Small Operation") then {EnemyPrec = 7};
if (PresenceName == "30% _ Short Campaign") then {EnemyPrec = 3};
if (PresenceName == "50% _ Medium Campaign") then {EnemyPrec = 2};
if (PresenceName == "75% _ Long Campaign") then {EnemyPrec = 1.5};
if (PresenceName == "100% _ Dedi Servers with HCs") then {EnemyPrec = 1};

ZonMarkers = execVM "Scripts\init_Markers.sqf";
waitUntil { scriptDone ZonMarkers };
  } else {DIALOCC = 1; publicVariable "DIALOCC";};

};

sleep 2 ; 

