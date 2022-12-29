
sleep 0.1 ;
_UnitObj = _this select 0 ;


if ((typeOf _UnitObj == F_Officer) || (typeOf _UnitObj == "B_G_officer_F")) then {UNTType = F_Officer ;} ;
if ((typeOf _UnitObj == F_Assault_Eng)  || (typeOf _UnitObj == "B_G_engineer_F")) then {UNTType = F_Assault_Eng ;} ;
if ((typeOf _UnitObj == F_Assault_TL) || (typeOf _UnitObj == "B_G_Soldier_SL_F")) then {UNTType = F_Assault_TL ;} ;
if ((typeOf _UnitObj == F_Assault_SL) || (typeOf _UnitObj == "B_G_Soldier_SL_F")) then {UNTType = F_Assault_SL ;} ;
if (typeOf _UnitObj == F_Assault_Eod) then {UNTType = F_Assault_Eod ;} ;
if (typeOf _UnitObj == F_Assault_Mrk) then {UNTType = F_Assault_Mrk ;} ;
if (typeOf _UnitObj == F_Assault_AT) then {UNTType = F_Assault_AT ;} ;
if (typeOf _UnitObj == F_Assault_Amm) then {UNTType = F_Assault_Amm ;} ;
if (typeOf _UnitObj == F_Assault_Mg) then {UNTType = F_Assault_Mg ;} ;
if (typeOf _UnitObj == F_Assault_Med) then {UNTType = F_Assault_Med ;} ;
if (typeOf _UnitObj == F_Assault_Uav) then {UNTType = F_Assault_Uav ;} ;

if (typeOf _UnitObj == F_Recon_Snp) then {UNTType = F_Recon_Snp ;} ;
if (typeOf _UnitObj == F_Recon_Sct) then {UNTType = F_Recon_Sct ;} ;

if ((typeOf _UnitObj == F_Recon_TL) || (typeOf _UnitObj == "B_G_Soldier_TL_F")) then {UNTType = F_Recon_TL ;} ;
if (typeOf _UnitObj == F_Recon_Mrk) then {UNTType = F_Recon_Mrk ;} ;
if (typeOf _UnitObj == F_Recon_AT) then {UNTType = F_Recon_AT ;} ;
if (typeOf _UnitObj == F_Recon_Mg) then {UNTType = F_Recon_Mg ;} ;
if (typeOf _UnitObj == F_Recon_Eod) then {UNTType = F_Recon_Eod ;} ;
if (typeOf _UnitObj == F_Recon_Med) then {UNTType = F_Recon_Med ;} ;
if (typeOf _UnitObj == F_Recon_Eng) then {UNTType = F_Recon_Eng ;} ;

if ((typeOf _UnitObj == F_Diver_TL) || (typeOf _UnitObj == "B_T_Diver_F") || (typeOf _UnitObj == "B_Diver_F")) then {UNTType = F_Diver_TL ;} ;
if (typeOf _UnitObj == F_Diver_Rfl) then {UNTType = F_Diver_Rfl ;} ;
if (typeOf _UnitObj == F_Diver_Eod) then {UNTType = F_Diver_Eod ;} ;


_UNTTypeName = str UNTType ;
_missionTag = missionName;
_missionTag = [_missionTag] call BIS_fnc_filterString;
private _LoadOutName = _missionTag + _UNTTypeName;

private _LoadOutRFLNameVal = profileNamespace getVariable _LoadOutName;

_UnitObj setUnitLoadout _LoadOutRFLNameVal ;

_UnitObj linkItem 'B_UavTerminal';


