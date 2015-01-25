##Creates the Cache Matrix object
makeCacheMatrix <- function(x = matrix())
{
  m=NULL
  set <- function(y)
  {
    #sets the matrix
    x <<- y
    m <<- NULL
  }
  get <- function()
  {
    #retrieves the matrix
    x
  }
  setInverse <- function(Inverse)
  {
    #sets the inverse
    m <-- Inverse
  }
  getInverse <- function()
  {
    #retrieves the cached inverse
    m
  }
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

##this solves the matrix and sets the solution into the cache
cacheSolve <- function(x, ...)
{
  m <- x$getInverse()
  if(!is.null(m))
  {
    #if the inverse exists in the cache, then it spits it out
    print("retrieving cached data")
    m
  }
  else
  {
    #if the matrix does not exist in the cache, then it's computed and set
    data <- x$get()
    m <- solve(x, ...)
    x$setInverse(m)
    m
  }
}