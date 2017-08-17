###Chapter 3 Transformations

###Histograms (1)
# Build a histogram of the waiting variable of the faithful data set.
faithful %>% ggvis(~waiting) %>% layer_histograms()

# Build the same histogram, but with a binwidth of 5 units
faithful %>% ggvis(~waiting) %>% layer_histograms(width = 5)

###Histograms (2)
# Finish the command
faithful %>% 
  compute_bin(~waiting, width = 5) %>% 
  ggvis(x = ~xmin_, x2 = ~xmax_, y = 0, y2 = ~count_) %>% 
  layer_rects()

###Density Plots
# Combine compute_density() with layer_lines() to make a density plot of the waiting variable.
faithful %>% ggvis(~waiting, fill := "green") %>% layer_densities()

###Shortcuts
# Complete the code to plot a bar graph of the cyl factor.
mtcars %>% ggvis(~factor(cyl)) %>% layer_bars()

# Adapt the solution to the first challenge to just calculate the count values. No plotting!
mtcars %>% compute_count(~factor(cyl))

###ggvis And group_by
# Both ggvis and dplyr are loaded into the workspace

# Instruction 1
mtcars %>% group_by(cyl) %>% ggvis(~mpg, ~wt, stroke = ~factor(cyl)) %>% layer_smooths()

# Instruction 2
mtcars %>% group_by(cyl) %>% ggvis(~mpg, fill = ~factor(cyl)) %>% layer_densities()

###group_by() Versus interaction()
# Alter the graph
mtcars %>% group_by(cyl, am) %>% ggvis(~mpg, fill = ~interaction(cyl, am)) %>% layer_densities()

###Chaining Is A Virtue
mtcars %>%
  group_by(am) %>%
  ggvis(~mpg, ~hp) %>%
  layer_smooths(stroke = ~factor(am)) %>%
  layer_points(fill = ~factor(am))

