## I just made the input x a matrix.
## then, set the resolution "j" value to be null
## and I modified every "mean" reference to "solve"
makeCacheMatrix <- function(x = matrix(sample(1:400,6),1,2)) {
j <- NULL
set <- function(y) {
x <<- y
j <<- NULL
}
get <- function() x
setsolve <- function(solve) j <<- solve
getsolve <- function() j
list(set = set, get = get,
     setsolve = setsolve,
getsolve = getsolve)
}
##
## I did the same thing, but I changed "mean" to "solve" and "m" to "j."
cacheSolve <- function(x, ...) {
j <- x$getsolve()
if(!is.null(j)) {
message("getting inversed matrix")
return(j)
}
data <- x$get()
j <- solve(data, ...)
x$setsolve(j)
j
}
