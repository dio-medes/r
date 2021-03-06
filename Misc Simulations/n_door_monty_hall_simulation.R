# n-door Monty-hall simulation. Helps with intuition with the problem.
# If you selected a door, and then Monty opned 999,998 of the door doors, it's pretty 
# intuitive that one should swap. That is what the below code shows.

# Number of doors (must be more than 3):
k <- 4

# Number of Simulations:
n <- 10^4

#Repeating code the better way
do_once <- function()
{
  
  choice <- sample(1:k,1)
  true <- sample(1:k,1)
  forbidden <- c(choice,true)
  canopen <- setdiff(1:k,forbidden)
  
  opened <- sample(canopen,(k-2), replace = FALSE)
  swapdoor <- setdiff(1:k,c(choice,opened))
  result <- swapdoor == true
  result
}
success <- sum(replicate(n,do_once())) # TRUE encoded as 1, FALSE as 0.
prob<- success/n
prob

