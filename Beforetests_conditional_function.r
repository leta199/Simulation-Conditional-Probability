#FUNCTION CREATION ####--------------------------------------------------------------------------------
#Creating a function to calculate the conditional probability of first toss given a specific sum of two tosses 
#Let's tinker around to find out how we do this ;-)

conditional_sum_tinker<- function(first_toss, sum_of_two_tosses) { #initiating the function and creating allowable arguments  
  
simlist<-numeric(10000) #inserting the above simulation into the function block 
counter<-0
  while (counter<10000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) } 

conditional_sum_tinker(2,7)  #what is the probability of the first roll being a 2 given the sum of the two rolls is 7
conditional_sum_tinker(6,12) #what is the probability of the first roll being a 6 given the sum of the two rolls is 12  

#OPTIMAL COUNTER LIMIT
#Based on my LLN simulation, I know that the larger the sample size the closer the mean (simlist) (which is really
# proportion of random tosses that meet criteria) will be to analytical probability. So let's change counter size
# where counter size = sample size 

#Test #1- with our counter at 100 (sample size is 100)
conditional_sum_test1<- function(first_toss, sum_of_two_tosses) {
  
simlist<-numeric(100)
counter<-0
  while (counter<100) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }

#Test 2- with our counter at 1000 (sample size is 1000)
conditional_sum_test2<- function(first_toss, sum_of_two_tosses) {
  
simlist<-numeric(1000)
counter<-0
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }

#Test #3- with our counter at 10000 (sample size is 10000)
conditional_sum_test3<- function(first_toss, sum_of_two_tosses) {
  
simlist<-numeric(10000)
counter<-0
  while (counter<10000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }

conditional_sum_tinker(2,7)
conditional_sum_test1(2,7)
conditional_sum_test2(2,7)
conditional_sum_test3(2,7)

#Visualising function convergence ####--------------------------------------------------------------------------------
#I want to see how quickly each function converges to the analytical solution,  therefore I will compare 
#them across large repetitions 
#plot scatter graph that shows how each test function performs in regard to specific probability as n -> infinity

set.seed(12677) #set seed for reproducibility across test
n<-100          #number of repetitions of each function 

#Function #1 with counter < 100 
conditional_1<- function() {
  
simlist<-numeric(100)
counter<-0
  while (counter<100) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == 7) {               
      success<-if(trial[1]==2)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }
simlist_avg<-replicate(n, conditional_1())
cumulative_mean<- cumsum(simlist_avg)/1:n

#Function #2 with counter < 1000
conditional_2<- function() {
  
simlist<-numeric(1000)
counter<-0
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == 7) {               
      success<-if(trial[1]==2)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }
simlist_avg_2<-replicate(n, conditional_2())
cumulative_mean_2<- cumsum(simlist_avg_2)/1:n

#Function #3 with counter < 10000
conditional_3<- function(){  
  
simlist<-numeric(10000)
counter<-0
  while (counter<10000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == 7) {               
      success<-if(trial[1]==2)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
return(mean(simlist)) }
simlist_avg_3<-replicate(n, conditional_2())
cumulative_mean_3<- cumsum(simlist_avg_3)/1:n

#Plotting the convergence to analytical solution amongst the functions 
plot(1:n, cumulative_mean, type = "l", col = "salmon",
     xlab=" Number of dice pair rolls",
     ylab="Simulated probability",
     main= "Comparison of the convergence of different functions")
lines(1:n, cumulative_mean_2, type="l", col="maroon")
lines(1:n, cumulative_mean_3, type = "l", col = "turquoise")
abline(h=0.1666667, col="blue4", lwd=1)

#Conclusion ####----------------------------------------------------------------------------------------------------------------
#Conditional_sum_test_2 converges close to the analytical solution first and has the best balance of
#performance and convergence so I will us counter < 1000 for the final function.

#Final Function 
conditional_sum_prob<- function(first_toss, sum_of_two_tosses) {
  simlist<-numeric(1000)
  counter<-0
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
  return(mean(simlist)) }









