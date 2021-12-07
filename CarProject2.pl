
% ---------------------------[Facts]---------------------------
% *node means internal_node


% Defines our nodes
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
prompt(solenoid_stuck_leaf, 'Solenoid stuck, not powered. Missing teeth on flywheel.').
prompt(battery_read_node, 'Battery read over 12V?').
prompt(jump_start_leaf, 'Jump start or pop start car and check if battery is charging').
prompt(cleaned_terminals_node, 'Cleaned terminal?').
prompt(clean_battery_leaf, 'Clean battery terminals and connectors, engine ground').
prompt(spark_to_plugs_node, 'Spark to plugs?').
prompt(starts_and_stalls_node, 'Starts to stalls?').
prompt(ignition_timing_leaf, 'ignition timing, fuel problem, cranking too slow-battery, starter.').
prompt(fuel_to_filter_node, 'Fuel to Filter?').
prompt(vapor_lock_leaf, 'Vapor lock, fuel pump, blockage.').
prompt(read_obd_leaf, 'Read OBD or OBD II or check for blink code access.').
prompt(fuel_injected_node, 'Fuel injected?').
prompt(single_point_leaf, 'Single Point, check throttle body. Electronic multi-point, separate disgnostic.').
prompt(try_starter_leaf, 'Try starter spray in carb, throttle open.').
prompt(ignition_run_leaf, 'Ignition \"run\" circuit or column key switch failure. Ring out with meter.').
prompt(check_cracks_leaf, 'Check for cracked coil, distributor. Check visible electrical arcing running in dark').
prompt(spark_from_coil_node, 'Spark from Coil?').
prompt(check_OBD_blink_code_node, 'Check ODB, blink code?').
prompt(stalls_key_node, 'Stalls on key release to run?').
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
prompt(with_car_leaf, 'With car in park or neutral, use heavy jumpers or screwdriver to bypass starter replay solenoid, Test starter').

% Defines our records (internal nodes)
record_yes(starter_cranks_node, ['StarterCranksYes']).
record_yes(starter_spins_node, ['StarterSpinsYes']).
record_yes(engine_fires_node, ['EngineFiresYes']).
record_yes(battery_read_node, ['BatteryReadYes']).
record_yes(cleaned_terminals_node, ['CleanedTerminalsYes']).
record_yes(spark_to_plugs_node, ['SparkToPlugsYes']).
record_yes(starts_and_stalls_node, ['StartsToStallsYes']).
record_yes(fuel_to_filter_node, ['FuelToFilterYes']).
record_yes(fuel_injected_node, ['FuelInjectedYes']).
record_yes(spark_from_coil_node, ['SparkFromCoilYes']).
record_yes(stalls_in_rain_node, ['stallsInRainYes']).
record_yes(stalls_key_node, ['stallsOnKeyReleaseToRunYes']).
record_yes(stalls_warm_node,['stallsWarmYes']).
record_yes(twelveVPlus_at_Coil_node,['12VPlusAtCoilPrimaryYes']).
record_yes(check_OBD_blink_code_node, ['ObdBlinkCodeYes']).
record_yes(mechanical_distributor_node, ['MechanicalDistributorYes']).

record_no(starter_cranks_node, ['StarterCranksNo']).
record_no(starter_spins_node, ['StarterSpinsNo']).
record_no(engine_fires_node, ['EngineFiresNo']).
record_no(battery_read_node, ['BatteryReadNo']).
record_no(cleaned_terminals_node, ['CleanedTerminalsNo']).
record_no(spark_to_plugs_node, ['SparkToPlugsNo']).
record_no(starts_and_stalls_node, ['StartsToStallsNo']).
record_no(fuel_to_filter_node,['FuelToFilterNo']).
record_no(fuel_injected_node, ['FuelInjectedNo']).
record_no(spark_from_coil_node,['SparkFromCoilNo']).
record_no(stalls_in_rain_node, ['stallsInRainNo']).
record_no(stalls_key_node, ['stallsOnKeyReleaseToRunNo']).
record_no(stalls_warm_node,['stallsWarmNo']).
record_no(twelveVPlus_at_Coil_node, ['12VPlusAtCoilPrimaryNo']).
record_no(check_OBD_blink_code_node, ['ObdBlinkCodeNo']).
record_no(mechanical_distributor_node, ['MechanicalDistributorNo']).

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