## makeCacheMatrix - creates a matrix with a no of functions. Most important for this excercise
## Write a short comment describing this function

##Logic and syntax for constructors/accessors of an R object are heavily informed by https://www.coursera.org/learn/r-programming/peer/tNy8H/programming-assignment-2-lexical-scoping
##Jared M Stern


makeCacheMatrix <- function(x = matrix()) {
    ##Constructor for matrix, contains getter/setter for the matrix itself, and the currently empty cacheInv.
        cacheInv <- NULL
        setMatrix <- function(y) {
                x <<- y
                cacheInv <<- NULL
        }
        getMatrix <- function() x
        setInverse <- function(solve) cacheInv <<- solve
        getInverse <- function() cacheInv
        list(setMatrix = setMatrix, getMatrix = getMatrix,
             setInverse = setInverse,
             getInverse = getInverse)
}

##Cache solve will return the inverse of the matrix object created by makeCacheMatrix

cacheSolve <- function(x, ...) {
        cacheInv <- x$getInverse()
        message("Checking for Cache:")
        ##if cache exists, return it and go no further
        if(!is.null(cacheInv)) {
                message("Exists")
                return(m)
        }
    
        message("Does Not Exist")
        #code below is executed if cache is NULL, and will generate and cache the inverse of the given matrix.
        m <- x$getMatrix()
        cacheInv <- solve(m)
        x$setInverse(cacheInv)
        cacheInv
}

##test fields below
testmatrix <- makeCacheMatrix(rbind(c(2, 3)), rbind(c(2, 2)))
##sample invertable vector. Inverted values are as follows
##     [,1] [,2]
##[1,]   -1  1.5
##[2,]    1 -1.0

#running uncached version, returns results
uncached <- cacheSolve(testMatrix)
uncached

#running cached version, returns results
cached <- cacheSolve(testMatrix)
cached
