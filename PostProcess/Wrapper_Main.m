function Wrapper_Main(name, state, event_list, supervisor)
    % integrate all the wrapper function
    event_num = length(event_list);
    n = sum(state(:,2));
    outputholder = strcat('output_', datestr(clock,'yyyymmddTHHMMSS'));
    mkdir(outputholder);
    filepath = strcat('./',outputholder,'/');
    outputxls = strcat(filepath, 'output.xls');
    for i = 1:event_num
        [map] = wrapper_1(name, state);
        event_ID = event_list(i);
        if event_ID < 10
            inputfile = strcat(supervisor, '_','0', num2str(event_ID),'cn');
            controlseqfile = strcat(filepath, 'control_sequence_0', num2str(event_ID));
            outputsheet = strcat('Event_0',num2str(event_ID) );
        else
            inputfile = strcat(supervisor, '_', num2str(event_ID),'cn');
            controlseqfile = strcat(filepath,'control_sequence_', num2str(event_ID));
            outputsheet = strcat('Event_',num2str(event_ID) );
        end
        [~,bdd_tree] = wrapper_2(inputfile, map);
        sequence = wrapper_3(controlseqfile, bdd_tree, n);
        result = wrapper_4(filepath, sequence, name, state);
        xlswrite(outputxls,result,outputsheet);
        fprintf('the Event %d has been processed Successfully\n', event_ID);          
    end
    
end