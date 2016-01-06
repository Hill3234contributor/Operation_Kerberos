/*
    Author: Dorbedo

    Description:
        disables TFR

    Parameter(s):
        0 : OBJECT - Unit where the TFR is disabled
    Returns:
        nothing

*/
#include "script_component.hpp"
SCRIPT(disableTFRArea);
_this params [
		["_centerpos",[0,0,0],[[]],[2,3]],
		["_range",5000,[0]],
		["_duration",180,[0]]
    ];
_enableTime = diag_tickTime + _duration;
{
	If ((_x distance _centerpos)< _range) then {
		[_x] call FUNC(disableTFR);
		SETVAR(_x,GVAR(TFR_enable),_enableTime);
	};
} forEach allPlayers;
[QUOTE(call FUNC(enableTFRtime)),[],(_duration + 2)] call EFUNC(common,waitandexec);
