# Diagnosing Common Reasons for Car Failure Using Prolog

## Goal: 
Our object is to create an expert system, our expert being a car mechanic, and encode his or her knowledge with Prolog. The expert system will diagnose many reasons why cars fail to start.

## Data: 
From Morris Ronsenthal’s Diagnostic flowchart for a car that won’t start or stalls found here: https://www.ifitjams.com/starting.htm. The flowchart is a binary decision tree with two types of nodes: query nodes and diagnosis nodes. The internal nodes (in the shape of diamonds) are query nodes that the user must answer about a particular issue with the car. The query nodes have two explicit branches, yes and no, corresponding to the user’s answer to the question. The leaf nodes (in the shape of circles) are diagnosis nodes that give the assessment of the car based on a path of query nodes traversed.


## Why Prolog: 
Prolog has a backtracking advantage, which is parallel. Therefore, this takes advantage of parallel processing and is more efficient. Backtracking is also a natural top-down solution to traversing decision trees. In such a case where the answer to a query node is “dont_know”, traverse paths for each child node of an “unanswered node” to receive multiple solutions via backtracking. Also, Prolog has better support/updates/widespread use than, say, CLIPS. Prolog is more suitable for our application than C++ because it leverages string pattern matching and unification to traverse through the decision tree. We avoid writing many counterintuitive if statements and nested if statements and such. Also, we do not need to overhaul our code each time a new fact is added. We just need to add more facts.


## Structure: 
Separated facts and inference logic from each other. The facts are the nodes and branches that build the tree. The inference logic is how the tree is traversed based on the user’s answer to questions.

We have questions (internal nodes represented by the diamond on the graph). 
We have diagnoses (leaf nodes represented by the bubbles on the graph).
We have branches (connect nodes to each other based on a yes or no decision)

We have rules that traverse the graph based on input.
yes -> move towards the next node through the yes branch
no -> moves towards the next node through the no branch
don't know -> moves towards the both children nodes through the no branch first and then the yes branch.
desc -> print a description of the question
record -> print the list of recorded answers to questions using recursion
any invalid input -> repeat the question


## Lessons Learned: 
Using Prolog in a coding style where we separated the facts and logic leads to a more intuitive and maintainable code base.
In fact, we have two versions of this project. In the older version, we implemented prolog as if we were coding in C++ and trying to mimic if statements and nested if statements.
Our code did not even have any facts!

Even worse if we wanted to update rules, we would have to rehaul code for every fact we have written. Because the facts and rules were essentially intertwined.

Adding new rules in our new version was simple. We just add a constant amount of code in the inference logic section and everything works like magic. Actually it’s not like magic. Everything works through the use of Prolog’s pattern matching, unification, backtracking, and other elements such as the lists and cut operator

## Possible Extensions/Future Work:
Prolog is mainly used for backends of an application. In our prolog file, when a user reaches a diagnosis node, we print out the diagnosis for the user. However, a single sentence diagnosis may not be sufficient to help the user fix his or her car issues. For instance, the diagnosis of cleaning the terminals off the battery is not helpful for a person who does not know what the battery looks like. We may write more verbose diagnoses and print that to the user, but we could do better by building a front end. The front end could be a website for example that uses the Tau Prolog library to interface javascript with prolog queries. Instead of storing single-sentence diagnosis to print to the user, we could store web pages. Once a diagnosis or a series of candidate diagnoses, the users can be directly sent or given a list of links to said web pages. The webpages can provide much more information, including textual information, pictures, videos, and a user-friendly interface.

To add, decision trees provide a very limited structure for diagnosing car faults. There could be many reasons, depending on extraneous variables such as car model, year, the type of parts, the environment, and so on. The user may not know how to answer a query (or if it is even possible to answer the query based on their car). Even worse, different cars may show the same symptoms, yet require different diagnosis. To better solve this issue, a statistical approach is preferred using a Bayesian network.