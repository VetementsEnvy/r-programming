# ggplot 2 is a plotting package 
# that provides helpful commands to create complex plots

# install ggplot2
# install.packages('ggplot2')

library(ggplot2)


# for all ggplot plots we start off with using the function ggplot
# the function initializes a ggplot object 
# which acts as the foundation as a plot
# we can then use other functions from ggplot2 to add components to the plot
# instead of having a single function to create a plot
# we can combine different objects like building blocks
# to create and update the components of the plot

# blank plot object
ggplot()

# we can store data in the ggplot object 
# so other components can access that data
# use mpg data
data("mpg")
ggplot(data=mpg)

# we can also set default variables to be used in our plots
# aesthetic mappings describe how variables in the data are mapped 
# to visual properties (aesthetics) of a geom (type of plot)
# ggplot is a package from a larger group of packages called the tidyverse
# in tidyverse functions, we can refer to columns in a data directly
# with the column name as a variable
g = ggplot(data=mpg, mapping = aes(x=displ, y=hwy))
g

# we can add a geometric object (geom) to add a type of plot 
# on top of our foundations
g + geom_point()

# we can define the data and mappings in the geom 
# instead of having it defined in the ggplot object
ggplot() + geom_point(data=mpg, mapping = aes(x=displ, y=hwy))
ggplot(data=mpg) + geom_point(mapping = aes(x=displ, y=hwy))

# title, axis, legends
g = ggplot(data=mpg, aes(x=displ, y=hwy))
g + geom_point() + ggtitle('highway vs displacement') + 
  xlab('displacement') + ylab('highway')
g + geom_point() + labs(
  title='highway vs displacement', 
  x= 'displacement', 
  y='highway',
)

# Aesthetics
# instead of just specifying the variables used for the plots
# we can update other aesthetics of a plot
# the aesthetics are usually specific the the geom

# color
g + geom_point(aes(color = class))
g + geom_point(aes(color=class)) + labs(
  title='highway vs displacement', 
  x= 'displacement', 
  y='highway',
  color='car class'
)

# size
# warning says using a discrete variable is not advised
# difficult to scale the sizes
g + geom_point(aes(size = class))
g + geom_point(aes(size = cty))

# shape
# warning that by default, only want 6 shapes
# suv is empty
g + geom_point(aes(shape = class))

# transparency
# discrete values are also not advised for transparency
g + geom_point(aes(alpha = class))

# Color
# aes mapping maps a value in a variable to a specific color
g + geom_point(aes(color = class))
# setting the color without specifying a mapping with aes
# matches the name of a color with the data points in the variable by index
# must be a single color or match the lenth of the data
g + geom_point(color='green')
g + geom_point(color = sample(c('blue','red'), nrow(mpg), T))
# can access an array of color names with the color function
g + geom_point(color = sample(colors(),nrow(mpg),replace = T))

# Color Brewer
# to access more colors
# install.packages('RColorBrewer)
library(RColorBrewer)
display.brewer.all()
# 3 sections of colors
# first section is a gradient from light to dark of a color
# second are sets of colors to make it easy to differentiate points
# third is a two way gradient from one color to another

# scale functions create components 
# that lets you override aesthetic properties
# we are overriding the colors used to map to the class values
g + geom_point(aes(color = class)) + 
  scale_color_brewer(palette = 'Blues')
g + geom_point(aes(color = class)) + 
  scale_color_brewer(palette = 'Greens')
g + geom_point(aes(color = class)) + 
  scale_color_brewer(palette = 'Set1')

# reorder
g + geom_point(aes(color = class))
# right now the color of our classes is ordered by alphabetical order
# for character variables, they are ordered alphabetically
# for numeric variables, they are ordered numerically
# if we want to specify the order, we can do so by making the variable a factor
# and specifying the levels
mpg2 = mpg
mpg2$class = as.factor(mpg$class)
str(mpg)
str(mpg2)
levels(mpg2$class)
levels(mpg2$class) = levels(mpg2$class)[length(levels(mpg2$class)):1]
levels(mpg2$class)
ggplot(mpg2, aes(x=displ, y=hwy)) + geom_point(aes(color=class))

# what if we want to reorder our data without resetting the levels
g + geom_point(aes(color=reorder(class, hwy, mean)))
avg_hwy = aggregate(mpg$hwy, by=list(class = mpg$class), FUN=mean)
avg_hwy[order(avg_hwy$x),]


# Shapes
g + geom_point(aes(shape = class))
# we can override the shapes used to map to the class values
# since the default only allows 6
# we can set more shapes and choose which shapes to use by setting the values
# 26 shapes starting from 0
g + geom_point(aes(shape = class)) + 
  scale_shape_manual(values = 1:7)
