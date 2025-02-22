## ---- include = FALSE-----------------------------------------------------------------------------------------
library(tidyverse)


## -------------------------------------------------------------------------------------------------------------
iris_lab <- iris


## -------------------------------------------------------------------------------------------------------------
iris_lab %>% 
  mutate(across(.cols = !Species, round)) %>%
  head()
# OR 
iris_lab %>% 
  mutate(across(.cols = where(is.numeric), round)) %>%
  head()


## -------------------------------------------------------------------------------------------------------------
iris_lab %>% 
  mutate(across(.cols = !Species, ~ round(.x, digits = 1))) %>%
  head()


## -------------------------------------------------------------------------------------------------------------
new_function <- function(x){(x+2)/6}
iris_lab %>% 
  mutate(across(.cols = !Species, ~ new_function(.x))) %>%
  head()


## -------------------------------------------------------------------------------------------------------------
div_function <- function(x, y){(x/y)+ 3}


## -------------------------------------------------------------------------------------------------------------
iris_lab %>%
filter(if_all(starts_with(c("Petal", "Sepal")), ~.x > 2 & .x < 6))  %>%
  head()


## -------------------------------------------------------------------------------------------------------------
format(10000, scientific = TRUE)


## -------------------------------------------------------------------------------------------------------------
iris_lab <- iris_lab %>%
  modify_if(is.numeric, ~ format(.x, scientific = TRUE))

head(iris_lab)

