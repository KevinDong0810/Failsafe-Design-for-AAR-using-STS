function [Automaton, StateTransition, StateMap] = Automaton_Creation(AutomationName, EventList, Event, State, InitState, TransitionTable)
%   Create the Automaton Struct
%   Output: Automaton: (assume that there are n events in total, here n = 59)
%           Automaton.name: a number represents this automaton's name
%           Automaton.EventMap: a nX1 logic matrix, the first column is
%           the event number. In the second column, 1 represents that this
%           automaton has this event, while 0 means it dose not have.
%           Automaton.CurrentState: a number represents the current state
%           of the automaton
%           Automaton. PossibleEvent: a nX1 logic matrix, 1 means this
%           event is possible to happen at current state
%           StateTransition: Source State (local) | Event | Destination State (local), note
%           that both state and event start at 1 instead of 0
%           StateMap: State No. (local) | State Name
    Automaton.name = AutomationName;
    
    % process the event map and transitiontable
    num_event = size(Event,1);
    num_eventlist = size(EventList,1);
    Transition = zeros(size(TransitionTable));
    Transition(:,1)= TransitionTable(:,1) + 1;
    Transition(:,3)= TransitionTable(:,2) + 1; 
    OutputEvent = false(num_eventlist,1);
    for i = 1: num_event
        for j = 1:num_eventlist
            if strcmp(Event{i,2},EventList{j,2})==1               
                TempList = TransitionTable(:,3)==str2double(Event{i,1});
                Transition(TempList,2) = EventList{j,1};
                Event{i,1} = EventList{j,1};
                Event{i,3} = EventList{j,3};
                OutputEvent(j)= true;
            end
        end
    end
    Automaton.EventMap = OutputEvent;
    Automaton.CurrentState = InitState + 1;
    % process the possible event transition
    PossibleEvent_Logic = ismember(Transition(:,1), Automaton.CurrentState);
    PossibleEventList = Transition(PossibleEvent_Logic,2);
    PossibleEvent = false(num_eventlist,1);
    PossibleEvent(PossibleEventList)=true;
    Automaton.PossibleEvent = PossibleEvent;
    
    StateTransition = [Transition(:,1), Transition(:,2), Transition(:,3)];
    StateMap = State(:,1:2);
end