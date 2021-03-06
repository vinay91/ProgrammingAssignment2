## The first function, makeCacheMatrix creates a special "Matrix", which is really a list containing a function to

##set the value of the Matrix
##get the value of the Matrix
##set the value of the Inverse
##get the value of the Inverse


makeCacheMatrix <- function(x = matrix()) {
        inv <- NULL
        set <- function(y) {
                x <<- y
                inv <<- NULL
        }
        get <- function() x
        setinverse <- function(inverse) inv <<- inverse
        getinverse <- function() inv
        list(set=set, get=get, 
             setinverse=setinverse, 
             getinverse=getinverse)
}


## The following function calculates the mean of the special "vector" created with the above function. 
##However, it first checks to see if the mean has already been calculated. 
##If so, it gets the mean from the cache and skips the computation.
##Otherwise, it calculates the mean of the data and sets the value of the mean in the cache via the setmean function.

cacheSolve <- function(x, ...) {
        inv <- x$getinverse()
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        data <- x$get()
        inv <- solve(data)
        x$setinverse(inv)
        inv
        ## Return a matrix that is the inverse of 'x'
}
