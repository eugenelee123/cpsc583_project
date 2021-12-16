#Diagnosing Common Reasons for Car Failure

##Goal: 
Our object is to create an expert system, our expert being a car mechanic, and encode his or her knowledge with Prolog. The expert system will diagnose many reasons why cars fail to start.

##Data: 
From Morris Ronsenthal’s Diagnostic flowchart for a car that won’t start or stalls found here: https://www.ifitjams.com/starting.htm. The flowchart is a binary decision tree with two types of nodes: query nodes and diagnosis nodes. The internal nodes (in the shape of diamonds) are query nodes that the user must answer about a particular issue with the car. The query nodes have two explicit branches, yes and no, corresponding to the user’s answer to the question. The leaf nodes (in the shape of circles) are diagnosis nodes that give the assessment of the car based on a path of query nodes traversed.



There are two types of nodes





##Why Prolog: 
Backtracking advantage, better support/updates/widespread use than, say, CLIPS, Better than C++ because leverage string pattern to update our systems easily. Rather than messing with if statements and nested if statements and such, we just need to add more facts.



##Structure: 
Separated facts and inference logic from each other.

We have questions (internal nodes represented by the diamond on the graph). 
We have diagnosis (leaf nodes represented by the bubbles on the graph).

We have rules that traverse the graph based on input.
yes -> move towards the next node through the yes branch
no -> moves towards the next node through the no branch
desc -> print a description of the question
record -> print the list of recorded answers to questions using recursion
any invalid input -> repeat the question

##Lessons Learned: 
Using Prolog in a coding style where we separated the facts and logic leads to a more intuitive and maintainable code base.
In fact, we have two versions of this project. In the older version, we implemented prolog as if we were coding in C++ and trying to mimic if statements and nested if statements.
Our code did not even have any facts!

Even worse if we wanted to update rules, we would have to rehaul code for every fact we have written. Because the facts and rules were essentially intertwined.

Adding new rules in our new version was simple. We just add a constant amount of code in the inference logic section and everything works like magic. Actually it’s not like magic. Everything works through the use of Prolog’s pattern matching, unification, backtracking, and other elements such as the lists and cut operator
