#TESTS####--------------------------------------------------------------------------------------------
#EDGE CASES---------------------------------------------------------------------------------------
#Since this is our final function: 

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

#When extreme values are entered like `(9,15)` our function cannot handle them and keeps running 
#permanently so I need to limit the range of values that can be entered into the function as arguments. 
#TESTTHAT PACKAGE- Used to test if your function with specific arguments works in a way you would expect. 
#testthat package sources: https://r-pkgs.org/testing-basics.html , https://www.youtube.com/watch?v=bx92oCMxUhg

install.packages("testthat")
library(testthat)

#EDGE CASES---------------------------------------------------------------------------------------------------------------------------------- 
#Testing on known probabilities (1,9) = 0 (2,7) ≈ 1/6
test_that( "conditional_sum_prob returns 0 for impossible probability ",
           {expect_equal(conditional_sum_prob(1,9), 0)
           })
#success
test_that( "conditional_sum_prob returns ≈ 1/6 for arguments  (2,7) ",
           {result<- conditional_sum_prob(2,7)
            expect_equal(result, 1/6, tolerance = 0.01) #make sure simulated probability is ± 0.01 of analytical solution
             })
#success 
#EXTREME VALUES---------------------------------------------------------------------------------------------------------------------------
test_that("conditional_sum_prob returns 0 for impossible arguments",
          {expect_equal(conditional_sum_prob(7,14),0)
          }) 
#fail
#For extreme values our function keeps running so:
#I have to make it only accept integers from 1-6 for arg 1 and 2-12 for arg 2

#FUNCTION REVISION------------------------------------------------------------------------------------------ ---------------------------------------------  
#I will add a few if statements to reject extreme values above or below the realms of possibility with six sided dice

conditional_sum_prob<- function(first_toss, sum_of_two_tosses) {
  simlist<-numeric(1000)
  counter<-0
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
    if (first_toss > 6 | first_toss < 1) {
      return("Please enter a value from 1-6 for the first toss") 
    } 
    if(sum_of_two_tosses > 12 | sum_of_two_tosses < 2) {
      return("Please enter a value from 2-12 for the sum of tosses")
    }
  }
  return(mean(simlist)) }

#Test to see execution
test_that("conditional_sum_prob return `Please enter value from 1-6 for the first toss` ",
          { expect_equal(conditional_sum_prob(7,5), "Please enter a value from 1-6 for the first toss")}
)
#success 

test_that("conditional_sum_prob return `Please enter value from 2-12 for the sum of tosses`",
          { expect_equal(conditional_sum_prob(3,15), "Please enter a value from 2-12 for the sum of tosses")}
)
#success

#IF STATEMENT LIMITATIONS---------------------------------------------------------------------------------------------------------
#Since the function runs sequentially the first if statement is read and returns the required output 
#But if both args are wrong then user is only alerted of arg 1 being wrong and will be alerted of the other after changing the first

conditional_sum_prob(8,15) #returns only "Please enter a value from 1-6" even though 15 is invalid as well 

#Let me combine both if statements into 1 

conditional_sum_prob<- function(first_toss, sum_of_two_tosses) {
  simlist<-numeric(1000)
  counter<-0
  errors<-list()
  if (first_toss > 6 | first_toss < 1) {
    errors[[1]]<-"Please enter a value from 1-6 for the first toss"
  } 
  if(sum_of_two_tosses > 12 | sum_of_two_tosses < 2) {
    errors[[2]]<-"Please enter a value from 2-12 for the sum of tosses"
  }
  if(length(errors)>0) {
    return(errors)
  }
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
  return(mean(simlist))}

conditional_sum_prob(7,9)
conditional_sum_prob(5,15)
conditional_sum_prob(8,20)
#Returns the right messages but returns Null for the first element in the list if there is no error in arg 1 
#but there is an error in arg 2 so I will try to remedy this.

conditional_sum_prob<- function(first_toss, sum_of_two_tosses) {
  simlist<-numeric(1000)
  counter<-0
  errors<-list()
  if (first_toss > 6 | first_toss < 1) {
    errors$first_toss<-"Please enter a value from 1-6 for the first toss"
  } 
  if(sum_of_two_tosses > 12 | sum_of_two_tosses < 2) {
    errors$sum_of_tosses<-"Please enter a value from 2-12 for the sum of tosses"
  }
  if(length(errors)>0) {
    return(errors)
  }
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
  return(mean(simlist))}

conditional_sum_prob(7,9)  #returns error message for only toss 1
conditional_sum_prob(5,15) #returns error message for only toss 2
conditional_sum_prob(8,20) #returns error message for  toss 1 and 2 

#Conclusion------------------------------------------------------------------------------------------------------------------------
#Overall I believe I made a pretty robust function that covers edge cases and is very informative.
#If I had to apply more tests I would make a histogram of the analytical vs simulated probability to see how well it matches. 
#I would also add the ability to set your seed for reproducibility of end users. 

#OUR FINAL PRODUCT----------------------------------------------------------------------------------------------------------------
conditional_sum_prob<- function(first_toss, sum_of_two_tosses) {
  simlist<-numeric(1000)
  counter<-0
  errors<-list()
  if (first_toss > 6 | first_toss < 1) {
    errors$first_toss<-"Please enter a value from 1-6 for the first toss"
  } 
  if(sum_of_two_tosses > 12 | sum_of_two_tosses < 2) {
    errors$sum_of_tosses<-"Please enter a value from 2-12 for the sum of tosses"
  }
  if(length(errors)>0) {
    return(errors)
  }
  while (counter<1000) {   
    trial<-sample(1:6,2,replace = TRUE) 
    if(sum(trial) == sum_of_two_tosses) {               
      success<-if(trial[1]==first_toss)1 else 0  
      counter<-counter+1
      simlist[counter] <-success}
  }
  return(mean(simlist))}

conditional_sum_prob(4,7) #works well 
conditional_sum_prob(6,6) #works well 
