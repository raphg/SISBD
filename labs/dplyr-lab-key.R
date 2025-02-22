## -----------------------------------------------------------------------------
library(tidyverse)
if (!file.exists("1000genomes.xlsx")) {
  curl::curl_download("https://sisbid.github.io/Data-Wrangling/labs/1000genomes.xlsx", destfile="1000genomes.xlsx")
}


## -----------------------------------------------------------------------------
library(readxl)
library(janitor)
# Have to skip one row because there is an extra header
kg = read_excel("1000genomes.xlsx",sheet=4,skip=1)
# subset to just low coverage
kg = kg %>% select(1:7)


# make column names easier to handle
kg = kg %>% clean_names()

# alternative name cleaning code
names(kg) = map_chr(str_split(names(kg),"\\."),first) %>% tolower()


## -----------------------------------------------------------------------------
kg %>% group_by(platform_4) %>% summarize(sum(total_sequence_5))


## -----------------------------------------------------------------------------
kg %>% group_by(center_3) %>% summarize( center_total =  sum(total_sequence_5))


## -----------------------------------------------------------------------------
kg %>% filter(passed_qc_7==1)


## -----------------------------------------------------------------------------
kg %>% filter(passed_qc_7==1) %>%
  filter(center_3=="BCM")


## -----------------------------------------------------------------------------
kg %>% filter(passed_qc_7==1) %>%
  filter(center_3=="BCM") %>%
  group_by(population) %>%
  summarize(meancov = mean(aligned_non_duplicated_coverage),nsamp=n())

