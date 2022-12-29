	
	waitUntil {sleep 120 ; (count (allMapMarkers select {markerType _x == "loc_Bunker"}) > 0)} ; 
	
	sleep 10 ;	

				_BunkMarks = allMapMarkers select {markerType _x == "loc_Bunker" && markerAlpha _x == 0.003};  
				{deleteMarker _x ;} forEach _BunkMarks ;
					
					
	_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
	_mrkr = _mrkrs select 0;
	_DANSCORE = parseNumber (markerText _mrkr) ;  
			
			_Time = 900 ;
			if (_DANSCORE > 3) then {_Time = 700 ;} ; 
			if (_DANSCORE > 9) then {_Time = 500 ;} ; 
			if (_DANSCORE > 12) then {_Time = 300 ;} ; 
			sleep _Time ;
	

private _headlessClients = entities "HeadlessClient_F";
private _humanPlayers = allPlayers - _headlessClients;

if (count _humanPlayers > 0) then {

			_allZoneMarks = allMapMarkers select {markerType _x == "loc_Power" || markerType _x == "o_support" || markerType _x == "n_support" || markerType _x == "loc_Ruin" || markerType _x == "n_installation" || markerType _x == "o_installation"} ;  
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  

			_DSTall = [] ;
			
				{
					for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					_DSTall append [_DSTach] ;
					}; 
				} forEach _allZoneMarks ;

			_DSTall sort true;
			_DSneeded = _DSTall select 0 ;
			_OBJmrk = [] ; 
			_Destmrk = [] ;
			
				{
					
						for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					if (_DSTach == _DSneeded) then {_Destmrk append [((_AssltDestMrks) select _i)]} ;
					if (_DSTach == _DSneeded) then {_OBJmrk append [_x]} ;
						};
				} forEach _allZoneMarks ;	

			_OBJ =  _OBJmrk select 0;
			_Dest = _Destmrk select 0;
			
			_CNTR = (nearestObjects [(getMarkerPos _Dest), ["Land_Cargo_HQ_V3_F", "Land_Cargo_HQ_V1_F", "Land_Cargo_House_V1_F", "Land_Cargo_House_V3_F", "House"], 300]) select 0 ;

ENMASSmarkerName = "AssltDest" + (str ((getPos TheCommander) getPos [(10 + (random 150)), (0 + (random 360))]));   
 publicVariable "ENMASSmarkerName"; 
 
createMarker [ENMASSmarkerName,  (getPos _CNTR)] ;  
ENMASSmarkerName setMarkerType "mil_marker_noShadow" ;  
ENMASSmarkerName setMarkerColor "colorOPFOR" ;   
ENMASSmarkerName setMarkerSize [2.5, 2.5] ; 
ENMASSmarkerName setMarkerAlpha 0.5 ;   
 
 	[parseText "<t color='#FF3619' font='PuristaBold' align = 'right' shadow = '1' size='3'>! WARNING !</t><br /><t  color='#FF3619'  align = 'right' shadow = '1' size='1.6'>Friendly Objective is Under Attack</t>", [0, 0.5, 1, 1], nil, 13, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
	sleep 1.5 ;
	
 {openMap true; } remoteExec ["call", 0]; 
 [markerSize ENMASSmarkerName, markerPos ENMASSmarkerName, 1 ] remoteExecCall ["BIS_fnc_zoomOnArea" , 0];


			[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
			[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
		_PRL = [(getMarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
		_WP_1 = _PRL addWaypoint [getMarkerPos _Dest, 0]; 
		_WP_1 SetWaypointType "MOVE"; 



	sleep 10 ;



		if (_DANSCORE > 5) then {
 
			[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
			[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
		_PRL = [(getMarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
		_WP_1 = _PRL addWaypoint [getMarkerPos _Dest, 0]; 
		_WP_1 SetWaypointType "MOVE"; 
		
			};


	sleep 10 ;


		if (_DANSCORE > 9) then {
			[_CNTR] execVM "Scripts\VehiInsert_CSAT_3.sqf";
			[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
			[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
		_PRL = [(getMarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
		_WP_1 = _PRL addWaypoint [getMarkerPos _Dest, 0]; 
		_WP_1 SetWaypointType "MOVE"; 		
			
			};


	sleep 10 ;


		if (_DANSCORE > 12) then {
				
			[_CNTR] execVM "Scripts\VehiInsert_CSAT_3.sqf";
			[_CNTR] execVM "Scripts\VehiInsert_CSAT.sqf";
			[_CNTR] execVM "Scripts\HeliInsert_CSAT.sqf";
		_PRL = [(getMarkerPos _OBJ) getPos [(20 + (random 50)), (0 + (random 360))] , East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
		_WP_1 = _PRL addWaypoint [getMarkerPos _Dest, 0]; 
		_WP_1 SetWaypointType "MOVE"; 		
			
			};


};

	sleep 10 ;	


				_AssMarks = allMapMarkers select {markerType _x == "mil_marker_noShadow" && markerAlpha _x == 0.5 };  
				{deleteMarker _x ;} forEach _AssMarks ;
	
[] execVM "Scripts\Mission_Defend_0.sqf";




	   