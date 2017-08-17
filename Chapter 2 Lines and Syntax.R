###Chapter 2 Lines And Syntax

###Three Operators: %>%, = And :=
# Rewrite the code with the pipe operator     
faithful %>% 
  ggvis(~waiting, ~eruptions) %>% 
  layer_points()

# Modify this graph to map the size property to the pressure variable
pressure %>% ggvis(~temperature, ~pressure, size = ~pressure) %>% layer_points()

# Modify this graph by setting the size property
pressure %>% ggvis(~temperature, ~pressure, size := 100) %>% layer_points()

# Fix this code to set the fill property to red
pressure %>% ggvis(~temperature, ~pressure, fill := "red") %>% layer_points()

###Referring To Different Objects
red <- "green"
pressure$red <- pressure$temperature

# GRAPH A
pressure %>%
  ggvis(~temperature, ~pressure,
        fill = ~red) %>%
  layer_points()

# GRAPH B
pressure %>%
  ggvis(~temperature, ~pressure,
        fill = "red") %>%
  layer_points()

# GRAPH C
pressure %>%
  ggvis(~temperature, ~pressure,
        fill := red) %>%
  layer_points()

###Referring To Diffeent Objects (2)
red <- "green"
pressure$red <- pressure$temperature

# GRAPH A
pressure %>%
  ggvis(~temperature, ~pressure,
        fill = ~red) %>%
  layer_points()

# GRAPH B
pressure %>%
  ggvis(~temperature, ~pressure,
        fill = "red") %>%
  layer_points()

# GRAPH C
pressure %>%
  ggvis(~temperature, ~pressure,
        fill := red) %>%
  layer_points()

###Properties For Points
# Add code
faithful %>% 
  ggvis(~waiting, ~eruptions, 
        size = ~eruptions, opacity := 0.5, 
        fill := "blue", stroke := "black") %>% 
  layer_points()

# Add code
faithful %>% 
  ggvis(~waiting, ~eruptions, 
        fillOpacity = ~eruptions, size := 100,  
        fill := "red", stroke := "red", shape := "cross") %>% 
  layer_points()

###Properties For Lines
# Update the code
pressure %>% 
  ggvis(~temperature, ~pressure, 
        stroke := "red", strokeWidth := 2, strokeDash := 6) %>% 
  layer_lines()

###Path Marks And Polygons
# Update the plot
# Texas available in Data Camp workspace
# See Texas.png for the resulting plot
texas %>% ggvis(~long, ~lat, fill := "darkorange") %>% layer_paths()

###Display Model Fits
# Compute the x and y coordinates for a loess smooth line that predicts mpg with the wt
mtcars %>% compute_smooth(mpg ~ wt)

###compute_smooth() To Simplify Model Fits
# Use 'ggvis()' and 'layer_lines()' to plot the results of compute smooth
mtcars %>% compute_smooth(mpg ~ wt) %>% ggvis(~pred_, ~resp_) %>% layer_lines()

# Recreate the graph you coded above with 'ggvis()' and 'layer_smooths()' 
mtcars %>% ggvis(~wt, ~mpg) %>% layer_smooths()

# Extend the code for the second plot and add 'layer_points()' to the graph
mtcars %>% ggvis(~wt, ~mpg) %>% layer_points() %>% layer_smooths()

