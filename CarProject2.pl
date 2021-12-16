% Victor Tran, Eugene Lee, Tevin Vu
% Credits to Morris Rosenthal for his expertise (from IfItJams)


% ---------------------------[Facts]---------------------------
% Defines our nodes (node implictly means internal_node)
is_node(starter_cranks_node).	% starter_cranks_node is an (internal) node
is_node(engine_fires_node).
is_node(starter_spins_node).
is_node(battery_read_node).
is_node(cleaned_terminals_node).
is_node(spark_to_plugs_node).
is_node(starts_and_stalls_node).
is_node(fuel_to_filter_node).
is_node(spark_from_coil_node).
is_node(check_OBD_blink_code_node).
is_node(fuel_injected_node).
is_node(stalls_key_node).
is_node(stalls_in_rain_node).
is_node(stalls_warm_node).
is_node(mechanical_distributor_node).
is_node(twelveVPlus_at_Coil_node).

% Defines our leaves
is_leaf(solenoid_stuck_leaf).	% solenoid_stuck_leaf is a leaf
is_leaf(jump_start_leaf).
is_leaf(with_car_leaf).
is_leaf(clean_battery_leaf).
is_leaf(ignition_timing_leaf).
is_leaf(vapor_lock_leaf).
is_leaf(read_obd_leaf).
is_leaf(ignition_run_leaf).
is_leaf(adjust_idle_leaf).
is_leaf(check_condenser_leaf).
is_leaf(for_electric_leaf).
is_leaf(test_coil_leaf).
is_leaf(ignition_system_leaf).
is_leaf(cold_stalling_leaf).
is_leaf(single_point_leaf).
is_leaf(check_cracks_leaf).
is_leaf(try_starter_leaf).

% Defines our Branches
yes_child(engine_fires_node, starter_cranks_node).	% engine_fires_node is a yes_child of starter_cranks_node
yes_child(starts_and_stalls_node, engine_fires_node).
yes_child(solenoid_stuck_leaf, starter_spins_node).
yes_child(cleaned_terminals_node, battery_read_node).
yes_child(with_car_leaf, cleaned_terminals_node).
yes_child(fuel_to_filter_node,spark_to_plugs_node).
yes_child(check_OBD_blink_code_node,starts_and_stalls_node).
yes_child(stalls_key_node,check_OBD_blink_code_node).
yes_child(fuel_injected_node, fuel_to_filter_node).
yes_child(single_point_leaf,fuel_injected_node).
yes_child(ignition_run_leaf, stalls_key_node).
yes_child(check_cracks_leaf, stalls_in_rain_node).
yes_child(mechanical_distributor_node, spark_from_coil_node).
yes_child(adjust_idle_leaf, stalls_warm_node).
yes_child(test_coil_leaf, twelveVPlus_at_Coil_node).
yes_child(check_condenser_leaf, mechanical_distributor_node).

no_child(starter_spins_node, starter_cranks_node).	% starter_spins_node is a no_child of starter_cranks_node
no_child(spark_to_plugs_node, engine_fires_node).
no_child(battery_read_node, starter_spins_node).
no_child(jump_start_leaf, battery_read_node).
no_child(clean_battery_leaf, cleaned_terminals_node).
no_child(spark_from_coil_node, spark_to_plugs_node).
no_child(ignition_timing_leaf,starts_and_stalls_node).
no_child(vapor_lock_leaf, fuel_to_filter_node).
no_child(read_obd_leaf, check_OBD_blink_code_node).
no_child(try_starter_leaf, fuel_injected_node).
no_child(stalls_in_rain_node, stalls_key_node).
no_child(stalls_warm_node, stalls_in_rain_node).
no_child(twelveVPlus_at_Coil_node, spark_from_coil_node).
no_child(cold_stalling_leaf, stalls_warm_node).
no_child(ignition_system_leaf,twelveVPlus_at_Coil_node).
no_child(for_electric_leaf, mechanical_distributor_node).

