## ----setup, include=FALSE-----------------------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)


## -----------------------------------------------------------------------------------------------------------
library(tidyverse)


## ---- message = FALSE---------------------------------------------------------------------------------------
chicks <- datasets::ChickWeight


## -----------------------------------------------------------------------------------------------------------
chicks_wide <- chicks %>% pivot_wider(names_from = Time, values_from = weight)
chicks_wide


## -----------------------------------------------------------------------------------------------------------
chicks_wide <- chicks_wide %>% filter(`0` <= 40 & `21` >= 200)
chicks_wide


## -----------------------------------------------------------------------------------------------------------
chicks_wide <- chicks_wide %>% select(Chick, Diet, `0`, `21`)
chicks_wide


## -----------------------------------------------------------------------------------------------------------
chicks_wide %>% pivot_longer(c(`0`, `21`), names_to = "Time", values_to = "weight")

