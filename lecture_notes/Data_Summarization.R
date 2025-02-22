## ----echo = FALSE, message=FALSE, error = FALSE--------------------------------------------
library(knitr)
opts_chunk$set(comment = "", message = FALSE)
suppressWarnings({library(dplyr)})
library(readr)
library(tidyverse)


## ------------------------------------------------------------------------------------------
x <- c(1, 5, 7, 4, 2, 8)
mean(x)


## ------------------------------------------------------------------------------------------
mtcars %>% pull(hp) %>% mean()


## ------------------------------------------------------------------------------------------
yts <- 
  read_csv("https://sisbid.github.io/Data-Wrangling/data/Youth_Tobacco_Survey_YTS_Data.csv")
head(yts)


## ----message = FALSE-----------------------------------------------------------------------
locations <- yts %>% pull(LocationDesc)
locations


## ------------------------------------------------------------------------------------------
sum(is.na(locations))


## ----message = FALSE-----------------------------------------------------------------------
yts %>% count(LocationDesc)


## ----message = FALSE-----------------------------------------------------------------------
yts %>% count(LocationDesc, TopicDesc)


## ----message = FALSE-----------------------------------------------------------------------
yts %>% count(LocationDesc, sort = TRUE)


## ----message = FALSE-----------------------------------------------------------------------
# Add up "Data_Value" for each LocationDesc category
yts %>% count(LocationDesc, wt = Data_Value)


## ------------------------------------------------------------------------------------------
# Regular data
yts


## ------------------------------------------------------------------------------------------
yts_grouped <- yts %>% group_by(Response)
yts_grouped


## ------------------------------------------------------------------------------------------
yts %>% 
  summarize(mean_value = mean(Data_Value, na.rm = TRUE))


## ------------------------------------------------------------------------------------------
yts_grouped %>% 
  summarize(mean_value = mean(Data_Value, na.rm = TRUE))


## ------------------------------------------------------------------------------------------
yts %>%
  group_by(Response) %>%
  summarize(mean_value = mean(Data_Value, na.rm = TRUE),
            max_value = max(Data_Value, na.rm = TRUE))


## ------------------------------------------------------------------------------------------
yts_year <- yts %>%
  group_by(YEAR) %>%
  mutate(year_avg = mean(Data_Value, na.rm = TRUE)) %>%
  select(LocationDesc, Data_Value, year_avg)


## ------------------------------------------------------------------------------------------
yts_year %>% mutate(Diff = Data_Value - year_avg)


## ------------------------------------------------------------------------------------------
yts %>%
  group_by(YEAR) %>%
  summarize(n = n(),
            mean = mean(Data_Value, na.rm = TRUE))


## ------------------------------------------------------------------------------------------
yts %>%
  group_by(YEAR) %>%
  summarize(across( 
    c(Data_Value, Data_Value_Std_Err, Sample_Size), 
    ~ mean(.x, na.rm = TRUE)
  ))


## ------------------------------------------------------------------------------------------
is.numeric(1)


## ------------------------------------------------------------------------------------------
yts %>% 
  summarize(across( where(is.numeric), ~ mean(.x, na.rm = TRUE)))


## ------------------------------------------------------------------------------------------
yts %>% count(Education)


## ------------------------------------------------------------------------------------------
yts %>%
  mutate(Education = factor(
    Education, 
    levels = c("Middle School", "High School")
  )) %>% 
  count(Education)


## ------------------------------------------------------------------------------------------
summary(yts)

