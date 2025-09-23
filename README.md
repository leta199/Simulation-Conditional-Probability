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

## PROJECT STRUCTURE Walmart‑Data‑Mining‑and‑Exploratory‑Data‑Analysis‐/     
[Simulation- Law of Large Numbers](https://github.com/leta199/Simulation-Law-of-Large-Numbers-)/  
├── [Law of large numbers in action](https://github.com/leta199/Simulation-Law-of-Large-Numbers-/blob/main/Law%20of%20large%20numbers%20in%20action.png)/   
├── [Law of large numbers sim/](https://github.com/leta199/Simulation-Law-of-Large-Numbers-/blob/main/Law_of_Large_Numbers_sim.r)/   
└── [README.md/](https://github.com/leta199/Simulation-Law-of-Large-Numbers-/blob/main/README.md)/  

Based on an example from:
"Probability with Applications and R" by Dr. Amy S. Wagaman and Dr. Robert P. Dobrow, Chapter 2

## WHAT DOES THE FUTURE HOLD?  
 Going into the future I want to add the following:  
 1) Introduce a function called conditional_dice_prob() or the like to calculte the conditional probability of entered arguments and for reproducibility.  
 2) Add tests such as edge case testing, reproducibility, ccuracy vs theoretical probability and distribution tests.
 3) Finally adding visualisations like looking at the dictribution of sums with a histogram. 

## AUTHORS   
[leta199](https://github.com/leta199)  


