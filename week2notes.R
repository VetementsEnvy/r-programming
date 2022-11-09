f <- function(a, b = 1, c = 2, d = NULL){
  a^2
}


#lazy evaluation
f <- function(a, b){
  a^2
}
f(2)
#return 4

f <- function(a, b){
  print(a)
  print(b)
}
f(45)
#return 45, and error for b

#...argument extending another and you don't want to type the entire argument
myplot <- function(x, y, type = "1", ...){
  plot(x, y, type = type, ...)
}



lm <- function(x) {
  x * x
}


f <- function(x, y){
  x^2 + y/z
}

#Lexical Scoping
make.power <- function(n){
  pow <- function(x){
    x^n
  }
  
  pow
}
cube <- make.power(3)
cube(2)
square <- make.power(2)
square(10)

# what's in a function's environment?
ls(environment(cube))
get("n", environment(cube))

#lexical(y=10) vs dynamic scoping(y=2)
y <- 10
f <- function(x){
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}



g <- function(x){
  a <- 3
  x+a+y
}
g(2)


#constructor function
make.NegLogLik <- function(data, fixed=c(FALSE, FALSE)){
  params <- fixed
  function(p){
    params[!fixed] <- p
    mu <- params[1]
    sigma <- params[2]
    a <- -0.5*length(data)*log(2*pi*sigma^2)
    b <- -0.5*sum((data-mu)^2) / (sigma^2)
    -(a + b)
  }
}

set.seed(1); normals <- rnorm(100, 1, 2)
nll <- make.NegLogLik(normals)
nll

ls(environment(nll))

data

optim(c(mu = 0, sigma = 1), nll)$par
nll <- make.NegLogLik(normals, c(FALSE, 2))
optimize(nll, c(-1, 3))$minimum

x <- as.Date("1970-01-01")
x
unclass(x)
unclass(as.Date("1970-01-02"))


x <- Sys.time()
x
p <- as.POSIXlt(x)
names(unclass(p))
unclass(p)

d<- as.POSIXct(x)
unclass(d)

p$sec

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")


x <- 1:10
if(x > 5){
        x < -0
}













x
class(x)

x <- as.Date("2012-01-01")
y <- strptime("9 Jan 2011 11:34:21", "%d %b %Y %H:%M:%S")
x -y
x <- as.POSIXlt(x)
x
x-y



View(mpg)
mean(mtcars$mpg)


View(iris$)