## Function "cacheSolve" returns the inverse of matrix x.
## If the matrix is unaltered then the cache copy of the inverse is returned,
## else the inverse is calculated and returned.
cacheSolve <- function(x, ...) {
        my_inverse <- x$get_inverse()			# Call get_inverse to load inverse
        if(!is.null(my_inverse)) {				# If inverse previously calc'ed then return from cache
                message("getting cached inverse matrix")
                return(my_inverse)
        }
        my_data <- x$get()					# If inverse not available then calc it and return
	  my_inverse <- x$set_inverse(my_data)		# set_inverse calcs the inverse
        return(my_inverse)
}