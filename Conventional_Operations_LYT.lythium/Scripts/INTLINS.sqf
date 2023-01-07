sleep 2;
_Chance = selectRandom [0, 1, 2, 3, 4, 5]; 

if (_Chance == 5) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel Suggests Enemy Support Convoy will be Launched toward Frontlines, We can Intercept the Convoy and Dismantle their Reinforcements and Support operation,  (Optional Mission : Destroy Enemy Convoy)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;


						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];

						} ;

						if (!_result) then {
						_Enemy_Convoy = execVM "Scripts\Mission_Convoy.sqf";

						  };
		};

} ;



if (_Chance == 3) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel is about a Friendly Aircraft CrashSite, We can Track them Down and Rescue the Pilot and Destroy the Wreck,  (Optional Mission : Rescue Captured Pilot)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
						} ;

						if (!_result) then {
								_Mountall =  nearestLocations [(getPos player), ["Mount"], 3000] ;
								_MountNear =  nearestLocations [(getPos player), ["Mount"], 1000] ;				
								_Mount = selectRandom (_Mountall - _MountNear) ;									
								_markerName = "InvesMark" + (str (locationPosition _Mount));   
								_mrkr = createMarker [_markerName, locationPosition _Mount];   
								_mrkr setMarkerType "mil_unknown";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", locationPosition _Mount];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Pilot.sqf';


								", ""];
								
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _mrkr;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
						  };
		};

} ;




if (_Chance == 4) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel Suggest the whereabouts of the Friendly Squad we Lost Contact with Earlier, We can Track them down and Rescue Them,  (Optional Mission : Rescue Missing Squad)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
						_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf"};
						_x = [_INTL,  player] call BIS_fnc_nearestPosition;
						_x setMarkerAlpha 1;

								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
						} ;

						if (!_result) then {
								_Mountall =  nearestLocations [(getPos player), ["Mount"], 3000] ;
								_MountNear =  nearestLocations [(getPos player), ["Mount"], 1000] ;				
								_Mount = selectRandom (_Mountall - _MountNear) ;													
								_markerName = "InvesMark" + (str (locationPosition _Mount));   
								_mrkr = createMarker [_markerName, locationPosition _Mount];   
								_mrkr setMarkerType "mil_warning";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", locationPosition _Mount];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Squad.sqf';


								", ""];
						
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _mrkr;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
						  };
		};

} ;



if (_Chance < 3) then {
_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf"};
_x = [_INTL,  player] call BIS_fnc_nearestPosition;
_x setMarkerAlpha 1;

								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
									_attackingAtGrid = mapGridPosition getMarkerPos _x;
								[[west,"HQ"], "Enemy Presence Confirmed at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
};


