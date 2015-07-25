## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL

        ### 1. set the value of the matrix
        set <- function(y) {
                x <<- y
                m <<- NULL
        }

        ### 2. get the value of the matrix
        get <- function() x

	### 3. set the value of the inverse of matrix
        setsolve <- function(solve) m <<- solve

	### 4. get the value of the inverse of matrix
        getsolve <- function() m

	# return our list
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getsolve() # retrieve from cache

        if(!is.null(m)) { # Check if m is null
                message("Retrieving cached data")
                return(m)
        }

	# cache isn't filled yet
        data <- x$get()       # get it
        m <- solve(data, ...) # solve it
        x$setsolve(m)	      # set it
        m		      # return it
}