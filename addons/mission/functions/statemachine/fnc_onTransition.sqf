#include "script_component.hpp"
/**
 * Name: dorb_mission_fnc_statement_onTransition
 *
 * Author: Dorbedo
 * onTransitionEvent is called if defined
 *
 * Arguments:
 * 0: <LOCATION> the mission
 *
 * Return Value:
 * Nothing
 *
 */

params ["_mission"];

private _eventName = format["on%1",_thisTransition];
private _value = _mission getVariable _eventName;
TRACEV_3(_eventName,_value,typename _value);
If (!isNil "_value") then {
    If (IS_CODE(_value)) exitWith {
        _this call _value;
    };
    If (IS_STRING(_value)) then {
        _this call (missionNamespace getVariable [_value,{}]);
    };
};

