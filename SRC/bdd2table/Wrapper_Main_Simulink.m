function [SUPERVISOR]=Wrapper_Main_Simulink(name, state, event_list, SupervisorName)
    % This function will transfomr the BDD file into the look-up table.
    % This output is more readable for computer compared with Wrapper_Main
    % Input: name : a cell contains the superstate name 
    %        state: a matrix contains the state number and necessary bit
    %        number of each superstate
    %        event_list: a cell contains the event name which should be
    %        proecessed.
    %        SupervisorName: the prefix string of BDD file.
    event_num = length(event_list);
    n = sum(state(:,2));
    outputholder = strcat('output_simulink_', datestr(clock,'yyyymmddTHHMMSS'));
    mkdir(outputholder);
    filepath = strcat('./',outputholder,'/');
    SUPERVISOR = zeros(0,sum(state(:,2))+1);
    for i = 1:event_num
        [map] = wrapper_1(name, state);
        event_ID = event_list{i};
        inputfile = strcat(SupervisorName, '_', event_ID,'cn');
        controlseqfile = strcat(filepath,'control_sequence_', event_ID);
        [~,bdd_tree] = wrapper_2(inputfile, map);
        sequence = wrapper_3(controlseqfile, bdd_tree, n);
        Num_sequence = size(sequence,1);
        Supervisor_Temp = [ones(Num_sequence,1)*event_list{i,2}, sequence];
        SUPERVISOR = [SUPERVISOR;Supervisor_Temp];
        fprintf('the Event %s has been processed Successfully\n', event_ID);          
    end
end