% Defines our prompts
prompt(starter_cranks_node, 'Starter cranks?').
prompt(starter_spins_node, 'Starter spins?').
prompt(engine_fires_node, 'Engine fires?').
prompt(solenoid_stuck_leaf, 'The solenoid is stuck, is not powered, or has missing teeth on the flywheel.').
prompt(battery_read_node, 'Battery read over 12V?').
prompt(jump_start_leaf, 'Jump start or pop start car and check if battery is charging').
prompt(cleaned_terminals_node, 'Cleaned terminal?').
prompt(clean_battery_leaf, 'Clean battery terminals, connectors, and engine ground with baking soda').
prompt(spark_to_plugs_node, 'Spark to plugs?').
prompt(starts_and_stalls_node, 'Starts and stalls?').
prompt(ignition_timing_leaf, 'Ignition timing, fuel problem, cranking too slow-battery, starter.').
prompt(fuel_to_filter_node, 'Fuel to Filter?').
prompt(vapor_lock_leaf, 'Vapor lock and/or fuel pump, blockage.').
prompt(read_obd_leaf, 'Read OBD or OBD II manual for your car. Check for blink code access.').
prompt(fuel_injected_node, 'Fuel injected?').
prompt(single_point_leaf, 'Single Point, check throttle body. Electronic multi-point, separate disgnostic.').
prompt(try_starter_leaf, 'Try starter spray in carb, throttle open.').
prompt(ignition_run_leaf, 'Ignition \"run\" circuit or column key switch failure. Ring out with meter.').
prompt(check_cracks_leaf, 'Check for cracked coil or loose distributor caps. Water may have gotten into them, causing excessive arching until the water dries out. You may observe such visible electrical arcing by running the car in the dark.').
prompt(spark_from_coil_node, 'Spark from Coil?').
prompt(check_OBD_blink_code_node, 'Check ODB, blink code?').
prompt(stalls_key_node, 'Stalls on key release?').
prompt(cold_stalling_leaf, 'On cold stalling, check for stuck choke, EGR. Check for vacuum leak' ).
prompt(stalls_in_rain_node, 'Stalls in rain?').
prompt(stalls_warm_node, 'Stalls warm?').
prompt(adjust_idle_leaf, 'Adjust idle, blow out fuel filter, check fuel pump output. Check vacuum leak or sensor failure.').
prompt(twelveVPlus_at_Coil_node, '12VPlus at coil primary?').
prompt(test_coil_leaf, 'Test coil for internal short. Check secondary output wire resistance.').
prompt(ignition_system_leaf, 'Ignition system wiring, voltage regulator').
prompt(mechanical_distributor_node, 'Mechanical distributor?').
prompt(check_condenser_leaf, 'Check condenser, points or magnetic pick-up, rotor, or cap damage').
prompt(for_electric_leaf, 'For electronic distribution, see model manual for diagnotic checks').
prompt(with_car_leaf, 'With car in park or neutral, use heavy jumpers or screwdriver to bypass starter replay solenoid. Test the starter.').

