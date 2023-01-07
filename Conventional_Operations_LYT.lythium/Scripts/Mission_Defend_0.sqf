	
	waitUntil {sleep 120 ; (count (allMapMarkers select {markerType _x == "loc_Bunker" && markerAlpha _x == 0.003}) > 0)} ; 
	
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

	_ENMChances = selectRandom [6, 7, 8, 9] ; 

	if (_DANSCORE > 7) then {
	_ENMChances = selectRandom [1, 2, 3, 4, 5, 6, 7, 8] ; 
	};
	
	if (_ENMChances > 5) then {		
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
	_attackingAtGrid = mapGridPosition getMarkerPos ENMASSmarkerName;
	[[west,"HQ"], "Friendly Location Under Enemy attack at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];


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

	if ((_ENMChances > 2) && (_ENMChances < 6)) then {		
			_allZoneMarks = allMapMarkers select {markerType _x == "loc_Power" || markerType _x == "o_support" || markerType _x == "n_support" || markerType _x == "loc_Ruin" || markerType _x == "n_installation" || markerType _x == "o_installation"} ;  
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  

			_DSTall = [] ;
			
				{
					for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					_DSTall append [_DSTach] ;
					}; 
				} forEach _allZoneMarks ;

			_DSTallall = _DSTall arrayIntersect _DSTall ;
			_DSTallall sort true;
			
			_DSneeded0 = _DSTallall select 0 ;
			_DSneeded1 = _DSTallall select 1 ;
			_DSneeded2 = _DSTallall select 2 ;

			_OBJmrk0 = [] ; 
			_OBJmrk1 = [] ; 
			_OBJmrk2 = [] ; 

			_Destmrk = [] ;
			
				{
					for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					if (_DSTach == _DSneeded0) then {_Destmrk append [((_AssltDestMrks) select _i)]} ;
					if (_DSTach == _DSneeded0) then {_OBJmrk0 append [_x]} ;
					if (_DSTach == _DSneeded1) then {_OBJmrk1 append [_x]} ;
					if (_DSTach == _DSneeded2) then {_OBJmrk2 append [_x]} ;
					
						};
				} forEach _allZoneMarks ;	

			_OBJ0 =  _OBJmrk0 select 0;
			_OBJ1 =  _OBJmrk1 select 0;
			_OBJ2 =  _OBJmrk2 select 0;
			_Dest = _Destmrk select 0;

			_DST0 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ0) ;
			_DST1 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ1) ;
			_DST2 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ2) ;

			
			_MountsAll = [] ; 
			
			_Mounts0All = nearestLocations [ (getMarkerPos _OBJ0), ["Mount"], _DST0];   			
			_Mounts0Neg = nearestLocations [ (getMarkerPos _OBJ0), ["Mount"], 300]; 
  			_Mounts0 = _Mounts0All - _Mounts0Neg ;
			
			_Mounts1All = nearestLocations [ (getMarkerPos _OBJ1), ["Mount"], _DST1];   			
			_Mounts1Neg = nearestLocations [ (getMarkerPos _OBJ1), ["Mount"], 300];  
  			_Mounts1 = _Mounts1All - _Mounts1Neg ;
			
			_Mounts2All = nearestLocations [ (getMarkerPos _OBJ2), ["Mount"], _DST2]; 
			_Mounts2Neg = nearestLocations [ (getMarkerPos _OBJ2), ["Mount"], 300]; 
			_Mounts2 = _Mounts2All - _Mounts2Neg ;

				_MountsAll append _Mounts0 ; 			
				_MountsAll append _Mounts1 ; 			
				_MountsAll append _Mounts2 ; 			
			
	
			_MountsNeg = nearestLocations [ (getMarkerPos (_Destmrk select 0)), ["Mount"], _DST0 / 2]; 
			
			_MountsAllNew = _MountsAll - _MountsNeg ;
			
			_MountsAllFronline = nearestLocations [ (getMarkerPos (_Destmrk select 0)), ["Mount"], _DST0 / 1.3]; 
			
			 _MountsFronline = _MountsAllFronline arrayIntersect _MountsAllNew;
			
			_MountFinal = selectRandom _MountsFronline ;
			
			 ENMASSmarkerName = "AssltOutpost" + (str ((getPos TheCommander) getPos [(10 + (random 150)), (0 + (random 360))]));   
			 publicVariable "ENMASSmarkerName"; 
			 
			createMarker [ENMASSmarkerName,  (locationPosition _MountFinal)] ;  
			ENMASSmarkerName setMarkerType "o_support" ;  
			ENMASSmarkerName setMarkerColor "colorOPFOR" ;   
			ENMASSmarkerName setMarkerSize [1.2, 1.2] ; 
			ENMASSmarkerName setMarkerAlpha 1 ;   

							
						_trg = createTrigger ["EmptyDetector", (locationPosition _MountFinal), false];
						_trg setTriggerArea [2000, 2000, 0, false, 100];
						_trg setTriggerInterval 3;
						_trg setTriggerTimeout [1, 1, 1, true];
						_trg setTriggerActivation ["WEST", "PRESENT", false];
						_trg setTriggerStatements [
						"this","	

						[thisTrigger] execVM 'Scripts\Insurgents_Init.sqf';
							
						if ( count (nearestObjects [thisTrigger, ['Land_Cargo_Tower_V3_F', 'Land_Cargo_Tower_V2_F', 'Land_Cargo_Tower_V1_F', 'Land_Cargo_HQ_V3_F', 'Land_Cargo_HQ_V2_F', 'Land_Cargo_HQ_V1_F'], 100] ) == 0) then {

						_TERR = nearestTerrainObjects [(getPos thisTrigger), ['FOREST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 40]; 
						{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

						_mrkrs = allMapMarkers select {markerColor _x == 'Color6_FD_F'};
						_mrkr = _mrkrs select 0;
						_DANSCORE = parseNumber (markerText _mrkr) ;  

						_P1 = [ 
						'Outpost_01',  
						'Outpost_02',  
						'Outpost_03',  
						'Outpost_04',  
						'Outpost_05',  
						'Outpost_06',  
						'Outpost_07',
						'Factory_1',  
						'Factory_2',
						'Factory_1',  
						'Factory_2'        
						]; 	

						if (_DANSCORE > 5) then {
						_P1 = [ 
						'Outpost_08',  
						'Outpost_09',  
						'Outpost_10',  
						'Outpost_11',  
						'Outpost_12',  
						'Outpost_13',
						'Factory_3',  
						'Factory_4',
						'Factory_3',  
						'Factory_4'
						]; };

						if (_DANSCORE > 10) then {
						_P1 = [ 
						'Outpost_14',  
						'Outpost_15',  
						'Outpost_16',  
						'Outpost_17',  
						'Outpost_18',
						'Factory_5',  
						'Factory_6',  
						'Factory_5',  
						'Factory_6'   
						]; };


						_dir = 0 + (random 360);
						if (count (nearestObjects [(getPos thisTrigger), ['House'], 200]) != 0) then {
						_dir = getDirVisual ((nearestObjects [(getPos thisTrigger), ['House'], 200]) select 0);
						};


						_compReference = [ selectRandom _P1, (getPos thisTrigger), [0,0,0], _dir, true ] call LARs_fnc_spawnComp;

						_ARRAY = [ _compReference ] call LARs_fnc_getCompObjects;
						{_x setVectorUp [0,0,1];} forEach _ARRAY; 
						};

						_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
						_trgA setTriggerArea [1000, 1000, 0, false, 100];
						_trgA setTriggerInterval 3;
						_trgA setTriggerTimeout [11,11, 11, true];
						_trgA setTriggerActivation ['WEST', 'PRESENT', false];
						_trgA setTriggerStatements [
						""this"",""

						[thisTrigger] execVM 'Scripts\Outpost_CSAT.sqf';

						"",""""];

						_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
						_trgA setTriggerArea [500, 500, 0, false, 60];
						_trgA setTriggerInterval 3;
						_trgA setTriggerTimeout [1, 1, 1, true];
						_trgA setTriggerActivation ['WEST', 'PRESENT', false];
						_trgA setTriggerStatements [
						""this"",""

						[thisTrigger] execVM 'Scripts\Recon_CSAT.sqf';

						"",""""];

						_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
						_trgA setTriggerArea [500, 500, 0, false, 60];
						_trgA setTriggerInterval 3;
						_trgA setTriggerTimeout [1, 1, 1, true];
						_trgA setTriggerActivation ['WEST', 'PRESENT', false];
						_trgA setTriggerStatements [
						""this"", ""

						[thisTrigger] execVM 'Scripts\HeliInsert_CSAT.sqf';

						"",""""];

						_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger) getPos [(500 + (random 2000)),(0 + (random 350))], false];
						_trgA setTriggerArea [500, 500, 0, false, 60];
						_trgA setTriggerInterval 3;
						_trgA setTriggerTimeout [1, 1, 1, true];
						_trgA setTriggerActivation ['WEST', 'PRESENT', false];
						_trgA setTriggerStatements [
						""this"", ""

						[thisTrigger] execVM 'Scripts\VehiInsert_CSAT.sqf';

						"",""""];


						", ""];
 
			[parseText "<t color='#FF3619' font='PuristaBold' align = 'right' shadow = '1' size='3'>! WARNING !</t><br /><t  color='#FF3619'  align = 'right' shadow = '1' size='1.6'>Enemy Deployed New Military Installation</t>", [0, 0.5, 1, 1], nil, 13, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
				_attackingAtGrid = mapGridPosition getMarkerPos ENMASSmarkerName;
	[[west,"HQ"], "Enemy Deployed New Military Installation at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
			
			};


	if (_ENMChances < 6) then {		
			_allZoneMarks = allMapMarkers select {markerType _x == "loc_Power" || markerType _x == "o_support" || markerType _x == "n_support" || markerType _x == "loc_Ruin" || markerType _x == "n_installation" || markerType _x == "o_installation"} ;  
			_AssltDestMrks = allMapMarkers select {markerType _x == "b_installation"  && (markerColor _x == "ColorYellow" or  markerColor _x == "colorBLUFOR" or markerColor _x == "colorWEST")};  

			_DSTall = [] ;
			
				{
					for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					_DSTall append [_DSTach] ;
					}; 
				} forEach _allZoneMarks ;

			_DSTallall = _DSTall arrayIntersect _DSTall ;
			_DSTallall sort true;
			
			_DSneeded0 = _DSTallall select 0 ;
			_DSneeded1 = _DSTallall select 1 ;
			_DSneeded2 = _DSTallall select 2 ;

			_OBJmrk0 = [] ; 
			_OBJmrk1 = [] ; 
			_OBJmrk2 = [] ; 

			_Destmrk = [] ;
			
				{
					for "_i" from 0 to count _AssltDestMrks -1 do { 
					_DSTach = getMarkerPos ((_AssltDestMrks) select _i) distanceSqr (getMarkerPos _x) ;
					if (_DSTach == _DSneeded0) then {_Destmrk append [((_AssltDestMrks) select _i)]} ;
					if (_DSTach == _DSneeded0) then {_OBJmrk0 append [_x]} ;
					if (_DSTach == _DSneeded1) then {_OBJmrk1 append [_x]} ;
					if (_DSTach == _DSneeded2) then {_OBJmrk2 append [_x]} ;
					
						};
				} forEach _allZoneMarks ;	

			_OBJ0 =  _OBJmrk0 select 0;
			_OBJ1 =  _OBJmrk1 select 0;
			_OBJ2 =  _OBJmrk2 select 0;
			_Dest = _Destmrk select 0;

			_DST0 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ0) ;
			_DST1 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ1) ;
			_DST2 = (getMarkerPos _Dest) distance (getMarkerPos _OBJ2) ;

			
			_RoadsAll = [] ; 
			
			_Roads0All = (getMarkerPos (_OBJmrk0 select 0)) nearRoads _DST0;
			_Roads0Neg= (getMarkerPos (_OBJmrk0 select 0)) nearRoads 200;
			_Roads0 = _Roads0All - _Roads0Neg;

			_Roads1All = (getMarkerPos (_OBJmrk1 select 0)) nearRoads _DST1;
			_Roads1Neg= (getMarkerPos (_OBJmrk1 select 0)) nearRoads 200;
			_Roads1 = _Roads1All - _Roads1Neg;

			_Roads2All = (getMarkerPos (_OBJmrk2 select 0)) nearRoads _DST2;
			_Roads2Neg= (getMarkerPos (_OBJmrk2 select 0)) nearRoads 200;
			_Roads2 = _Roads2All - _Roads2Neg;


				_RoadsAll append _Roads0 ; 			
				_RoadsAll append _Roads1 ; 			
				_RoadsAll append _Roads2 ; 	

			_RoadsNeg = (getMarkerPos _Dest) nearRoads _DST0 / 2 ;
			
			_RoadsAllNew = _RoadsAll - _RoadsNeg ;

			_RoadsAllFrontLine = (getMarkerPos _Dest) nearRoads _DST0 / 1.3 ;

			 _RoadsFrontLine = _RoadsAllFrontLine arrayIntersect _RoadsAllNew;
			
			_RoadFinal = selectRandom _RoadsFrontLine ;
			
			 ENMASSmarkerName = "AssltOutpost" + (str ((getPos TheCommander) getPos [(10 + (random 150)), (0 + (random 360))]));   
			 publicVariable "ENMASSmarkerName"; 
			 
			createMarker [ENMASSmarkerName,  (getPos _RoadFinal)] ;  
			ENMASSmarkerName setMarkerType "o_service" ;  
			ENMASSmarkerName setMarkerColor "colorOPFOR" ;   
			ENMASSmarkerName setMarkerSize [0.8, 0.8] ; 
			ENMASSmarkerName setMarkerAlpha 1 ;   


				_trg = createTrigger ["EmptyDetector", (getPos _RoadFinal), false];
				_trg setTriggerArea [2000, 2000, 0, false, 100];
				_trg setTriggerInterval 3;
				_trg setTriggerTimeout [1, 1, 1, true];
				_trg setTriggerActivation ["WEST", "PRESENT", false];
				_trg setTriggerStatements [
				"this","	

				_TERR = nearestTerrainObjects [(getPos thisTrigger), ['FOREST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 40]; 
				{[_x, true] remoteExec ['hideObjectGlobal', 0];} forEach _TERR ;

				_mrkrs = allMapMarkers select {markerColor _x == 'Color6_FD_F'};
				_mrkr = _mrkrs select 0;
				_DANSCORE = parseNumber (markerText _mrkr) ;  

				_P1 = [ 
				'Road_Post_CSAT_01',  
				'Road_Post_CSAT_02',
				'Road_Post_CSAT_01',  
				'Road_Post_CSAT_02',
				'Road_Post_CSAT_01',  
				'Road_Post_CSAT_02',
				'Road_Post_CSAT_01',  
				'Road_Post_CSAT_02',
				'Watchpost_1', 
				'Watchpost_2', 
				'Watchpost_3', 
				'Watchpost_4', 
				'Watchpost_5', 
				'Watchpost_6',
				'Watchpost_7',
				'Watchpost_8',
				'Watchpost_9',
				'Watchpost_10'
				 ]; 

				if (_DANSCORE > 5) then {
				_P1 =  [ 
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Road_Post_CSAT_03',  
				'Road_Post_CSAT_04',
				'Watchpost_1', 
				'Watchpost_2', 
				'Watchpost_3', 
				'Watchpost_4', 
				'Watchpost_5', 
				'Watchpost_6',
				'Watchpost_7',
				'Watchpost_8',
				'Watchpost_9',
				'Watchpost_10'
				]; };

				if (_DANSCORE > 10) then {
				_P1 =  [ 
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Road_Post_CSAT_05',  
				'Road_Post_CSAT_06',
				'Watchpost_1', 
				'Watchpost_2', 
				'Watchpost_3', 
				'Watchpost_4', 
				'Watchpost_5', 
				'Watchpost_6',
				'Watchpost_7',
				'Watchpost_8',
				'Watchpost_9',
				'Watchpost_10'
				]; };

					   _nearRoad = ( (getPos thisTrigger) nearRoads 10 ) select 0;
						_nextRoad = ( roadsConnectedTo _nearRoad ) select 0;
						_dir = _nearRoad getDir _nextRoad;
						
						
				_COM = [ selectRandom _P1, getPosATL _nearRoad, [0,0,0], _dir, true ] call LARs_fnc_spawnComp;	
				_ARRAY = [ _COM ] call LARs_fnc_getCompObjects;
				{_x setVectorUp [0,0,1]} forEach _ARRAY;


				_trgA = createTrigger ['EmptyDetector', (getPos thisTrigger), false];
				_trgA setTriggerArea [1000, 1000, 0, false, 100];
				_trgA setTriggerInterval 3;
				_trgA setTriggerTimeout [3, 3, 3, true];
				_trgA setTriggerActivation ['WEST', 'PRESENT', false];
				_trgA setTriggerStatements [
				""this"",""

				[thisTrigger] execVM 'Scripts\RoadBlock_CSAT.sqf';

				"",""""];

				", ""];	
				 
			[parseText "<t color='#FF3619' font='PuristaBold' align = 'right' shadow = '1' size='3'>! WARNING !</t><br /><t  color='#FF3619'  align = 'right' shadow = '1' size='1.6'>Enemy Deployed New Military Installation</t>", [0, 0.5, 1, 1], nil, 13, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];
			sleep 1.5 ;
							_attackingAtGrid = mapGridPosition getMarkerPos ENMASSmarkerName;
			[[west,"HQ"], "Enemy Deployed New Military Installation at grid " + _attackingAtGrid] remoteExec ["sideChat", 0];
			
			
		};



};

	sleep 10 ;	


				_AssMarks = allMapMarkers select {markerType _x == "mil_marker_noShadow" && markerAlpha _x == 0.5 };  
				{deleteMarker _x ;} forEach _AssMarks ;
	
[] execVM "Scripts\Mission_Defend_0.sqf";




	   