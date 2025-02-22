## ----setup, include=FALSE-----------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## -----------------------------------------------------------------------
library(tidyverse)

circ <- read_csv("https://sisbid.github.io/Data-Wrangling/data/Charm_City_Circulator_Ridership.csv")


## ----q1-----------------------------------------------------------------
nrow(circ)
dim(circ)
circ %>% 
  nrow()


## ----q2-----------------------------------------------------------------
sum(circ$greenBoardings, na.rm = TRUE)

circ %>% pull(greenBoardings) %>% sum(na.rm = TRUE)

count(circ, wt = greenBoardings)


## ----q3-----------------------------------------------------------------
daily <- circ %>% pull(daily)
sum(is.na(daily))

# Can also
circ %>% 
  count(is.na(daily))


## ----q4-----------------------------------------------------------------
circ %>% 
  group_by(day) %>% 
  summarise(mean = mean(daily, na.rm = TRUE),
            n = n())


## ----q6-----------------------------------------------------------------
circ %>% 
  summarise(median = median(orangeBoardings, na.rm = TRUE))
# OR 
circ %>% pull(orangeBoardings) %>% median(na.rm = TRUE)


## ----q7-----------------------------------------------------------------
circ %>% 
  group_by(day) %>% 
  summarise(median = median(orangeBoardings, na.rm = TRUE))

