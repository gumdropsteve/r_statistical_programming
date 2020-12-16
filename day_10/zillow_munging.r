library(tidyverse)

# only properties 2016 csv with column names
link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_0.csv'
p_16_00 <- read.csv(link)
p_16_00 <- as_tibble(p_16_00)
p_16_00

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_1.csv'
p_16_01 <- read.csv(link)  # does not have column names
# search: https://www.google.com/search?q=change+column+names+in+r&oq=change+column+names+in+r&aqs=chrome..69i57j0j0i457j0l5.3632j0j4&sourceid=chrome&ie=UTF-8
# solution: https://www.r-bloggers.com/2019/10/rename-columns-r
colnames(p_16_01) <- colnames(p_16_00)  # add column names, copy from part_0
p_16_01 <- as_tibble(p_16_01)
p_16_01

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_2.csv'
p_16_02 <- read.csv(link)
colnames(p_16_02) <- colnames(p_16_00)
p_16_02 <- as_tibble(p_16_02)
p_16_02

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_3.csv'
p_16_03 <- read.csv(link)
colnames(p_16_03) <- colnames(p_16_00)
p_16_03 <- as_tibble(p_16_03)
p_16_03

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/train_2016_v2.csv'
t_16 <- read.csv(link)
t_16 <- as_tibble(t_16)
t_16

# search: https://www.google.com/search?q=concat+dataframes+in+r&oq=concat+dataframes+in+r&aqs=chrome..69i57j0i22i30j0i10i22i30l2j0i22i30l3.37689j0j4&sourceid=chrome&ie=UTF-8
# solution: https://stackoverflow.com/questions/8169323/r-concatenate-two-dataframes
p_16 <- bind_rows(p_16_00, p_16_01, p_16_02, p_16_03)
p_16

inner_join(select(t_16, transactiondate, parcelid), p_16, by='parcelid')
