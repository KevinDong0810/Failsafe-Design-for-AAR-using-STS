function [Automata, TransitionTable, StateNameTable, StateInformation] = Automata_Creation(filelist,namelist,EventList)
%   This function collects necessary information and output the Automata
%   struct which is used in the simulation. The detailed info about the
%   struct can be seen in the "Automaton_Creation.m" file.
%   Input: filelist: a cell contains the xml file name; Note that update
%          the inputfile in line XX timely.
%          namelist: a cell contains the numeric number of all superstate
%          Evenlist: a cell contains the event related info: 
%                    Event No. | Event Name | Event Type
%   Output:Automata: the struct which contains all the information of Plant
%          TransitionTable: a matrix contains the transition info:
%                           source state | event name | destination state
%          StateNameTable: State No. | State Name
%          StateInformation: the state number of every superstate
    Num_file = size(filelist,1);
    TransitionTable = zeros(0,3);
    StateNameTable = cell(0,2);
    StateInformation = zeros(Num_file,2);
    for i = 1:Num_file
        inputfile = strcat('../','supremica2sts','/','xml2stsinputfile','/',filelist{i,1});
        [Event,State,TransitionTable,InitState] = xml(inputfile);
        [Automata(i),TransitionTemp, StateMap] = Automaton_Creation(namelist{i}, EventList, Event, State, InitState, TransitionTable);
        Num_State = size(State,1);StateInformation(i,1) = namelist{i}; StateInformation(i,2) = Num_State;
        if i ~= 1
            StateSum = sum(StateInformation(1:i-1,2));
            TransitionTemp = [TransitionTemp(:,1) + StateSum, TransitionTemp(:,2), TransitionTemp(:,3) + StateSum];
            Automata(i).CurrentState = Automata(i).CurrentState + StateSum;
            for j = 1: size(StateMap,1)
                StateMap{j,1} = str2num(StateMap{j,1}) + StateSum + 1;
            end
        else
            for j = 1: size(StateMap,1)
                StateMap{j,1} = str2num(StateMap{j,1}) + 1;
            end
        end
        TransitionTable = [TransitionTable; TransitionTemp];
        StateNameTable = [StateNameTable;StateMap];
    end
end