% Defines descriptions to our prompts (internal nodes)
description(starter_cranks_node, 'You turn the key and hear breif, successive cranking noise[yes]. You do not hear it[no].').
description(starter_spins_node, 'The starter spins at a high speed and you hear a wooshing noise[yes]. The starter make clashing and grinding noises and failed to start the engine[no].').
description(engine_fires_node, 'After turning the key, hearing successive cranks, you hear the roaring of the engine[yes]. You do not hear your engine[no].').
description(battery_read_node, 'Grab a voltmeter and place the red wire on the power(+) of the car battery. Place the black wire to the negative(-) ground of the battery of ground-adjacent chassis of the car. Read the voltage. The voltage > ~12V [yes]. The voltage < ~12V[no]').
description(cleaned_terminals_node, 'Check the terminals of the car battery under the hood of the car. The battery terminals are clean of corrosion or corrosive material[yes]. The terminals have corrosive material on them[no].').
description(spark_to_plugs_node, 'The plugs are located on top of the engine that connects bundles of wires. Have a professional test and observe if the wires spark. Spark[yes]. No spark[no].').
description(starts_and_stalls_node, 'The car starts and then stalls[yes]. The car does not start at all[no].').
description(fuel_to_filter_node, 'Fuel is flowing through the multiple fuel filters in the car (gas tank, paper filter, etc.)[yes]. Fuel is not flowing through at least one filter[no].').
description(fuel_injected_node, 'The car has an electronic fuel injection or a carburateur[yes]. Otherise[no].').
description(spark_from_coil_node, 'Observe a spark at the coil secondary[yes]. Observe no spark[no].').
description(check_OBD_blink_code_node, 'Check the on-board diagnostics of your car. See blink codes on the dashboard in front of the steering wheel [yes]. Do not see blink code[no].').
description(stalls_key_node, 'The engire fires right up but stalls as soon as you release the key back to the run position[yes]. Otherwise[no].').
description(stalls_in_rain_node, 'Your car stalls in the event of rain, damp weather, or hitting a puddle[yes]. Otherwise[no].').
description(stalls_warm_node, 'The car stalls in the event of warm weather[yes]. Otherwise[no]').
description(twelveVPlus_at_Coil_node, 'Grab a volt meter and measure the coil primary. Read ~12V[yes]. Did not read ~12V[no].').
description(mechanical_distributor_node, 'The mechanical distributor looks liek a round cap with all the spark plug wires attatched to towers spaced along the edge of the coil secondary and into the middle tower. Your car has a mechicanl distributor[yes]. Your car does not[no].').

% Defines our records (internal nodes)
record_yes(starter_cranks_node, ['StarterCranks: Yes']).
record_yes(starter_spins_node, ['StarterSpins: Yes']).
record_yes(engine_fires_node, ['EngineFires: Yes']).
record_yes(battery_read_node, ['BatteryRead: Yes']).
record_yes(cleaned_terminals_node, ['CleanedTerminals: Yes']).
record_yes(spark_to_plugs_node, ['SparkToPlugs: Yes']).
record_yes(starts_and_stalls_node, ['StartsToStalls: Yes']).
record_yes(fuel_to_filter_node, ['FuelToFilter: Yes']).
record_yes(fuel_injected_node, ['FuelInjected: Yes']).
record_yes(spark_from_coil_node, ['SparkFromCoil: Yes']).
record_yes(stalls_in_rain_node, ['stallsInRain: Yes']).
record_yes(stalls_key_node, ['stallsOnKeyReleaseToRun: Yes']).
record_yes(stalls_warm_node,['stallsWarm: Yes']).
record_yes(twelveVPlus_at_Coil_node,['12VPlusAtCoilPrimary: Yes']).
record_yes(check_OBD_blink_code_node, ['ObdBlinkCode: Yes']).
record_yes(mechanical_distributor_node, ['MechanicalDistributor: Yes']).

record_no(starter_cranks_node, ['StarterCranks: No']).
record_no(starter_spins_node, ['StarterSpins: No']).
record_no(engine_fires_node, ['EngineFires: No']).
record_no(battery_read_node, ['BatteryRead: No']).
record_no(cleaned_terminals_node, ['CleanedTerminals: No']).
record_no(spark_to_plugs_node, ['SparkToPlugs: No']).
record_no(starts_and_stalls_node, ['StartsToStalls: No']).
record_no(fuel_to_filter_node,['FuelToFilter: No']).
record_no(fuel_injected_node, ['FuelInjected: No']).
record_no(spark_from_coil_node,['SparkFromCoil: No']).
record_no(stalls_in_rain_node, ['StallsInRain: No']).
record_no(stalls_key_node, ['StallsOnKeyReleaseToRun: No']).
record_no(stalls_warm_node,['StallsWarm: No']).
record_no(twelveVPlus_at_Coil_node, ['12VPlusAtCoilPrimary: No']).
record_no(check_OBD_blink_code_node, ['ObdBlinkCode: No']).
record_no(mechanical_distributor_node, ['MechanicalDistributor: No']).


