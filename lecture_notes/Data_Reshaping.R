## ---- echo = FALSE, include=FALSE---------------------------------------------------------------------------
library(knitr)
library(readr)
opts_chunk$set(comment = "")
library(tidyverse)


## ---- fig.alt="A gif visualization of data going from wide to long form.", out.width = "40%", echo = FALSE, align = "center"----
knitr::include_graphics("media/Reshape_pivot_animated.gif")


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_wide <- tibble(State = "Alabama",
                 June_vacc_rate = 0.516,
                 May_vacc_rate = 0.514,
                 April_vacc_rate = 0.511
                     )
ex_long <- pivot_longer(ex_wide, cols = !State)


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_wide


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_long


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_wide <- tibble(State = c("Alabama", "Alaska"),
                 June_vacc_rate = c(0.516, 0.627),
                 May_vacc_rate = c(0.514, 0.626),
                 April_vacc_rate = c(0.511, 0.623)
                     )
ex_long <- pivot_longer(ex_wide, cols = !State)


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_wide


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_long


## ---- fig.alt="Wide versus long data rearanges the position of column names and row content.", out.width = "60%", echo = FALSE, fig.align='center'----
knitr::include_graphics("media/Reshape_pivot.jpg")


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_wide


## ---- echo = FALSE------------------------------------------------------------------------------------------
ex_long


## ---- eval=FALSE--------------------------------------------------------------------------------------------
{long_data} <- {wide_data} %>% pivot_longer(cols = {columns to pivot})


## ---- echo = FALSE------------------------------------------------------------------------------------------
wide_data <- tibble(
  June_vacc_rate = 0.516,
  May_vacc_rate = 0.514,
  April_vacc_rate = 0.511
)


## -----------------------------------------------------------------------------------------------------------
wide_data
long_data <- wide_data %>% pivot_longer(cols = everything())
long_data


## ---- eval=FALSE--------------------------------------------------------------------------------------------
{long_data} <- {wide_data} %>% pivot_longer(cols = {columns to pivot},
                                        names_to = {New column name: contains old column names},
                                        values_to = {New column name: contains cell values})


## ---- echo = FALSE------------------------------------------------------------------------------------------
wide_data <- tibble(
  June_vacc_rate = 0.516,
  May_vacc_rate = 0.514,
  April_vacc_rate = 0.511
)


## -----------------------------------------------------------------------------------------------------------
wide_data
long_data <- wide_data %>% pivot_longer(cols = everything(),
                                        names_to = "Month",
                                        values_to = "Rate")
long_data


## ---- message = FALSE---------------------------------------------------------------------------------------
circ <- 
  read_csv("https://sisbid.github.io/Data-Wrangling/data/Charm_City_Circulator_Ridership.csv")
head(circ, 5)


## -----------------------------------------------------------------------------------------------------------
long <- circ %>% 
  pivot_longer(starts_with(c("orange","purple","green","banner")))
long


## -----------------------------------------------------------------------------------------------------------
long <- circ %>% 
  pivot_longer( !c(day, date, daily))
long


## -----------------------------------------------------------------------------------------------------------
long <- long %>% mutate(
  name = str_replace(name, "Board", "_Board"),
  name = str_replace(name, "Alight", "_Alight"),
  name = str_replace(name, "Average", "_Average") 
)
long


## -----------------------------------------------------------------------------------------------------------
long <- long %>% 
  separate(name, into = c("line", "type"), sep = "_")
long


## ---- eval=FALSE--------------------------------------------------------------------------------------------
{wide_data} <- {long_data} %>% 
  pivot_wider(names_from = {Old column name: contains new column names},
              values_from = {Old column name: contains new cell values})


## -----------------------------------------------------------------------------------------------------------
long_data
wide_data <- long_data %>% pivot_wider(names_from = "Month", 
                                       values_from = "Rate") 
wide_data


## -----------------------------------------------------------------------------------------------------------
long


## -----------------------------------------------------------------------------------------------------------
wide <- long %>% pivot_wider(names_from = "type", 
                             values_from = "value") 
wide


## -----------------------------------------------------------------------------------------------------------
air <- datasets::airquality %>% select(Temp, Month, Day)
air


## -----------------------------------------------------------------------------------------------------------
air %>% pivot_wider(names_from = "Month", 
                    values_from = "Temp") 


## -----------------------------------------------------------------------------------------------------------
air %>% pivot_wider(names_from = "Month", 
                    values_from = "Temp",
                    names_prefix = "Month_") 

