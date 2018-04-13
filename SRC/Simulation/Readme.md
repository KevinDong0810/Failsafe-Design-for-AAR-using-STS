# Simulation
This directory contains the functions and data for the simulation input. Since the aerial refueling simulation platform embedded in our simulation is private, the MATLAB simulinks files are not put here.

# Automata Creation
The *Plant*, mentioned in the paper, is implemented in a 1X10 *struct* with 4 fields. In other words, it contains 10 automaton, in correspondence to *Autopilot*, *Withdrawal*, *Force*, *Navigation*, *Control*, *Fuel*, *Engine*, *Drogue&Probe*, *Datalink*, *TankerSafety*. Each automaton has 4 fields including *name*, *EventMap* (1 represents this automaton has this event, while 0 means no), *CurrentState*, *PossibleEvent* (1 means that this event is possible to happen within this automaton). To create such automata, load 'AutomataInput.mat' first and then run "Automata_Creation".

# Simulation Input
The thorough infomation of the simulation input can be seen in "InformationTable.xlsx", while the SimulationInput.mat stores the necessary info.

 