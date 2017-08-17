###Chapter 1 The Grammar Of Graphics

###Load ggvis And Start To Explore
# ggvis is already installed for you; now load it and start playing around
library("ggvis")

# change the code below to plot the disp variable of mtcars on the x axis
mtcars %>% ggvis(~disp, ~mpg) %>% layer_points()

###ggvis And Its Capabilities
# The ggvis packages is loaded into the workspace already

# Change the code below to make a graph with red points
mtcars %>% ggvis(~wt, ~mpg, fill := "red") %>% layer_points()

# Change the code below draw smooths instead of points
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Change the code below to make a graph containing both points and a smoothed summary line
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()

###ggvis Grammar ~ Graphics Grammar
# Adapt the code: show bars instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_bars()

# Adapt the codee: show lines instead of points
pressure %>% ggvis(~temperature, ~pressure) %>% layer_lines()

# Extend the code: map the fill property to the temperature variable
pressure %>% ggvis(~temperature, ~pressure, fill = ~temperature) %>% layer_points()

# Extend the code: map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, size = ~pressure) %>% layer_points()

###4 Essential Components Of A Graph
faithful %>%
  ggvis(~waiting, ~eruptions, fill := "red") %>%
  layer_points() %>%
  add_axis("y", title = "Duration of eruption (m)",
           values = c(2, 3, 4, 5), subdivide = 9) %>%
  add_axis("x", title = "Time since previous eruption (m)")

