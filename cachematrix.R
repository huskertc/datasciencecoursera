## makeCacheMatrix
## makeCacheMatrix takes as input a square matrix and returns a list of four 
## functions:
## $set allows the user to define a square matrix (in the parent environment).
## $get returns the user-defined matrix.
## $set_inverse calculates the inverse of the parent-environment matrix.
## $get_inverse returns the inverted matrix.
#
makeCacheMatrix <- function(x = matrix()) {
    my_inverse <- NULL				          # Initialize inverse matrix
    set <- function(my_matrix) {			  # Function to define matrix
        x <<- my_matrix				          # Pass my_matrix from parent environment
        my_inverse <<- NULL			        # Invalidate the cached inverse if $set called
    }
    get <- function() {				          # Returns the matrix
        x
    }
    set_inverse <- function(my_matrix)  {  	# Function to calc inverse
        my_inverse <<- solve(my_matrix)	# Invert the parent matrix
    }
    get_inverse <- function()  {			  # Returns the inverse of the matrix
        my_inverse
    }
    list(set = set, get = get, set_inverse = set_inverse, get_inverse = get_inverse)
}


## cacheSolve
## Function "cacheSolve" returns the inverse of matrix x.
## If the matrix is unaltered then the cache copy of the inverse is returned,
## else the inverse is calculated and returned.
cacheSolve <- function(x, ...) {
    my_inverse <- x$get_inverse()  	      # Call get_inverse to load inverse
    if(!is.null(my_inverse)) {				    # If inverse previously calc'ed then return from cache
        message("getting cached inverse matrix")
        return(my_inverse)
    }
    my_data <- x$get()					          # If inverse not available then calc it and return
    my_inverse <- x$set_inverse(my_data)	# set_inverse calcs the inverse
    return(my_inverse)
}

