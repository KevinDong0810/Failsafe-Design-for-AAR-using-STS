function Wrapper_Main(name, state, event_list, SupervisorName)
    % This function will transfomr the BDD file into the look-up table form
    % stored in a xls file. The output is more readable for human compared
    % with Wrpper_Main_Simulink
    % Input: name : a cell contains the superstate name 
    %        state: a matrix contains the state number and necessary bit
    %        number of each superstate
    %        event_list: a cell contains the event name which should be
    %        proecessed.
    %        SupervisorName: the prefix string of BDD file.
    event_num = length(event_list);
    n = sum(state(:,2));
    outputholder = strcat('output_', datestr(clock,'yyyymmddTHHMMSS'));
    mkdir(outputholder);
    filepath = strcat('./',outputholder,'/');
    outputxls = strcat(filepath, 'output.xls');
    for i = 1:event_num
        [map] = wrapper_1(name, state);
        event_ID = event_list{i};
        inputfile = strcat(SupervisorName, '_', event_ID,'cn');
        controlseqfile = strcat(filepath,'control_sequence_', event_ID);
        outputsheet = strcat('Event_',event_ID );
        [~,bdd_tree] = wrapper_2(inputfile, map);
        sequence = wrapper_3(controlseqfile, bdd_tree, n);
        result = wrapper_4(filepath, sequence, name, state);
        xlswrite(outputxls,result,outputsheet);
        fprintf('the Event %s has been processed Successfully\n', event_ID);          
    end
end