sleep 2;
_Chance = selectRandom [1, 2, 3, 4, 5, 6, 7, 8]; 

	if (count (allMapMarkers select {(markerAlpha _x == 0.001 or markerAlpha _x == 0) && (markerType _x == 'o_armor' || markerType _x == 'o_plane' || markerType _x == 'o_antiair' || markerType _x == 'loc_Transmitter' || markerType _x == 'o_service' || markerType _x == 'loc_Power' || markerType _x == 'o_support' || markerType _x == 'n_support' || markerType _x == 'loc_Ruin' || markerType _x == 'n_installation' || markerType _x == 'o_installation')}) == 0) then {
		_Chance = selectRandom [5, 6, 7, 8]; 
	};



if (_Chance < 5) then {
							
								_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown" && markerType _x != "o_inf"};
								_x = [_INTL,  player] call BIS_fnc_nearestPosition;
								_x setMarkerAlpha 1;

								openMap true;
								 [markerSize _x, markerPos _x, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
} ;


if (_Chance == 5) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel Show the Location of an Enemy Stationary Warship in the Open Seas, It can be Infiltrated and Secured,  (Optional Mission : Secure Enemy Battle ship)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
								_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown"};
								_x = [_INTL,  player] call BIS_fnc_nearestPosition;
								_x setMarkerAlpha 1;

								openMap true;
								 [markerSize _x, markerPos _x, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						} ;

						if (!_result) then {
							
								_objectLoc = selectRandom nearestobjects [position player, ["LocationArea_F"], 40000]; 								
								_pos = [ getPos _objectLoc, 0, 2500, 3, 2, 1, 0] call BIS_fnc_findSafePos;
								_markerName = "CShipMark" + (str (getPos _x));
								_mrkr = createMarkerLocal [_markerName,_pos];   
								_mrkr setMarkerTypeLocal "o_naval";  
								_mrkr setMarkerColorLocal "colorOPFOR";  
								_mrkr setMarkerSize [1.2, 1.2]; 
								_mrkr setMarkerAlpha 0.001;  
 
								_trgA = createTrigger ["EmptyDetector", getPos _x];
								_trgA setTriggerArea [3000, 3000, 0, false, 100];
								_trgA setTriggerInterval 3;
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Ship.sqf';

								", ""];
								
								openMap true;
								 [markerSize _mrkr, markerPos _mrkr, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						  };
		};

} ;


if (_Chance == 6) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel is about a Friendly Aircraft CrashSite, We can Track them Down and Rescue the Pilot and Destroy the Wreck,  (Optional Mission : Rescue Captured Pilot)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
								_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown"};
								_x = [_INTL,  player] call BIS_fnc_nearestPosition;
								_x setMarkerAlpha 1;

								openMap true;
								 [markerSize _x, markerPos _x, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						} ;

						if (!_result) then {
							
								_allZoneMarks = allMapMarkers select {markerType _x == "loc_Power" || markerType _x == "o_support" || markerType _x == "n_support" || markerType _x == "loc_Ruin" || markerType _x == "n_installation" || markerType _x == "o_installation"} ;  
								_ENMMrk = [_allZoneMarks,  player] call BIS_fnc_nearestPosition ;								
														
								_Mountall =  nearestLocations [(getMarkerPos _ENMMrk), ["Mount"], 1500] ;
								_MountNear =  nearestLocations [(getMarkerPos _ENMMrk), ["Mount"], 500] ;				
								_Mount = selectRandom (_Mountall - _MountNear) ;									
								_markerName = "InvesMark" + (str (locationPosition _Mount));   
								_mrkr = createMarker [_markerName, locationPosition _Mount];   
								_mrkr setMarkerType "mil_unknown";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", locationPosition _Mount];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerInterval 3;
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Pilot.sqf';


								", ""];
								
								openMap true;
								 [markerSize _mrkr, markerPos _mrkr, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						  };
		};

} ;

if (_Chance == 7) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel Suggest the whereabouts of the Friendly Squad we Lost Contact with Earlier, We can Track them down and Rescue Them,  (Optional Mission : Rescue Missing Squad)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;

						if (_result) then {
							
									_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown"};
									_x = [_INTL,  player] call BIS_fnc_nearestPosition;
									_x setMarkerAlpha 1;

									openMap true;
									 [markerSize _x, markerPos _x, 0.5] call BIS_fnc_zoomOnArea;
									sleep 1;
									[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						} ;

						if (!_result) then {
								_allZoneMarks = allMapMarkers select {markerType _x == "loc_Power" || markerType _x == "o_support" || markerType _x == "n_support" || markerType _x == "loc_Ruin" || markerType _x == "n_installation" || markerType _x == "o_installation"} ;  
								_ENMMrk = [_allZoneMarks,  player] call BIS_fnc_nearestPosition ;								
														
								_Mountall =  nearestLocations [(getMarkerPos _ENMMrk), ["Mount"], 1500] ;
								_MountNear =  nearestLocations [(getMarkerPos _ENMMrk), ["Mount"], 500] ;				
								_Mount = selectRandom (_Mountall - _MountNear) ;													
								_markerName = "InvesMark" + (str (locationPosition _Mount));   
								_mrkr = createMarker [_markerName, locationPosition _Mount];   
								_mrkr setMarkerType "mil_warning";  
								_mrkr setMarkerColor "colorOPFOR";  
								_mrkr setMarkerSize [0.8, 0.8]; 
								
								_trgA = createTrigger ["EmptyDetector", locationPosition _Mount];
								_trgA setTriggerArea [2000, 2000, 0, false, 60];
								_trgA setTriggerInterval 3;
								_trgA setTriggerTimeout [7, 7, 7, true];
								_trgA setTriggerActivation ["WEST", "PRESENT", false];
								_trgA setTriggerStatements [
								"this","

								[thisTrigger] execVM 'Scripts\Mission_Squad.sqf';


								", ""];
						
								openMap true;
								 [markerSize _mrkr, markerPos _mrkr, 0.5] call BIS_fnc_zoomOnArea;
								sleep 1;
								[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						  };
		};

} ;

if (_Chance == 8) then {
		GNRT = "YES" ;
		DVRT = "NO" ;
		0 = [] spawn {
			  _result = ["Intel Suggests Enemy Support Convoy will be Launched toward Frontlines, We can Intercept the Convoy and Dismantle their Reinforcements and Support operation,  (Optional Mission : Destroy Enemy Convoy)", "", DVRT, GNRT,nil, false, false] call BIS_fnc_guiMessage;


						if (_result) then {
							
							_INTL = allMapMarkers select { (markerAlpha _x == 0.001 or markerAlpha _x == 0) && markerColor _x == "colorOPFOR" && markerType _x != "o_unknown"};
							_x = [_INTL,  player] call BIS_fnc_nearestPosition;
							_x setMarkerAlpha 1;

							openMap true;
							 [markerSize _x, markerPos _x, 0.5] call BIS_fnc_zoomOnArea;
							sleep 1;
							[parseText "<t color='#FACE00' font='PuristaBold' align = 'right' shadow = '1' size='3'>+ NEW INTEL</t><br /><t  align = 'right' shadow = '1' size='1.5'>Military Intel Received </t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

						} ;

						if (!_result) then {
						_Enemy_Convoy = execVM "Scripts\Mission_Convoy.sqf";

						  };
		};

} ;


