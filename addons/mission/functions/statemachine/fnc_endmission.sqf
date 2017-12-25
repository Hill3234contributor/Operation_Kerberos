#include "script_component.hpp"
/**
 * Name: dorb_mission_fnc_statemachine_endmission
 *
 * Author: Dorbedo
 * end a mission
 *
 * Arguments:
 * 0: <LOCATION> the mission
 *
 * Return Value:
 * Nothing
 *
 */

params ["_mission"];

private _TaskID = _mission getVariable "taskID";
If (IS_ARRAY(_TaskID)) then {
    _TaskID = _TaskID select 0;
};
private _type = _mission getVariable ["type",""];

private _missionCfg = _mission getVariable "missionCfg";

switch _thisTransition do {
    case "succeeded" : {
        [
            _TaskID,
            "SUCCEEDED",
            false
        ] call BIS_fnc_taskSetState;
        private _title = getText(_missionCfg >> "task" >> "title");
        private _text = getText(_missionCfg >> "task" >> "onSucceeded");
        [QEGVAR(gui,message),[_title,_text,"green"]] call CBA_fnc_globalEvent;
    };
    case "neutral" : {
        [
            _TaskID,
            "CANCELED",
            false
        ] call BIS_fnc_taskSetState;
        private _title = getText(_missionCfg >> "task" >> "title");
        private _text = getText(_missionCfg >> "task" >> "onNeutral");
        [QEGVAR(gui,message),[_title,_text,"yellow"]] call CBA_fnc_globalEvent;
    };
    case "timeout";
    case "failed" : {
        _mission setVariable ["progress","failed"];
        [
            _TaskID,
            "FAILED",
            false
        ] call BIS_fnc_taskSetState;
        private _title = getText(_missionCfg >> "task" >> "title");
        private _text = getText(_missionCfg >> "task" >> "onFailed");
        [QEGVAR(gui,message),[_title,_text,"red"]] call CBA_fnc_globalEvent;
    };
    default {
        // something happend, the task gets canceled
        [
            _TaskID,
            "CANCELED",
            false
        ] call BIS_fnc_taskSetState;
        _mission setVariable ["progress","cancel"];
    };
};
