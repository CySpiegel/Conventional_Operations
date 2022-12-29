sleep 2;
_POW = nearestObjects [player , [F_Assault_TL], 10000] ;  
_CPOW = _POW select {side _x == civilian};
_THPOW = _CPOW select 0;

_possss = (getPos _THPOW) getPos [(30 + (random 100)), (0 + (random 350))];
_markerName = "CSMark" + (str _possss);
_mrkr = createMarkerLocal [_markerName,_possss];
_mrkr setMarkerType "hd_unknown"; 
_mrkr setMarkerSize [0.7, 0.7];  
_mrkr setMarkerColor "colorCivilian";  
_mrkr setMarkerAlpha 0.7;
openMap true;
 [markerSize _mrkr, markerPos _mrkr, 1.5] call BIS_fnc_zoomOnArea;
sleep 1;
[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t color='#7c7c7c' align = 'right' shadow = '1' size='1.5'>POW Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

 