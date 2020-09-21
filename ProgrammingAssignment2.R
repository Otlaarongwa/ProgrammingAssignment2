
R version 4.0.2 (2020-06-22) -- "Taking Off Again"
Copyright (C) 2020 The R Foundation for Statistical Computing
Platform: x86_64-w64-mingw32/x64 (64-bit)

R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

[Previously saved workspace restored]

> makeVector <- function(x = numeric()) {
+         m <- NULL
+         set <- function(y) {
+                 x <<- y
+                 m <<- NULL
+         }
+         get <- function() x
+         setmean <- function(mean) m <<- mean
+         getmean <- function() m
+         list(set = set, get = get,
+              setmean = setmean,
+              getmean = getmean)
+ }
> makeVector
function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
}
> cachemean <- function(x, ...) {
+         m <- x$getmean()
+         if(!is.null(m)) {
+                 message("getting cached data")
+                 return(m)
+         }
+         data <- x$get()
+         m <- mean(data, ...)
+         x$setmean(m)
+         m
+ }
> cachemean
function(x, ...) {
        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
> makeCacheMatrix <- function(x = matrix()) {
+   j <- NULL
+   set <- function(y){
+   x <<- y
+   j <<- NULL
+   }
+   get <- function()x
+   setInverse <- function(inverse) j <<- inverse
+   getInverse <- function() j 
+   list(set = set, get = get, 
+   setInverse = setInverse, 
+   getInverse = getInverse)
+ }
> 
> ##Please include your own comment to explain your code (Required in Rubric)
> 
> cacheSolve <- function(x, ...) {
+ ## Return a matrix that is the inverse of 'x'
+   j <- x$getInverse()
+   if(!is.null(j)){
+   message("getting cached data")
+   return(j)
+   }
+   mat <- x$get()
+   j <- solve(mat,...)
+   x$setInverse(j)
+   j
+ }
> makecachemean
Error: object 'makecachemean' not found
> makeCacheMatrix
function(x = matrix()) {
  j <- NULL
  set <- function(y){
  x <<- y
  j <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) j <<- inverse
  getInverse <- function() j 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}
> cacheSolve
function(x, ...) {
## Return a matrix that is the inverse of 'x'
  j <- x$getInverse()
  if(!is.null(j)){
  message("getting cached data")
  return(j)
  }
  mat <- x$get()
  j <- solve(mat,...)
  x$setInverse(j)
  j
}
> 
