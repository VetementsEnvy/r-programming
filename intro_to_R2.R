setwd('~/Desktop/R/')
getwd()
1
is.vector(1)
c(1, 6, 3)
c(1, "a")
c(1:4, 10:20)
#quick numeric vectors
1:4
10:20
seq(3)
seq(7, 12)
seq(7.5, 12)
seq(7.5, 12, length.out =3 )

#char vector
c('a', 'b', 'c')
letters[1:3]
LETTERS[1:3]

#Random sampling
sample(1:10, 5)
sample(10:5, replace = FALSE)
sample(10:5, 20, replace = T)

#Repition
rep(1:10, 3)

rep(1:10, each=3)
rep(1:10, length.out = 25)

rep(1:10, times=1:10)

#vector refrencing
my_vec = letters
my_vec = 1:10
my_vec[6]
my_vec[6:10]
my_vec[c(1, 1, 1)]
my_vec[c(1, 5, 2)]
my_vec[c(1:10)]
my_vec[-4]
my_vec[-c(4, 6)]
my_vec[c(T, F)]

numeric_vec = 1:10
greater_than_five = numeric_vec > 5
numeric_vec[greater_than_five]

numeric_vec[4:6] = 1
numeric_vec

my_vec = 1:4
names(my_vec) = c('first_ele', 'second_ele',
                  'third_ele', 'fourth_ele')
my_vec['first_ele']
my_vec

if (c(T, F)){
  print(1)
} else if (F){
  print(2)
} else {
  print(3)
}

#conditional
if (c(F, T)){
  print(1)
} else if (F){
  print(2)
} else {
  print(3)
}

# ifelse
numeric_vec = 1:10
ifelse(numeric_vec > 5, numeric_vec + 1, numeric_vec -1)
numeric_vec > 5

# lists
my_list = list(1:4, c('a', 'b'), logical_list_item=c(T))
my_list[['logical_list_item']]
my_list$logical_list_item
unlist(my_list)

#data frames
name_vec = letters[1:7]
pet_vec = c('cat', 'dog', 'turtle', 'goldfish', 'turtle', 'goldfish')
n = 1000
names_column = sample(name_vec, n, replace = T)
pet_column = sample(pet_vec, n, replace = T)
age = sample(5:100, n, replace = T)
income = sample(50000:200000, n, replace = T)

my.df = data.frame(names_column, pet_column, age, income)
my.df
View(my.df)
str(my.df)

my_df1 = data.frame(names_column, pet_column, age, income, stringsAsFactors = T)
my_df1
View(my_df1)
str(my_df1)

#reference dataframe column
my_df1$names_column
my_factor = factor(c('a', 'b', 'c'))

#factors
my_factor[4] = 'c'
my_factor
my_factor[5] = 'c'
my_factor
my_factor[6] = 'd'

object.size(my.df$pet_column)
object.size(my_df1$pet_column)

#load data set
data()
data('mpg', package = 'ggplot2')
View(mpg)

mpg$hwy
names(mpg)
names(my_list)
#all colnames is 1
colnames(mpg) = 1 #renamecol

# %in% operator
'X' %in% names(mpg)

'class' %in% names(mpg)

# delete a column
mpg$class = NULL
View(mpg)
'class' %in% names(mpg)

#Referencing a dataframe
mpg$manufacturer
mpg[c('manufacturer', 'hwy')]

#use comma to separate filters for the different dimensions
#before the comma reprensents the rows
#after the comma reprensents the cols
#id there is a third or more dimensions, add more commas
mpg[,'manufacturer']

mpg[,c('manufacturer', 'hwy')]
mpg[,]#dataframe
mpg[1:10,]#dataframe
mpg[1:10, 'hwy']#vector
mpg[1:10,c('manufacturer', 'hwy')] #dataframe
str(mpg)
class(mpg$manufacturer)

#reshape
#install.packages('reshape')
library(reshape2)

View(tips)

#frequency table
table(tips$size, tips$day)


#
dcast(tips, size ~ day)

dcast(tips, size ~ day + time, value.var = 'tip')
dcast(tips, size ~ day + time, value.var = 'tip', fun.aggregate = mean)

dcast(tips, size ~ day + time, value.var = 'tip', fun.aggregate = sum)








