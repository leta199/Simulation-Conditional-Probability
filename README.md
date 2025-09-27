# Simulation-Conditional-Probability

Programming conditional probaility in R.   

## HOW IT'S MADE 
Languages used: R verion (4.5.1)    
Environement: RStudio

## METHODS AND TECHNIQUES  
**Setup of simulation**   
Setting up the number of successful trials (n) our loop stops at.  
counter to store successful trials   
simlist to count the number of successes fo the probabilty of interest. 

**Simulation loop**  
while loop that runs  as long as our counter is < 10,000  
if statement- if sum is 7 store  the success ( 2 given sum is 7 in "success" as 1 and 0 otherwise.   
iterate up our counter.     
assign successes to simlist based on the index of counter.   
mean of simlist to simulate probability 

## PROJECT STRUCTURE      
[Simulation- Conditional Probability](https://github.com/leta199/Simulation-Conditional-Probability)/  
├── [Conditional probability](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Conditional%20probability.r)/   
├── [Beforetest_conditional_function](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Beforetests_conditional_function.r)  
├── [README.md](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/README.md)/    
└──[Tests_conditional_prob](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Tests_conditional_prob.r)

## FUNCTION EXPLANATION

In order to create the function `conditional_sum_prob`, I carried out the following tasks:

- Initiated the function creation process with the `function()` function to encapsulate my code block from the simulation.
- Optimised counter selection using a similar process to my Law of Large Numbers simulation to investigate the convergence to the analytical solution with different sample sizes
- Visualised each of the three trail functions to pick best simulated proababilty comapred to known analytical solution.
- Final beta function defined.

## FUNCTION TESTS 
For the final tests of the functions I carried out the following tests:   
1) **Edge cases**- using the `testthat` package I made sure the known porobabilities such as 2 given a sum of 7 are within a tolernace of 0.01. 

2) **Extreme values**- function would continue to run when values where outside of reasonable bounds.   

3) **If statement revision**- limited values that could be entered ustilisng if statements   

4) **Error messages with if statements**- changed the output of format messages utilising `$` to call only specific error messages 

Based on an example from:
"Probability with Applications and R" by Dr. Amy S. Wagaman and Dr. Robert P. Dobrow, Chapter 2

## WHAT DOES THE FUTURE HOLD?  
 Going into the future I want to add the following:  
 1) Introduce a function called conditional_sum_prob() or the like to calculte the conditional probability of entered arguments and for reproducibility.  ✅
 2) Add tests such as edge case testing, reproducibility, accuracy vs theoretical probability and distribution tests. ✅
 3) Examples of function use cases the README. []  
 4) Finally adding visualisations like looking at the dictribution of sums with a histogram. []

## AUTHORS   
[leta199](https://github.com/leta199)  


