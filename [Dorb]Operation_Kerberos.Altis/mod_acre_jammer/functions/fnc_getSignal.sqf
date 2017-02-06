/*
 *  Author: ACRE2
 *
 *  Description:
 *      this is a copy of acre_sys_signal_fnc_getSignal
 *
 *
 */
//#define DEBUG_MODE_FULL
#include "script_component.hpp"

_this params ["_f", "_mW", "_receiverClass", "_transmitterClass"];

// temporary workarount ->
If ((missionNamespace getVariable [_transmitterClass + "_best_signal", -992])<=-992) then {
    TRACE("reset Jammer-Values");
    missionNamespace setVariable [_transmitterClass + "_jammer_signal", 0];
    missionNamespace setVariable [_transmitterClass + "_jammer_px", 0];
    missionNamespace setVariable [_transmitterClass + "_jammer_id", ""];
    missionNamespace setVariable [_transmitterClass + "_jammer_count", ""];
};


private _count = missionNamespace getVariable [_transmitterClass + "_running_count", 0];
if (_count == 0) then {
    private _rxAntennas = [_receiverClass] call acre_sys_components_fnc_findAntenna;
    //[["ACRE_120CM_VHF_TNC",B Soldat:2 (Dorbedo),[11610.5,12018.2,26.1889],[-0.828552,0.369331,-0.420827]]]
    private _txAntennas = [_transmitterClass] call acre_sys_components_fnc_findAntenna;
    {
        private _txAntenna = _x;
        {
            private _rxAntenna = _x;
            _count = _count + 1;
            private _id = format["%1_%2_%3_%4", _transmitterClass, (_txAntenna select 0), _receiverClass, (_rxAntenna select 0)];
            [_id,_transmitterClass,_receiverClass,_txAntenna,_rxAntenna,_f,_mw] call FUNC(getJammer);
            [
                "process_signal",
                [
                    _id,
                    (_txAntenna select 2),
                    (_txAntenna select 3),
                    (_txAntenna select 0),
                    (_rxAntenna select 2),
                    (_rxAntenna select 3),
                    (_rxAntenna select 0),
                    _f,
                    _mW,
                    acre_sys_signal_terrainScaling,
                    diag_tickTime,
                    ACRE_SIGNAL_DEBUGGING,
                    acre_sys_signal_omnidirectionalRadios
                ],
                true,
                FUNC(handleSignalReturn),
                [_transmitterClass, _receiverClass]
            ] call acre_sys_core_fnc_callExt;
        } forEach _rxAntennas;
    } forEach _txAntennas;
    missionNamespace setVariable [_transmitterClass + "_running_count", _count];
};
private _maxSignal = missionNamespace getVariable [_transmitterClass + "_best_signal", -992];
private _Px = missionNamespace getVariable [_transmitterClass + "_best_px", 0];

if (ACRE_SIGNAL_DEBUGGING > 0) then {
    private _signalTrace = missionNamespace getVariable [_transmitterClass + "_signal_trace", []];
    _signalTrace pushBack _maxSignal;
    missionNamespace setVariable [_transmitterClass + "_signal_trace", _signalTrace];
};

private _jammer_signal = missionNamespace getVariable [_transmitterClass + "_jammer_signal", 0];
private _jammer_px = missionNamespace getVariable [_transmitterClass + "_jammer_px", 0];
TRACEV_4(_maxSignal,_px,_jammer_signal,_jammer_px);
_maxSignal = (_maxSignal - _jammer_signal) max -992;
_Px = ((_Px - _jammer_px) min 1)max 0;
TRACEV_2(_maxSignal,_px);

hintSilent parseText format["Radio:<br />   Px=%1<br />   Signal=%2<br />Jammer:<br />   Px=%3<br />   Signal=%4",_Px,_maxSignal,_jammer_px,_jammer_signal];
[_Px, _maxSignal];
