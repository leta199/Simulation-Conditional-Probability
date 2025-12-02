# Simulation - Conditional Probability
This project focuses on created reuseable functions in R that can be part of a larger program. It calculates conditional probability using stochastic simulations to predict the probability of a first dice roll given the sum of two dice rolls. 

This project will cover:

- Simualtion creation using loops
- Creation of reauseable function
- Test of the function (edge cases, error messages and extreme values)
 
## HOW IT'S MADE 
Languages used: R version (4.5.1)    
Environement: RStudio  
Packages: `testthat`

[![Language: R](https://img.shields.io/badge/Language-R-276DC3.svg?style=flat-square)](https://www.r-project.org/)
[![Built with RStudio](https://img.shields.io/badge/IDE-RStudio-75AADB?style=for‐the‐badge&logo=rstudio&logoColor=white)](https://www.rstudio.com/)
![Status](https://img.shields.io/badge/Status-Completed-lightgrey)

## METHODS AND TECHNIQUES  
**Setup of simulation**   

Setting up the number of successful trials (n) our loop stops at.  
Created `counter` to store successful trials.   
Utilised `simlist` to count the number of successes of the probabilty of interest. 

**Simulation loop**  

**While loop** that runs  as long as our counter is < 10,000  
**If statement**- if sum is 7 store  the success ( 2 given sum is 7 in "success" as 1 and 0 otherwise.   
iterate up our counter.     
Then assign successes to `simlist` based on the index of `counter`.   
Simulate probability with `mean()` of simlist. 

## FUNCTION EXPLANATION

In order to create the function `conditional_sum_prob`, I carried out the following tasks:

- Initiated the function creation process with the `function()` function to encapsulate my code block from the simulation.
- Optimised counter selection using a similar process to my Law of Large Numbers simulation to investigate the convergence to the analytical solution with different sample sizes.
  This was explored with the results on the following graph: 
- <img width="926" height="828" alt="Image" src="https://github.com/user-attachments/assets/4e95bf58-ef07-4502-9ba3-7dfddaaa0079" />

- Visualised each of the three trail functions to pick best simulated proababilty comapred to known analytical solution.
- Final beta function defined.

## FUNCTION TESTS 
For the final tests of the functions I carried out the following tests:   
1) **Edge cases**- using the `testthat` package I made sure the known porobabilities such as 2 given a sum of 7 are within a tolernace of 0.01. 

2) **Extreme values**- function would continue to run when values where outside of reasonable bounds.   

3) **If statement revision**- limited values that could be entered ustilisng if statements.   

4) **Error messages with if statements**- changed the output of format messages utilising `$` to call only specific error messages.

## FUNCTION EXAMPLES  
The function I created `conditional_sum_prob()` calculates the probablity of your first toss being a specific value given the sum of two dice rolls is a specific value.  
It has two main arguments:  
`first_toss`- what is the value of the first toss.   
`sum_of_tosses`- what is the sum of two dices tossed.   

1) Probability of the first toss being 2 given the sum of the two is 7 would be:  
`conditional_sum_prob(2,7`)   
returns [0.167] ≈ 1/6 

2) Probability of first toss being 7 given sum is 12 would be:  
`conditional_sum_prob(7,12)`  
returns  ["Please enter a value from 1-6 for the first toss"]

3) Probability of first toss being 3 given sum is 14 would be:  
`conditional_sum_prob(3,14)`  
returns ["Please enter a value from 2-12 for the sum of tosses"]

4) Probability of first toss being 7 given sum is 14 would be:  
`conditonal_prob_Sum(7,14)`  
returns  ["Please enter a value from 1-6 for the first toss"]
         ["Please enter a value from 2-12 for the sum of tosses"]
                    
6) Probability of first toss being 1 given sum is 8 would be:  
`conditonal_sum_prob(1,8)`  
returns [0]

 ## PROJECT STRUCTURE      
|[Simulation- Conditional Probability](https://github.com/leta199/Simulation-Conditional-Probability)  
|├── [Conditional probability](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Conditional%20probability.r)   
|├── [Beforetest_conditional_function](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Beforetests_conditional_function.r)  
|├── [README.md](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/README.md)    
|├── [Tests_conditional_prob](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/Tests_conditional_prob.r)  
|├── [conditional_sum_analytical_tex](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/conditional_sum.tex)  
|└──[conditonal_sum_pdf_analytical](https://github.com/leta199/Simulation-Conditional-Probability/blob/main/conditional_sum_analytical_pdf.pdf)
  
## ACKNOWLEDGEMENTS

Based on an example from "Probability with Applications and R" by Dr. Amy S. Wagaman and Dr. Robert P. Dobrow, Chapter 2

## WHAT DOES THE FUTURE HOLD?  

 1) Introduce a function called conditional_sum_prob() or the like to calculate the conditional probability of entered arguments and for reproducibility  ✅
 2) Add tests such as edge case testing, reproducibility, accuracy vs theoretical probability and distribution tests ✅
 3) Examples of function use cases through the README ✅  

## AUTHORS   
[leta199](https://github.com/leta199)  


