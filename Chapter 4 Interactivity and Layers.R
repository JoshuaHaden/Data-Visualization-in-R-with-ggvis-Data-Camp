###Chapter 4 Interactivity And Layers

###The Basics Of Interactive Plots
# Adapt the code: set fill with a select box
faithful %>% 
  ggvis(~waiting, ~eruptions, fillOpacity := 0.5, 
        shape := input_select(label = "Choose shape:", 
                              choices = c("circle", "square", "cross", 
                                          "diamond", "triangle-up", "triangle-down")), 
        fill := input_select(label = "Choose color:", 
                             choices = c("black", "red", "blue", "green"))) %>% 
  layer_points()

# Add radio buttons to control the fill of the plot
mtcars %>% 
  ggvis(~mpg, ~wt, 
        fill := input_radiobuttons(label = "Choose color:", 
                                   choices = c("black", "red", "blue", "green"))) %>% 
  layer_points()

###Input Widgets In More Detail
# Change the radiobuttons widget to a text widget 
mtcars %>% 
  ggvis(~mpg, ~wt, 
        fill := input_text(label = "Choose color:", 
                           value = "black")) %>% 
  layer_points()

# Map the fill property to a select box that returns variable names
mtcars %>% 
  ggvis(~mpg, ~wt, 
        fill = input_select(label = "Choose fill variable:", 
                            choices = names(mtcars), map = as.name)) %>% 
  layer_points()

###Input Widgets In More Detail (2)
# Map the fill property to a select box that returns variable names
mtcars %>% 
  ggvis(~mpg, ~wt, 
        fill = input_select(label = "Choose fill variable:", 
                            choices = names(mtcars), map = as.name)) %>% 
  layer_points()

###Control Parameters And Values
# Map the bindwidth to a numeric field ("Choose a binwidth:")
mtcars %>% 
  ggvis(~mpg) %>% 
  layer_histograms(width = input_numeric(label = "Choose a binwidth:", value = 1))

# Map the binwidth to a slider bar ("Choose a binwidth:")
mtcars %>% 
  ggvis(~mpg) %>% 
  layer_histograms(width = input_slider(label = "Choose a binwidth:", min = 1, max = 20))

###Multi-Layered Plots And Their Properties
# Add a layer of points to the graph below.
pressure %>% 
  ggvis(~temperature, ~pressure, stroke := "skyblue") %>% 
  layer_lines() %>%
  layer_points()

# Adapt the solution to the first instruction below so that only the lines layer uses a skyblue stroke.
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_lines(stroke := "skyblue") %>% 
  layer_points()

# Rewrite the code below so that only the points layer uses the shape property.
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_lines(stroke := "skyblue") %>% 
  layer_points(shape := "triangle-up")

# Refactor the code for the graph below to make it as concise as possible
pressure %>% 
  ggvis(~temperature, ~pressure, stroke := "skyblue", 
        strokeOpacity := 0.5, strokeWidth := 5) %>% 
  layer_lines() %>% 
  layer_points(fill = ~temperature, shape := "triangle-up", size := 300)

###Multi-Layered Plots And Their Properties (2)
# Rewrite the code below so that only the points layer uses the shape property.
pressure %>% 
  ggvis(~temperature, ~pressure) %>% 
  layer_lines(stroke := "skyblue") %>% 
  layer_points(shape := "triangle-up")

# Refactor the code for the graph below to make it as concise as possible
pressure %>% 
  ggvis(~temperature, ~pressure, stroke := "skyblue", 
        strokeOpacity := 0.5, strokeWidth := 5) %>% 
  layer_lines() %>% 
  layer_points(fill = ~temperature, shape := "triangle-up", size := 300)

###There Is No Limit On The Number Of Layers
# Create a graph containing a scatterplot, a linear model and a smooth line.
pressure %>% 
  ggvis(~temperature, ~pressure) %>%
  layer_lines(opacity := 0.5) %>%
  layer_points() %>%
  layer_model_predictions(model = "lm", stroke := "navy") %>%
  layer_smooths(stroke := "skyblue")


