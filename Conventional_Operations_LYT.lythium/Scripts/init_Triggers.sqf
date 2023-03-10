////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  
//////Resources/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


_trgMstr = createTrigger ["EmptyDetector", [0,0,0]];
_trgMstr setTriggerArea [20, 20, 0, false, 60];
_trgMstr setTriggerInterval 2;
_trgMstr setTriggerActivation ["NONE", "PRESENT", true];
_trgMstr setTriggerTimeout [2, 3, 3, true];
_trgMstr setTriggerStatements ["count (allMapMarkers select {(markerAlpha _x == 0.001 or markerAlpha _x == 0) && ((markerPos _x) distance (getPos cursorObject) <= 200) && (markerType _x == 'o_antiair' || markerType _x == 'loc_Transmitter' || markerType _x == 'o_service' || markerType _x == 'loc_Power' || markerType _x == 'o_support' || markerType _x == 'n_support' || markerType _x == 'loc_Ruin' || markerType _x == 'n_installation' || markerType _x == 'o_installation')}) > 0", "

_CAST = screenToWorld [0.5,0.5];
 _MMarks = allMapMarkers select { markerType _x == 'o_antiair' || markerType _x == 'loc_Transmitter' || markerType _x == 'o_service' || markerType _x == 'loc_Power' || markerType _x == 'o_support' || markerType _x == 'n_support' || markerType _x == 'loc_Ruin' || markerType _x == 'n_installation' || markerType _x == 'o_installation' };
_M = [_MMarks,  _CAST] call BIS_fnc_nearestPosition;
if ((markerAlpha _M == 0.001) or (markerAlpha _M == 0)) then {
_M setMarkerAlpha 1;  
[parseText ""<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t t color='#959393' align = 'right' shadow = '1' size='1.5'>Scout Intel Recived </t>"", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec [""BIS_fnc_textTiles"", 0];
   openMap true;
[markerSize _M, markerPos _M, 1] call BIS_fnc_zoomOnArea; };

", ""];

//////////////////////////////////////////////////////////////////////////////////////////////

_trgINT = createTrigger ["EmptyDetector", [0,0,0]];
_trgINT setTriggerArea [1, 1, 0, false, 1];
_trgINT setTriggerInterval 2;
_trgINT setTriggerActivation ["WEST", "PRESENT", true];
_trgINT setTriggerStatements [
"('FlashDisk' in ((vestItems player + uniformitems player + backpackItems player))) or ('FilesSecret' in ((vestItems player + uniformitems player + backpackItems player))) or ('SmartPhone' in ((vestItems player + uniformitems player + backpackItems player))) or ('MobilePhone' in ((vestItems player + uniformitems player + backpackItems player))) or ('DocumentsSecret' in ((vestItems player + uniformitems player + backpackItems player)))",
"player removeItem 'FlashDisk';player removeItem 'FilesSecret';player removeItem 'SmartPhone';player removeItem 'MobilePhone';player removeItem 'DocumentsSecret';[] execVM 'Scripts\INTL.sqf';", ""];

//////////////////////////////////////////////////////////////////////////////////////////////



Hints = false ;
		5 fadeSound 1;
		
sleep 1;




["LOADING 100 % "] remoteExec ["hint", 0];

titleText ["<t color='#0188FE' size='2' font='PuristaBold'>B.S.P  |  CONVENTIONAL OPERATIONS</t>", "BLACK IN",7, true, true];

hintSilent "" ;

player hideObjectGlobal false;
player enableSimulationGlobal true;
player allowDammage true;

if (isMultiplayer) then {
forceRespawn player;
};

player linkItem "B_UavTerminal";

