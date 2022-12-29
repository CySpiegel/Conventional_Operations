

_CRVEH = _this select 0;

titleText ["Planting Explosives Charges . . .", "BLACK IN",9999];
sleep 2 ;
titleText ["Planting Explosives Charges . . .", "BLACK IN",1];


["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 10</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 9</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 8</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 7</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 6</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 5</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 4</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 3</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;
["<t color='#ff0000' size='0.5'>CLEAR OUT<br />Exploding in 2</t>",-1,-1,1,0.1,0,789] spawn BIS_fnc_dynamicText;
sleep 1 ;

[_CRVEH, "Sh_82mm_AMOS", 0, 1, 1] spawn BIS_fnc_fireSupportVirtual;
sleep 1.5 ;
_CRVEH setDammage 1;

				[30, "TECHNOLOGY"] execVM "Scripts\NOtification.sqf" ;

[30] execVM "Scripts\Reward.sqf";

 
 sleep 6 ;
[parseText "<t color='#1AA3FF' font='PuristaBold' align = 'right' shadow = '1' size='2.5'>Mission : </t><br /><t  align = 'right' shadow = '1' size='2'>Find Captured Pilots</t>", [0, 0.5, 1, 1], nil, 5, 1.7, 0] remoteExec ["BIS_fnc_textTiles", 0];

 
