# Hello world
print('Hello World')

# multiple lines of comments
# line 2
# line 3

# Working Directory
getwd()
setwd('Desktop/')
getwd()

# R Data types

# Character
character_var = 'character'
# Checking types
typeof(character_var)

# Logical
logical_var = TRUE # or T
typeof(logical_var)
# logical shorthand
logical_var = F
logical_var == FALSE

# Double/Numeric
double_var = 1
typeof(double_var)

# Integer
integer_var = as.integer(1)
typeof(integer_var)

# Complex
complex_var = 3i
typeof(complex_var)
complex_var
complex_var = as.complex(0)
complex_var

# Missing Value
NA

# Documentation for functions
?typeof
help("typeof")

# Vector
# List/array like data structure that stores one data type
is.complex(complex_var)
is.vector(complex_var)
vector_var = c(1, 2, 3)
vector_var
typeof(vector_var)

vector_var = c(1, 2, 'b')
vector_var
typeof(vector_var)

vector_var = c(1, 2, T)
vector_var
typeof(vector_var)

vector_var = c('2', T)
vector_var
typeof(vector_var)

vector_var = c(1, '2', T)
vector_var
typeof(vector_var)

# Default
myvec_log = vector(mode='logical', length=3)
myvec_log
myvec_int = vector(mode='integer', length=3)
myvec_int
myvec_char = vector(mode='character', length=3)
myvec_char

long_vec = vector(length=50)
# indexing a vector and overwriting values
long_vec[25] = T
long_vec

# consecutive int vectors
1:10
4:10
-4:10
consecutive_int_vec = 1:10
consecutive_int_vec + 2
consecutive_int_vec + consecutive_int_vec

# rollover
consecutive_int_vec + 1:5

# for loop
myvec_log = vector(mode='logical', length=3)
myvec_log
myvec_int = vector(mode='integer', length=3)
myvec_int

for (i in 1:3){
  myvec_log[i] = T
  myvec_int[i] = 2*i
}
myvec_int
myvec_log

# Functions
PracticeAdd = function(a, b){
  a+b
  #return(a+b)
}
PracticeAdd(1,2)

# defualt
PracticeAdd = function(a, b=1){
  # a+b
  return(a+b)
}
PracticeAdd(1)

#Source - run lines of code in other scripts
source('PracticeScript.R')

y

# Packages
install.packages('ggplot2')
library(ggplot2)

# package documentation
vignette()
vignette('ggplot2')
vignette('ggplot2-specs')

# data frame
name = c('a', 'b', 'c', 'd', 'e', 'f', 'g')
age = c(20,25,30,35,40,45,50)
# seq function
income = seq(50000, 80000, length.out=7)
income
shopping = seq(10000, 70000, by=10000)
shopping

mydf = data.frame(name, age, income, shopping, saving=income-shopping)
mydf
View(mydf)

# Plotting
plot(income, shopping)
barplot(income)
title('This is my plot')


# Input/Output
write.csv(mydf, 'myOutput.csv')
data_roundtrip = read.csv('myOutput.csv', row.names = 1)
View(data_roundtrip)

write.csv(mydf, 'myOutput.csv', row.names = F)
data_roundtrip = read.csv('myOutput.csv')
View(data_roundtrip)

# built-in datasets
data()
cars
View(cars)


# Matrix algebra
matrix(1:25, )
?matrix
matrix(1:25, 5, 5)
matrix(1:25, 5)
matrix(1:25, ncol=5)
matrix(1:25, ,5)
matrix(1:25, 1)

X = matrix(1:25, 5, 5)
X * 1:5
X %*% 1:5
b = matrix(1:5)
X%*%b

