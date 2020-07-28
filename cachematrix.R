## makeCacheMatrix creates a special "matrix" object that can cache its inverse.
## cacheSolve computes the inverse of the special "matrix" returned by makeCacheMatrix.

## makeCacheMatrix
makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    get <- function() {x}
    setinv <- function(inverse) {i <<- inverse}
    getinv <- function() {i}
    list(set = set, get = get,
         setinv = setinv,
         getinv = getinv)
}

## cacheSolve
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    i <- x$getinv()
    if(!is.null(i)) {
        message("getting cached data")
        return(i)
    }
    mat <- x$get()
    i <- solve(mat, ...)
    x$setinv(i)
    i
}
