
% ---------------------------[Facts]---------------------------
% *node means internal_node


% Defines our nodes
is_node(starter_crank_node).	% starter_crank_node is an (internal) node
is_node(stater_spins_node).
is_node(engine_fires_node).
is_node(battery_read_node).


% Defines our leaves
is_leaf(solenoid_stuck_leaf).	% solenoid_stuck_leaf is a leaf
is_leaf(jump_start_leaf).


% Defines our Branches
yes_child(engine_fires_node, starter_cranks_node).	% engine_fires_node is a yes_child of starter_cranks_node
yes_child(solenoid_stuck_leaf, starter_spins_node).
yes_child(cleaned_terminals_node, battery_read_node).

no_child(starter_spins_node, starter_cranks_node).	% starter_spins_node is a no_child of starter_cranks_node
no_child(battery_read_node, starter_spins_node).
no_child(jump_start_leaf, battery_read_node).


% Defines our prompts
prompt(starter_cranks_node, 'Starter cranks?').
prompt(starter_spins_node, 'Starter spins?').
prompt(engine_fires_node, 'Engine fires?').
prompt(solenoid_stuck_leaf, 'Solenoid stuck, not powered. Missing teeth on flywheel.').
prompt(battery_read_node, 'Battery read over 12V?').
prompt(jump_start_leaf, 'Jump start or pop start car and check if battery is charging').


% Defines our records (internal nodes)
record_yes(starter_cranks_node, ['StarterCranksYes']).
record_yes(starter_spins_node, ['StarterSpinsYes']).
record_yes(engine_fires_node, ['EngineFiresYes']).
record_yes(battery_read_node, ['BatteryReadYes']).

record_no(starter_cranks_node, ['StarterCranksNo']).
record_no(starter_spins_node, ['StarterSpinsNo']).
record_no(engine_fires_node, ['EngineFiresNo']).
record_no(battery_read_node, ['BatteryReadNo']).






% ---------------------------[Inferencing Logic]---------------------------

go :- 
prompt(starter_cranks_node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(starter_cranks_node, Decision, []). 


% Handles yes decision that ends to a leaf node
makeDecision(Node, yes, Record) :- yes_child(YesNode, Node), 
is_leaf(YesNode),
record_yes(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
diagnose(YesNode, UpdatedRecord).


% Handles no decision that ends to a leaf node
makeDecision(Node, no, Record) :- no_child(NoNode, Node),
is_leaf(NoNode),
record_no(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
diagnose(NoNode, UpdatedRecord).


% Handles yes decision that paths to another (internal) node
makeDecision(Node, yes, Record) :- yes_child(YesNode, Node), 
record_yes(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
prompt(YesNode, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(YesNode, Decision, UpdatedRecord).


% Handles no decision that paths to another (internal) node
makeDecision(Node, no, Record) :- no_child(NoNode, Node),
record_no(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
prompt(NoNode, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(NoNode, Decision, UpdatedRecord).


% Handles record decision
makeDecision(Node, record, Record) :-
printRecord(Record),
prompt(Node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(Node, Decision, Record).


% Handles quit decision
makeDecision(_, quit, _) :- quit.


% Handles invalid input decision
makeDecision(Node, _, Record) :-
write('Invalid input. Please try again.'), nl,
prompt(Node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(Node, Decision, Record).


% Writes the proper diagnose message based on the leaf
diagnose(Node, Record) :- write('Diagnosis: '), prompt(Node, PromptString), write(PromptString), nl,
write('Here is the final report of your car.'), nl,
printRecord(Record), nl,
write('Thank you. I hope this helped!'),!.


% Updates the record through concatenation of two lists
updateRecord([],L,L).												
updateRecord([X1|L1],L2,[X1|L3]) :- updateRecord(L1, L2, L3).


% Prints the record by iterating through each element and writing them
printRecord([]) :- write('No Record'), nl.
printRecord(L) :- write('Record: '), nl, iterateRecord(L).
iterateRecord([]).
iterateRecord([H|[]]) :- write('   * '), write(H), nl.
iterateRecord([H|T]) :- write('   * '), write(H), nl, iterateRecord(T).


% Quits the application
quit :- write('Quitting application').