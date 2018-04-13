clear
clc
load('WrapperInput.mat');
[SUPERVISOR]=Wrapper_Main_Simulink(name, state, event_list, SupervisorName);
fprintf('The supervisor in the form of look-up table has been successfully genated\n');
% Wrapper_Main(name, state, event_list, SupervisorName);
% fprintf('The supervisor in the form of look-up table stored in xls file has been successfully genated\n');