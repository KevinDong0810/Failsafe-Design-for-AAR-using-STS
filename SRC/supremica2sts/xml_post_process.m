function xml_post_process(Event, State, Transitiontable, outputfile)
    fid = fopen(outputfile, 'w');
    % Process the event label
    Num_Event = size(Event,1);
    Event_Controllable = '{';
    Event_Uncontrollable = '{';
    for i = 1: Num_Event
        if strcmp(Event{i,3},'false')
            Event_Uncontrollable = strcat(Event_Uncontrollable, Event{i,2}, ',');
        else
            Event_Controllable = strcat(Event_Controllable, Event{i,2}, ',');
        end
    end
    Event_Uncontrollable(end)='}';
    Event_Controllable(end)='}';
    if strcmp(Event_Uncontrollable, '}')
        Event_Uncontrollable = '{}';
    end
    if strcmp(Event_Controllable, '}')
        Event_Controllable = '{}';
    end
    fprintf(fid,'%s\n', Event_Controllable);% write the controllable event
    fprintf(fid,'%s\n', Event_Uncontrollable);% write the uncontrollable event
    
    %process the transition
    fprintf(fid,'%s\n','{');
    Transition = cell(size(Transitiontable));
    Num_Transition = size(Transitiontable,1);
    for i = 1:Num_Transition
        Transition{i,1} = State{Transitiontable(i,1)+1,2};
        Transition{i,2} = Event{Transitiontable(i,3)+1,2};
        Transition{i,3} = State{Transitiontable(i,2)+1,2};
        Transition_label = strcat('[',Transition{i,1},32,Transition{i,2}, 32, Transition{i,3}, ']');
        fprintf(fid, '%s\n', Transition_label);
    end
    fprintf(fid,'%s\n','}');
    
    % process the state
    State_label = '{';
    Num_State = size(State,1);
    for i = 1:Num_State
        State_label = strcat(State_label, State{i,2},',');
    end
    State_label(end) = '}';
    fprintf(fid, '%s\n', State_label);
    
    %close the file
    fclose(fid);
end

