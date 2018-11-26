## The following functions are used to create a matrix 
## and cache its inverse matrix for the purpose of 
## saving computational time.

## First, the follow function is to create R projects 
## of matrix and its inverse matrix 

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL  
    set <- function(y){
        x <<- y 
        i <<- NULL 
    }
    get <- function() x
    setinverse <- function(inversed) i <<- inversed
    getinverse <- function() i 
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The second function is used to input a matrix argument as in 
## makeCacheMatrix() and retrive the matrix's inverse from the enviroment defined by 
## makeCacheMatrix() for computational usage

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    i <- x$getinverse() 
    if(!is.null(i)){
        print("getting cached data")
        return(i)
    }
    newmatrix <- x$get()
    i <- solve(newmatrix)
    x$setinverse(i)
    i
}
