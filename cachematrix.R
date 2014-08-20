## Put comments here that give an overall description of what your
## functions do
## This two functions will cache the inverse of a square matrix.
## After being stored, this inverse can be called again at any time if the 
## ofiginal matrix has not changed. This way we can save computing time and make
## our more efficient.


## Write a short comment describing this function
##This function first super-assigns the value "NULL" to the object "inverse" that
##is located in the parent environment of the current environment.
##Then, it provides a list of functions that will be assigned to the new object
##we will create by using this function. These list of functions will be used
##by the "cacheSolve" function to calculate the inverse of the matrix or, if it
##was already calculated, the function will get it from the parent environment 
##of the current environment.
makeCacheMatrix <- function(x = matrix()) {
        inverse <<- NULL     ##Resets the value of inverse to "NULL".
        
        set_inverse <- function(inv){    ##This is the first "function" inside
                inverse <<- inv          ##the "makeCacheMatrix" function. This
        }                                ##will cache the value of "inverse"
        
        get_inverse <- function(){inverse}   ##This functions will return the
                                             ##value stored in "inverse"
        
        list(set_inverse = set_inverse,     ##This is a list of the functions
             get_inverse = get_inverse      ##that the "makeCacheMatrix" function
        )                                   ##will return
}


##Write a short comment describing this function
##This is the function that actually do the main job. First it will get the
##stored value for the object "inverse". Then it will check if its value is equal
##to "NULL". If it is equal to "NULL", "cacheSolve" will calculate the inverse 
##of the matrix and, by using the function "set_inverse" from the object created
##with "makeCacheMatrix", will store this value in the parent environment.
##If the value of "inverse" is different than "NULL", it will just print the 
##message "Getting cached data" followed by the inverse of the matrix.
cacheSolve <- function(x, ...) {
        ###Return a matrix that is the inverse of 'x'
        inverse <-x$get_inverse() ##First it gest the stored value for "inverse"
        
        if(!is.null(inverse)){                     ##Here it checks if the value
                message("Getting cached data")     ##of "inverse" is equal to
                return(inverse)                    ##"NULL". If it's not, the
        }                                          ##function prints the message
                                                   ##and the value of "inverse"
                                                   ##"return" finish the function
                                                   ##so the following parts are
                                                   ##not executed
        
        inverse <- solve(m)   ##If the value of "inverse" is "NULL" it will
                              ##it will calculate the inverse of the matrix
        
        x$set_inverse(inverse)  #the newly calculated inverse will be cached
        
        inverse   ##Prints the inverse of the matrix
}

##Example. I used the following matrix:
x <- sample(1:1e+06, 9) ##Chooses randomly 9 numbers from the range 1:1e+06

n <- 3                  ##Number of rows and columns for the matrix

m <- matrix(x,n,n)      ##Creates the matrix called "m"

example <- makeCacheMatrix(m) ##Creates the special "matrix"

cacheSolve(example)   ##Returns the inverse of the matrix.

cacheSolve(example)   ##Returns the message "Getting cached data" plus the 
                        ##inverse of the matrix.


x <- sample(1:1e+06, 4) ##Resets the numbers to create the matrix.

n <- 2                  ##Resets the number or rows and columns for the matrix.

m <- matrix(x,n,n)      ##Replaces the old "m" using the new parameters.

example <- makeCacheMatrix(m) ##Resets the special "matrix."

cacheSolve(example)   ##The function recalculates and prints the inverse of
                        ##the matrix.

cacheSolve(example)   ##Returns the messge "Getting cached data" plus the 
                        ##inverese of the matrix.
