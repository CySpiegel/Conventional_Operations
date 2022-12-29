
/////////////////////Gather Intel////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
_thisIntelTrigger = _this select 0;

_Chance = selectRandom [1, 2, 3]; 

_mrkrs = allMapMarkers select {markerColor _x == "Color6_FD_F"};
_mrkr = _mrkrs select 0;
_DANSCORE = parseNumber (markerText _mrkr) ;  

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

_Mount = selectRandom nearestLocations [getPos _thisIntelTrigger, ["Mount"], 1000];
_poss = locationPosition _Mount ; 
[ "Recon_OPF_1", _poss, [0, 0, 0], 0, true ] call LARs_fnc_spawnComp;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],40];
_poss0 = [_poss, 10, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 



MapBooard = nearestObjects [_poss,["MapBoard_altis_F"],40] select 0 ;
publicVariable "MapBooard";

			removeAllActions MapBooard;

[MapBooard,[
				"<img size=2 color='#7CC2FF' image='Screens\FOBA\talk_ca.paa'/><t font='PuristaBold' color='#7CC2FF'>Investigate Enemy Plans",
				{
					[(_this select 0)] execVM "Scripts\INTL.sqf";
					(_this select 0) removeAction (_this select 2) ;		

				_MMarks = allMapMarkers select { markerType _x == "o_recon"};
				_M = [_MMarks,  (_this select 0)] call BIS_fnc_nearestPosition;

				deleteMarker _M ; 

								[30, "RECON SITE"] execVM "Scripts\NOtification.sqf" ;

				[30] execVM "Scripts\Reward.sqf";
				[] execVM "Scripts\DangerMinus.sqf";					
				},
				nil,
				1.5,
				true,
				true,
				"",
				"alive _target", // _target, _this, _originalTarget
				4,
				false,
				"",
				""
]] remoteExec ["addAction",0,true];


_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, _poss0, [], 15, "NONE"]; 

PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 70] call BIS_fnc_taskPatrol;


if (_DANSCORE > 5) then {
_Mount = selectRandom nearestLocations [getPos _thisIntelTrigger, ["Mount"], 1000];
_poss = locationPosition _Mount ; 
[ "Recon_OPF_2", _poss, [0, 0, 0],0, true ] call LARs_fnc_spawnComp;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],40];

_poss0 = [_poss, 20, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

_poss0 = [_poss, 20, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

_poss0 = [_poss, 10, 30, 1, 1 , 0] call BIS_fnc_findSafePos; 

PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 70] call BIS_fnc_taskPatrol;

_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, _poss0, [], 15, "NONE"]; 
};

if (_DANSCORE > 10) then {
_Mount = selectRandom nearestLocations [getPos _thisIntelTrigger, ["Mount"], 1000];
_poss = locationPosition _Mount ; 
[ "Recon_OPF_3", _poss, [0, 0, 0],0, true ] call LARs_fnc_spawnComp;
{_x setUnitLoadout selectRandom East_Units;} forEach nearestObjects [_poss,["Man"],40];

_poss0 = [_poss, 20, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

_poss0 = [_poss, 20, 30, 5, 1 , 0] call BIS_fnc_findSafePos; 
G = [_poss, East,[selectRandom East_Units]] call BIS_fnc_spawnGroup;  
((units G) select 0) disableAI "PATH"; 

_poss0 = [_poss, 10, 50, 5, 1 , 0] call BIS_fnc_findSafePos; 

PRL = [_poss, East, [selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units, selectRandom East_Units]] call BIS_fnc_spawnGroup;
[PRL, _poss, 70] call BIS_fnc_taskPatrol;

_V = createVehicle [ selectRandom East_Ground_Vehicles_Ambient, _poss0, [], 15, "NONE"]; 
};



//////Trigger/////////////////////////////////////////////////////////////////////////////////////////



  {
      _nvg = hmd _x;
      _x unassignItem _nvg;
      _x removeItem _nvg;
	  _x addPrimaryWeaponItem "acc_flashlight";
	  _x assignItem "acc_flashlight";
	  _x enableGunLights "ForceOn";
  } foreach (allUnits select {side _x == east}); 


{ if !((side _x) == west) then {
            ZEUS removeCuratorEditableObjects [[_x],true];
}; } foreach allUnits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
[_thisIntelTrigger, 300] execVM "Scripts\INTLitems.sqf";

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