% ---------------------------[Inferencing Logic]---------------------------

go :- 
write('Hello. I am your on-hand expert. I will diagnose what is wrong with your car by asking key questions. Respond with [yes/no/desc/report/quit]'), nl,
prompt(starter_cranks_node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(starter_cranks_node, Decision, []). 


% Handles yes decision that ends to a leaf node
makeDecision(Node, yes, Record) :- yes_child(YesNode, Node), 
is_leaf(YesNode),
record_yes(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
diagnose(YesNode, UpdatedRecord), !.


% Handles no decision that ends to a leaf node
makeDecision(Node, no, Record) :- no_child(NoNode, Node),
is_leaf(NoNode),
record_no(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
diagnose(NoNode, UpdatedRecord), !.


% Handles yes decision that paths to another (internal) node
makeDecision(Node, yes, Record) :- yes_child(YesNode, Node), 
is_node(YesNode),
record_yes(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
prompt(YesNode, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(YesNode, Decision, UpdatedRecord), !.


% Handles no decision that paths to another (internal) node
makeDecision(Node, no, Record) :- no_child(NoNode, Node),
is_node(NoNode),
record_no(Node, RecordInfo),
updateRecord(Record, RecordInfo, UpdatedRecord),
prompt(NoNode, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(NoNode, Decision, UpdatedRecord), !.


% Handles dont_know decision that paths to another (internal) node
makeDecision(Node, dont_know, Record) :-
makeDecision(Node, no, Record),
makeDecision(Node, yes, Record).


% Handles yes decision that paths to no node (in case a diagnosis(leaf) node has not been implemented yet)
makeDecision(_, yes, Record) :-
write('Unfortunately, there is no diagnosis for this problem. Please send the following record to a mechanic for assistance'), nl,
printRecord(Record), nl,
write('Have a nice day!'), nl, !.


% Handles no decision that paths to no node (in case a diagnosis(leaf) node has not been implemented yet)
makeDecision(_, no, Record) :-
write('Unfortunately, there is no diagnosis for this problem. Please send the following record to a mechanic for assistance'), nl,
printRecord(Record), nl,
write('Have a nice day!'), nl, !.


% Handles description by printing a prescription of an internal node when 'desc' is read
makeDecision(Node, desc, Record) :-
description(Node, Description),
write(Description), nl,
prompt(Node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(Node, Decision, Record).


% Handles no description available case
makeDecision(Node, desc, Record) :-
write('No description available'), nl,
prompt(Node, PromptString), 
write(PromptString), nl,
read(Decision), 
makeDecision(Node, Decision, Record).


% Prints a record of the car symptoms that have been inputted via a list when 'record' is read
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
printRecord(Record), nl, !.
%write('Thank you. I hope this helped!'), nl, !.


% Updates the record through concatenation of two lists
% Base case: Appending a list L to an empty list [] is that list L
updateRecord([],L,L).		
% Recursive case: Appending any list L to a list whose first element is X1 and rest is L1 is equal to a list whose first element is also X1 and whose remainder is the result of appending L to L1
updateRecord([X1|L1],L2,[X1|L3]) :- updateRecord(L1, L2, L3).


% Prints the record by iterating through each element and writing them
printRecord([]) :- write('No Record'), nl.
printRecord(L) :- write('Record: '), nl, iterateRecord(L).


% Recursively iterates over the record list head first
iterateRecord([]).
iterateRecord([H|[]]) :- write('   * '), write(H), nl.
iterateRecord([H|T]) :- write('   * '), write(H), nl, iterateRecord(T).


% Quits the application
quit :- write('Quitting application').