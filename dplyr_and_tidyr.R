install.packages('dplyr')
library(dplyr)

df = data.frame(
  color = c('blue', 'black', 'blue', 'blue', 'black'),
  value = 1:5
)
View(df)

# filter
df[df$color=='blue',]
filter(df, color=='blue')
filter(df, value >3)
filter(df, color=='blue' & value >3)
filter(df, color=='blue', value >3)

# select
df['color']
select(df, color)
select(df, color, value)
select(df, starts_with('c'))
select(df, ends_with('r'))
select(df, contains('r'))

# sort data
df[order(df$color),]
df[order(df$value, decreasing = T),]
arrange(df, color)
arrange(df, desc(value))
arrange(df, color, desc(value))

# create new columns
df$squares = df$value^2
df %>% mutate(df, cubed = value^3)
# overwrite old column data
mutate(df, squares = value^3)
# create new data frame with new column without old columns
transmute(df, cubed = value^3)

# aggregation
sum(df$value)
summarise(df, sum_ = sum(value), avg=mean(value))

# grouping data
by_color = group_by(df, color)
summarize(by_color, sum_ = sum(value), avg=mean(value))
summarize(group_by(df, color), sum_ = sum(value), avg=mean(value))

# %>% operator
group_by(df, color) %>% summarize(., sum_ = sum(value), avg=mean(value))
df %>% group_by(color) %>% summarize(sum_ = sum(value), avg=mean(value))

# joins
setwd("/Users/junjiezhang/Desktop/erm/coding/class file")
getwd()
data1 = read.csv('data1.csv')
data2 = read.csv('data2.csv')
View(data1)
View(data2)

data1a = data1[1:8, ]
data2a = data2[4:11, ]
View(data1a)
View(data2a)
# inner join
inner_join(data1a, data2a, by=c('fname', 'lname', 'DOB'))
# left join
left_join(data1a, data2a, by=c('fname', 'lname', 'DOB'))
# right join
right_join(data1a, data2a, by=c('fname', 'lname', 'DOB'))
# right is the same as left if you switch the order
left_join(data2a, data1a, by=c('fname', 'lname', 'DOB'))
# outer join
full_join(data2a, data1a, by=c('fname', 'lname', 'DOB'))

full_join(data2a, data1a, by=c('fname', 'lname', 'DOB'), suffix=c('left', 'right'))
data1b = rename(data1a, fname1=fname, lname1=lname)
View(data1b)
full_join(data1b, data2a, by=c('fname1' = 'fname', 'lname1' = 'lname', 'DOB'))

# merge
merge(data1a, data2a, by=c('fname', 'lname', 'DOB'))
merge(data1a, data2a, by=c('fname', 'lname', 'DOB'), all.x = T)
merge(data1a, data2a, by=c('fname', 'lname', 'DOB'), all.y = T)
merge(data1a, data2a, by=c('fname', 'lname', 'DOB'), all.x = T, all.y = T)
merge(data1a, data2a, by=c('fname', 'lname', 'DOB'), all = T)
merge(data1b, data2a, 
      by.x=c('fname1', 'lname1', 'DOB'), 
      by.y=c('fname', 'lname', 'DOB'),
      all = T)

#install.packages('tidyr')
install.packages('tidyr')
install.packages('ggplot2')
library(tidyr)
marbles = data.frame(
  fname = c('alan', 'bob', 'charlie', 'dave', 'ed'),
  red = sample(1:20, 5, replace =T),
  blue = sample(1:20, 5, replace =T),
  green = sample(1:20, 5, replace =T)
)
View(marbles)
library(ggplot2)
pivot_longer(marbles, 
             cols = c('red', 'blue', 'green'), 
             names_to = 'color',
             values_to = 'count'
             ) %>% 
  ggplot(aes(fname, count)) + 
  geom_col(aes(fill=color), position='dodge') + 
  scale_fill_manual(values=c('blue', 'green', 'red'))

long_form = pivot_longer(marbles, 
                         cols = c('red', 'blue', 'green'), 
                         names_to = 'color',
                         values_to = 'count'
)

long_form %>% pivot_wider(names_from = 'color', values_from = 'count')

View(starwars)
# filter
starwars %>% filter(species=='Human') %>% nrow()
starwars %>% filter(mass > 1000) %>% nrow()
starwars %>% filter(hair_color == 'none', eye_color=='black') %>% nrow()
starwars %>% filter(hair_color == 'none' | eye_color=='black') %>% nrow()
starwars %>% filter(mass > mean(mass, na.rm=T)) %>% nrow()

# select
starwars %>% select(height)
starwars %>% select(height, mass)
starwars %>% select(mass:sex)
starwars %>% select(starts_with('m'))
starwars %>% select(starts_with('m'), ends_with('r'))

# arrange
starwars %>% arrange(height, desc(mass))

# mutate
starwars %>% select(name:mass) %>% mutate(bmi = mass/(height/100)^2) %>% arrange(bmi)

# aggregate data
starwars %>% select(name:mass) %>% mutate(bmi = mass/(height/100)^2) %>% 
  summarise(avg_height= mean(height, na.rm=T), avg_mass=mean(mass, na.rm=T), avg_bmi=mean(bmi, na.rm=T))
 
# group by
starwars %>% select(height, mass, species) %>% mutate(bmi = mass/(height/100)^2) %>% 
  group_by(species) %>%
  summarise(avg_height= mean(height, na.rm=T), avg_mass=mean(mass, na.rm=T), avg_bmi=mean(bmi, na.rm=T)) %>%
  arrange(avg_bmi)

# join
starwars %>% group_by(homeworld) %>% summarise(n=n()) %>% left_join(starwars, by='homeworld') %>% View()


print(airquality)
View(airquality)

airquality %>% select(Ozone, Solar.R, Month) %>% mutate(wtf = Ozone * Solar.R) %>% arrange(wtf) %>%
  group_by(Month) %>%
  summarize(avg_ozone = mean(Ozone, na.rm=T), avg_solar = mean(Solar.R, na.rm=T), avg_wtf = mean(wtf, na.rm=T),)  %>%
  arrange(avg_wtf)

airquality %>% group_by(Month) %>% summarise(n=n()) %>% right_join(airquality, by = 'Month') %>% View()
