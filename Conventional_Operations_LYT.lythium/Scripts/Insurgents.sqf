_thisinSURGTrigger = _this select 0;

if (count (_thisinSURGTrigger nearRoads 10) > 0) then {
    _chance = selectRandom [0, 1, 2, 3, 4];
    if (_Chance == 0) then {
        _nearRoad = selectRandom ((getPos _thisinSURGTrigger) nearRoads 20);
        _pos = _nearRoad getRelPos [6, selectRandom [90, -90]];
        _V = createvehicle [selectRandom ["I_G_Offroad_01_AT_F", "I_C_Offroad_02_LMG_F", "I_G_Offroad_01_armed_F", "I_C_Offroad_02_AT_F"], [_pos select 0, _pos select 1, (_pos select 2) + 5], [], 0, "CAN_COLLIDE"];
        _nextRoad = (roadsConnectedto _nearRoad) select 0;
        _dir = _nearRoad getDir _nextRoad;
        _V setDir _dir;
        _G = [_pos, east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
        [
            ((units _G) select 1),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 1)];
        ((units _G) select 2) moveInGunner _V;
    };
    
    if (_Chance == 1) then {
        _IEDs = ["IEDUrbanSmall_F", "IEDUrbanBig_F", "IEDlandSmall_F", "IEDlandBig_F"];
        _Clutters = ["land_Garbage_square3_F", "land_Garbage_square3_F", "land_Garbage_line_F", "land_Garbage_line_F", "land_Garbage_line_F"];
        _nearRoad = selectRandom ((getPos _thisinSURGTrigger) nearRoads 15);
        _Roadside = selectRandom [90, -90];
        _pos = _nearRoad getRelPos [6, _Roadside];
        _Clutter = createvehicle [selectRandom _Clutters, _pos, [], (0 + (random 3)), "CAN_COLLIDE"];
        _IED = createmine [selectRandom _IEDs, _pos, [], 0];
        _Clutter setvectorUp [0, 0, 1];
        _trg = createTrigger ["EmptyDetector", _pos];
        _trg settriggerArea [10, 10, 0, false, 4];
        _trg settriggerActivation ["west", "PRESENT", false];
        _trg settriggerStatements [
            "this && stance player != 'PRONE' ", " [thistrigger, 'Sh_82mm_AMOS', 0, 1, 0, false, 0, 10, ['']] spawn BIS_fnc_fireSupportVirtual;
        ", ""];
    };
    
    if (_Chance == 2) then {
        _nearRoad = selectRandom ((getPos _thisinSURGTrigger) nearRoads 20);
        _pos = _nearRoad getRelPos [6, selectRandom [90, -90]];
        _V = createvehicle [selectRandom CivVehArray, [_pos select 0, _pos select 1, (_pos select 2) + 5], [], 0, "CAN_COLLIDE"];
        _nextRoad = (roadsConnectedto _nearRoad) select 0;
        _dir = _nearRoad getDir _nextRoad;
        _V setDir _dir;
        _trg = createTrigger ["EmptyDetector", getPos _V];
        _trg settriggerArea [15, 15, 0, false, 6];
        _trg settriggerActivation ["west", "PRESENT", false];
        _trg settriggerStatements [
            "this or (vehicle player) inArea thistrigger", " [thistrigger, 'Sh_155mm_AMOS', 0, 1, 0] spawn BIS_fnc_fireSupportVirtual;
        ", ""];
        _V addEventHandler ["Killed", {
            [(_this select 0), "Sh_155mm_AMOS", 0, 1, 0] spawn BIS_fnc_fireSupportVirtual;
        }];
        _trg attachto [_V, [0, 0, 0]];
    };
    
    if (_Chance == 3) then {
        _G = [(getPos _thisinSURGTrigger), east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
        sleep 2;
        [_G, (getPos _thisinSURGTrigger), 20] call BIS_fnc_taskPatrol;
        {
            _x setunitPos "MIDDLE";
        } forEach units _G;
        [
            ((units _G) select 1),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 1)];
        [
            ((units _G) select 3),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 3)];
        [((units _G) select 2), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
        [((units _G) select 4), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
        [((units _G) select 6), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
    };
    
    if (_Chance == 4) then {
        _trg = createTrigger ["EmptyDetector", getPos _thisinSURGTrigger];
        _trg settriggerArea [50, 50, 0, false, 6];
        _trg settriggerActivation ["ANYplayer", "PRESENT", true];
        _trg settriggerStatements [
            "this", "
            _pos = player getPos [(250 +(random 50)), (0 + (random 360))];
            _G = [_pos, east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
            MortarRoad = createvehicle ['O_Mortar_01_F', _pos, [], 0, 'CAN_COLLIDE'];
            ((units _G) select 2) moveInGunner MortarRoad;
            [
                ((units _G) select 1),
                'Search insurgent',
                '\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa',
                '\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa',
                '(_this distance _target)<3',
                '(_this distance _target)<3',
                {
                    playSound3D [ 'a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss', (_this select 0)];
                },
                {},
                {
                    _chance = selectRandom [1, 1, 1, 2, 2];
                    if (_chance == 1) then {
                        execVM 'Scripts\inTL_Civ.sqf';
                    } else {
                        execVM 'Scripts\inTL.sqf';
                    };
                },
                {},
                [],
                3,
                0,
                true,
                false
            ] remoteExec ['BIS_fnc_holdactionAdd', 0, ((units _G) select 1)];
            [(getPos player), 'Sh_82mm_AMOS', 200, 100, 10, {
                !alive MortarRoad
            }, 5] spawn BIS_fnc_fireSupportVirtual;
        ", ""];
    };
} else {
    _TERR = nearestTerrainObjects [(getPos _thisinSURGTrigger), ['forEST', 'House', 'TREE', 'SMALL TREE', 'BUSH', 'ROCK', 'ROCKS'], 15];
    {
        [_x, true] remoteExec ['hideObjectglobal', 0];
    } forEach _TERR;
    
    _chance = selectRandom [1, 2, 3, 4];
    
    if (_Chance == 1) then {
        _pos = (getPos _thisinSURGTrigger);
        _V = createvehicle [selectRandom ["I_G_Offroad_01_AT_F", "I_C_Offroad_02_LMG_F", "I_G_Offroad_01_armed_F", "I_C_Offroad_02_AT_F"], [_pos select 0, _pos select 1, (_pos select 2) + 5], [], 0, "CAN_COLLIDE"];
        sleep 2;
        _G = [_pos, east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
        [
            ((units _G) select 1),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 1)];
        ((units _G) select 2) moveInGunner _V;
    };
    
    if (_Chance == 2) then {
        _G = [(getPos _thisinSURGTrigger), east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
        _V = createvehicle ['O_G_HMG_02_high_F', (getPos _thisinSURGTrigger), [], 0, 'CAN_COLLIDE'];
        [
            ((units _G) select 1),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 1)];
        ((units _G) select 2) moveInGunner _V;
    };
    
    if (_Chance == 3) then {
        _trg = createTrigger ["EmptyDetector", getPos _thisinSURGTrigger];
        _trg settriggerArea [200, 200, 0, false, 50];
        _trg settriggerActivation ["ANYplayer", "PRESENT", true];
        _trg settriggerStatements [
            "this", "
            _pos = player getPos [(250 +(random 50)), (0 + (random 360))];
            _G = [_pos, east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
            MortarMount = createvehicle ['O_Mortar_01_F', _pos, [], 0, 'CAN_COLLIDE'];
            [
                ((units _G) select 1),
                'Search insurgent',
                '\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa',
                '\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa',
                '(_this distance _target)<3',
                '(_this distance _target)<3',
                {
                    playSound3D [ 'a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss', (_this select 0)];
                },
                {},
                {
                    _chance = selectRandom [1, 1, 1, 2, 2];
                    if (_chance == 1) then {
                        execVM 'Scripts\inTL_Civ.sqf';
                    } else {
                        execVM 'Scripts\inTL.sqf';
                    };
                },
                {},
                [],
                3,
                0,
                true,
                false
            ] remoteExec ['BIS_fnc_holdactionAdd', 0, ((units _G) select 1)];
            ((units _G) select 2) moveInGunner MortarMount;
            
            [(getPos player), 'Sh_82mm_AMOS', 200, 100, 10, {
                !alive MortarMount
            }, 5] spawn BIS_fnc_fireSupportVirtual;
        ", ""];
    };
    
    if (_Chance == 4) then {
        _G = [(getPos _thisinSURGTrigger), east, [selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray, selectRandom GuerMenArray]] call BIS_fnc_spawngroup;
        [_G, (getPos _thisinSURGTrigger), 20] call BIS_fnc_taskPatrol;
        {
            _x setunitPos "MIDDLE";
        } forEach units _G;
        [
            ((units _G) select 1),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 1)];
        [
            ((units _G) select 3),
            "Search insurgent",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "\a3\ui_f\data\IGUI\Cfg\holdactions\holdaction_search_ca.paa",
            "(_this distance _target)<3",
            "(_this distance _target)<3",
            {
                playSound3D [ "a3\missions_f_oldman\data\sound\intel_body\1sec\intel_body_1sec_02.wss", (_this select 0)];
            },
            {},
            {
                _chance = selectRandom [1, 1, 1, 2, 2];
                if (_chance == 1) then {
                    execVM "Scripts\inTL_Civ.sqf";
                } else {
                    execVM "Scripts\inTL.sqf";
                };
            },
            {},
            [],
            3,
            0,
            true,
            false
        ] remoteExec ["BIS_fnc_holdactionAdd", 0, ((units _G) select 3)];
        
        [((units _G) select 2), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
        [((units _G) select 4), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
        [((units _G) select 6), "launch_RPG7_F", 4] call BIS_fnc_addWeapon;
    };
};