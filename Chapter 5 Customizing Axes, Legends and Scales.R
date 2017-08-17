###Chapter 5 Customizing Axes, Legends, and Scales

###Axes
# Change the axes of the plot as instructed
faithful %>% 
  ggvis(~waiting, ~eruptions) %>% 
  layer_points() %>% 
  add_axis("x", 
           title = "Time since previous eruption (m)", 
           values = c(50, 60, 70, 80, 90), 
           subdivide = 9,
           orient = "top") %>%
  add_axis("y", 
           title = "Duration of eruption (m)", 
           values = c(2, 3, 4, 5), 
           subdivide = 9,
           orient = "right")

###Legends
# Add a legend to the plot below: use the correct title and orientation
faithful %>% 
  ggvis(~waiting, ~eruptions, opacity := 0.6, 
        fill = ~factor(round(eruptions))) %>% 
  layer_points() %>% 
  add_legend("fill", title = "~ duration (m)", orient = "left")

# Use add_legend() to combine the legends in the plot below. Adjust its properties as instructed.
faithful %>% 
  ggvis(~waiting, ~eruptions, opacity := 0.6, 
        fill = ~factor(round(eruptions)), shape = ~factor(round(eruptions)), 
        size = ~round(eruptions)) %>% 
  layer_points() %>% 
  add_legend(c("fill", "shape", "size"), 
             title = "~ duration (m)", values = c(2, 3, 4, 5))

###Legends (2)
# Fix the legend
faithful %>% 
  ggvis(~waiting, ~eruptions, opacity := 0.6, 
        fill = ~factor(round(eruptions)), shape = ~factor(round(eruptions)), 
        size = ~round(eruptions)) %>% 
  layer_points() %>% 
  add_legend(c("fill", "shape", "size"), 
             title = "~ duration (m)")

###Scale Types
# Add a scale_numeric() function to the code below to make the stroke color range from "darkred" to "orange".
mtcars %>% 
  ggvis(~wt, ~mpg, fill = ~disp, stroke = ~disp, strokeWidth := 2) %>%
  layer_points() %>%
  scale_numeric("fill", range = c("red", "yellow")) %>%
  scale_numeric("stroke", range = c("darkred", "orange")) 

# Change the graph below to make the fill colors range from green to beige.
mtcars %>% ggvis(~wt, ~mpg, fill = ~hp) %>%
  layer_points() %>%
  scale_numeric("fill", range = c("green", "beige"))

# Create a scale that will map factor(cyl) to a new range of colors: purple, blue, and green. 
mtcars %>% ggvis(~wt, ~mpg, fill = ~factor(cyl)) %>%
  layer_points() %>%
  scale_nominal("fill", range = c("purple", "blue", "green"))

###Adjust Any Visual Property
# Add a scale that limits the range of opacity from 0.2 to 1. 
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill = ~factor(cyl), opacity = ~hp) %>%
  layer_points() %>%
  scale_numeric("opacity", range = c(0.2, 1))

# Add a second scale that will expand the x axis to cover data values from 0 to 6.
mtcars %>% ggvis(~wt, ~mpg, fill = ~disp) %>%
  layer_points() %>%
  scale_numeric("y", domain = c(0, NA)) %>%
  scale_numeric("x", domain = c(0, 6))

###Adjust Any Visual Property (2)
# Add a second scale to set domain for x
mtcars %>% ggvis(~wt, ~mpg, fill = ~disp) %>%
  layer_points() %>%
  scale_numeric("y", domain = c(0, NA)) %>%
  scale_numeric("x", domain = c(0, 6))

###"=" Versus ":="
# Set the fill value to the color variable instead of mapping it, and see what happens
mtcars$color <- c("red", "teal", "#cccccc", "tan")
mtcars %>% ggvis(x = ~wt, y = ~mpg, fill := ~color) %>% layer_points()

