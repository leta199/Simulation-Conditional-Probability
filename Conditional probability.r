#CONDITIONAL PROBABLITY SIMULATION####
#Are probabilities that are contingent on knowing a previous state
#We can simulate these in R using loops that count the number outcomes we would like to measure 
# once a specific criteria has been met

##CONDIITONAL PROBABILITY AND DICE ROLLS####
#Find the probability of rolling a 2 one the first dice given that two dice rolls add up to 7
#P(X_{1}=2 | X_{1}+X_{2}=7)

###SETUP####
n<-10000              #number of successful trials where sum = 7
counter<-0            #stores successful trials 
simlist<-numeric(n)   #counting the number of successes of the type of probability we want  

#Run Simulation
while (counter<n) {   # while loop- iterates as long as our counter < n 
  trial<-sample(1:6,2,replace = TRUE) # randomly sample number from 1 to 6 twice
  if(sum(trial) ==7) {                # if statement- add 1 to counter if first trial is 2 given sum is 7 
    success<-if(trial[1]==2)1 else 0  
    counter<-counter+1
    simlist[counter] <-success}
}

mean(simlist)
#This is close to the calculated probability of 1/6 ≈ 0.16666667
#Fun fact-interestingly this loop will run until we have 10,000 successful trials 
#but technically it will run for ≈ 60,000 instances since we only have a 1/6 chance of having a success.
# Based on an example from:
#"Probability with Applications and R" by Dr. Amy S. Wagaman and Dr. Robert P. Dobrow, Chapter 2
