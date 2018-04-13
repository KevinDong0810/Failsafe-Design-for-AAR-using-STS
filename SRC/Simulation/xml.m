function [ Event,State,TransitionTable,InitState] = xml(filename)
    xDoc = xmlread(filename);     
    xRoot=xDoc.getDocumentElement();
    Events= xRoot.getElementsByTagName('Event');
    Num_Events=Events.getLength();
    Event=cell(Num_Events,3);
    States= xRoot.getElementsByTagName('State');
    Num_States=States.getLength();
    State=cell(Num_States,3);
    Transitions= xRoot.getElementsByTagName('Transition');
    Num_Transitions=Transitions.getLength();
    Transition=cell(Num_Transitions,3);
    Event1=Events.item(0);
    State1=States.item(0);
    Transition1=Transitions.item(0);
    for i=1:Num_Events
        Event1id=char(Event1.getAttribute('id'));
        Event1label=char(Event1.getAttribute('label'));
        Event1controllable=char(Event1.getAttribute('controllable'));
        Event{i,1}=Event1id;
        Event{i,2}=Event1label;
        Event{i,3}=Event1controllable;
    Event1=Events.item(i);
    end
    for i=1:Num_States
        State1id=char(State1.getAttribute('id'));
        State1name=char(State1.getAttribute('name'));
        State1accepting=char(State1.getAttribute('initial'));
        State{i,1}=State1id;
        State{i,2}=State1name;
        State{i,3}=State1accepting;
    State1=States.item(i);
    end
    for i=1:Num_Transitions
        Transition1source=char(Transition1.getAttribute('source'));
        Transition1dest=char(Transition1.getAttribute('dest'));
        Transition1event=char(Transition1.getAttribute('event'));
        Transition{i,1}=Transition1source;
        Transition{i,2}=Transition1dest;
        Transition{i,3}=Transition1event;
    Transition1=Transitions.item(i);
    end
    [m1,n1]=size(Transition);
    for i=1:m1
    for j=1:n1
    Transition{i,j}=str2double(Transition{i,j});
    end
    end
    TransitionTable=cell2mat(Transition);
    [m2,n2]=size(State);
    j=1;
    for i=1:m2
        if strcmp(State(i,3),'true')==1
            InitState(j)=State(i,1);
            j=j+1;
        end
    end
    [m1,n1]=size(InitState);
    for i=1:m1
    for j=1:n1
    InitState{i,j}=str2double(InitState{i,j});
    end
    end
    InitState=cell2mat(InitState);
    for i = 1:Num_Events
        S = regexp(Event{i,2},':','split');
        Event{i,2} = S{1};
    end
end

