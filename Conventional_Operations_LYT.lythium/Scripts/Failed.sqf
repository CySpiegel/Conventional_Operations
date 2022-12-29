_allFOBMarks = allMapMarkers select {markerType _x == "b_installation" && markerText _x == "FOB"};  
if (count _allFOBMarks == 0 ) then {
	
	playMusic "EventTrack02_F_Curator";

	
 hint "_You Lost the Last FOB_";
sleep 4;	

};