# using a numeric vector allows to choose the shapes to use
g + geom_point(aes(shape = class)) + 
  scale_shape_manual(values = 7:14)
# can update the legend as well
g + geom_point(aes(shape = class)) + 
  scale_shape_manual(values = 1:7,name ='MyLegend')
# can also replace shapes with character vector 
# shape has to be 1 character long
g + geom_point(aes(shape = class)) + 
  scale_shape_manual(values = c('a','b','c','d','e','f','g'))
g + geom_point(aes(shape = class)) + 
  scale_shape_manual(values = c('*','.','$','%','?','0','~'))
# view all the shapes
ggplot(data.frame(num = 0:25), aes(num, 0, shape = as.factor(num))) +
  geom_point() +
  scale_shape_manual(values = 0:25) +
  theme_void()
# themes allows you to customize non-data components of your plot

# Themes 
g + geom_point(aes(color = class))
# you can set your own config using theme
g + geom_point(aes(color = class)) + theme()
# other theme functions have their own preset configurations
# but you can apply you own changes in the function
g + geom_point(aes(color = class)) + theme_classic()
g + geom_point(aes(color = class)) + theme_bw()
g + geom_point(aes(color = class)) + theme_dark()
g + geom_point(aes(color = class)) + theme_void()


# Facets allow you to separate plots based of different groups
# facet grid separates the groups by y axis and x axis
# use a . to not separate by that axis

g + geom_point() + facet_grid(. ~ cyl)
g + geom_point() + facet_grid(drv ~ .)
g + geom_point() + facet_grid(drv ~ cyl)
# facet wrap only allows one group and overflows on a row 
# if there are too many graphs on the row
g + geom_point() + facet_wrap( ~ class)
# they use r formula syntax so you can create a group
# based off multiple variables by adding them together
g + geom_point() + facet_grid(drv + class ~ cyl)

# Geometries: Jitter ####
g = ggplot(data = mpg, aes(x = cty, y = hwy)) 
g + geom_point()
# add random variation to the location of each point 
# useful to see overlapping points 
g + geom_jitter()
# same as 
g + geom_point(position='jitter')

# Geometries: Smoothing 
# can stack multiple plots/geoms on top of the same plot
# smooth conditional mean
# basically a regression line
# se is for showing standard errors
# default is loess: Local Polynomial Regression Fitting

g + geom_point() + geom_smooth(se = FALSE) 
g + geom_point() + geom_smooth(method='lm', se = T) 
g + geom_point() + geom_smooth(aes(color=class), method='lm', se = T) 


# Geometries: Box Plots ####
# distribution of continuous variable within categories
# median, first and third quartile
g = ggplot(data = mpg, aes(x = class, y = hwy))
g + geom_boxplot()
g = ggplot(data = mpg, aes(x = reorder(class,hwy,median), y = hwy))
g + geom_boxplot()

# Geometries: Box Bars ####
g = ggplot(data = mpg,aes(x = drv))
g + geom_bar()

g + geom_bar(aes(fill = drv))
g + geom_bar(aes(fill = fl))
# position fill gets the ratio of each fill category within x
g + geom_bar(aes(fill = fl), position = 'fill')
# dodge creates separate graphs for each fill/color category within x
g + geom_bar(aes(fill = fl), position = 'dodge')

# Geometries: Histogram ####
# only need one aes since this only plots a single variable
g = ggplot(data = mpg,aes(x = hwy))
g + geom_histogram()
g + geom_histogram(binwidth = 5)
g + geom_histogram(bins = 4)

# Geometries: Histogram: Multiple ####
g + geom_histogram() + facet_wrap(~drv)
# freqpoly plots a line graph of the center of the top of a bin in a histogram
g + geom_freqpoly() + facet_wrap(~drv)
# density plot
g + geom_density() + facet_wrap(~drv)
# plotting multiple lines in the same plot
g + geom_freqpoly(aes(color = drv))
g + geom_density(aes(color = drv))

# Geometries: Large Data 
# how to plot large amounts of data
data('diamonds')
g = ggplot(data = diamonds, aes(x = carat, y = price))
# on a normal scatter plot, the points overlap a lot
# its difficult to see the data points and the distribution of data
g + geom_point()

# Large Data Aesthetics ####
# can change size of points
g + geom_point(size = 0.5)
# can change transparenct
g + geom_point(alpha = 0.1)
# can combine both
g + geom_point(size = 0.5, alpha = 0.1)
# 2d binning 
g + geom_bin2d()
# 2d density for contour plot
g + geom_point() + geom_density2d()
# since we have more data, we can plot multiple regression lines
g + geom_smooth(aes(color = cut), se=T, method = 'loess')










