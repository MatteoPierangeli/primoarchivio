
library(tidyverse)
library(readr)
library(lubridate)
library(dplyr)
library(tibble)
library(scales)
library(qpcR)
library(stringr)
library(data.table)
library(ggplot2)
dataset<-read.csv("C:/Users/acer/OneDrive/Desktop/data analysis/Sightings/scrubbed.csv")
View(dataset)
dataset$city<-str_squish(str_trim(dataset$city,side="both"))
dataset$state<-str_squish(str_trim(dataset$state,side="both"))
dataset$country<-str_squish(str_trim(dataset$country,side="both"))
View(dataset)
datetime_na<-sum(is.na(dataset$datetime))

city_na<-sum(is.na(dataset$city))
state_na<-sum(is.na(dataset$state))
country_na<-sum(is.na(dataset$country))
shape_na<-sum(is.na(dataset$shape))
duration..seconds._na<-sum(is.na(dataset$duration..seconds.))
duration..hours.min._na<-sum(is.na(dataset$duration..hours.min.))
date.posted_na<-sum(is.na(dataset$date.posted))
latitude_na<-sum(is.na(dataset$latitude))
longitude_na<-sum(is.na(dataset$longitude))
all_na <- cbind(datetime_na,city_na,state_na,country_na,shape_na,duration..seconds._na,duration..hours.min._na,date.posted_na,latitude_na,longitude_na)
View(all_na)
print(state_na)
dataset[dataset==""] <- NA
View(dataset)
dataset%>% filter(is.na(country))%>%arrange(country)%>% View()
canada_na <- dataset %>% 
  filter(str_detect(city,"canada") & is.na(country))
View(canada_na)
canada_na_table <- data.frame(table(canada_na$city))
View (canada_na_table)
canada_na_table %>% 
  arrange (-Freq) %>%
  rename(city = Var1, count = Freq) %>%
  slice_max(count, n = 10)
dataset1 <- dataset %>% 
  mutate(country = ifelse(city %like% "canada" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ca", country))
View(dataset1)

country_na_updated <- sum(is.na(dataset1$country))
country_na <- sum(is.na(dataset$country))

# Create a table to compare the number of NAs

all_na_2 <- cbind(country_na, country_na_updated)

View(all_na_2)
dataset2 <- dataset1 %>% 
  mutate(country = case_when(city %like% "mexico" 
                             & !(city %like% 'new mexico') 
                             & !(city%like% 'gulf of mexico') 
                             & !(city %like% 'in flight') 
                             & is.na(country) ~ "mx"
                             , city %like% "new mexico" 
                             & !(city %like% 'in flight') 
                             & is.na(country) ~ 'us'
                             , TRUE ~ country))
dataset2 %>% 
  filter(city %like% "mexico" 
         & !(city %like% 'new mexico') 
         & !(city %like% 'gulf of mexico') 
         & !(city %like% 'in flight'))
country_na_updated_v2 <- sum(is.na(dataset2$country))
country_na <- sum(is.na(dataset2$country))

# Create a table to compare the number of NAs

all_na_3 <- cbind(country_na, country_na_updated_v2)

View(all_na_3)
View(dataset2)
dataset3 <- dataset2 %>% 
  mutate(country = ifelse(city %like% "canada" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ca", country))
View(dataset3)
dataset4 <- dataset3 %>% 
  mutate(country = ifelse(city %like% "uk/england" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "uk", country))
View(dataset4)
dataset5 <- dataset4 %>% 
  mutate(country = ifelse(city %like% "italy" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "it", country))
View(dataset5)
dataset6 <- dataset5 %>% 
  mutate(country = ifelse(city %like% "spain" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sp", country))
dataset7 <- dataset6 %>% 
  mutate(country = ifelse(city %like% "india" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "in", country))
dataset8 <- dataset7 %>% 
  mutate(country = ifelse(city %like% "netherlands" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "nd", country))
dataset9 <- dataset8 %>% 
  mutate(country = ifelse(city %like% "new zealand" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "nz", country))
dataset10 <- dataset9 %>% 
  mutate(country = ifelse(city %like% "germany" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "de", country))
dataset11 <- dataset10 %>% 
  mutate(country = ifelse(city %like% "brazil" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "br", country))
dataset12 <- dataset11 %>% 
  mutate(country = ifelse(city %like% "israel" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "is", country))
dataset13 <- dataset12 %>% 
  mutate(country = ifelse(city %like% "sweden" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sw", country))
dataset14 <- dataset13 %>% 
  mutate(country = ifelse(city %like% "norway" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "no", country))
dataset15 <- dataset14 %>% 
  mutate(country = ifelse(city %like% "france" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "fr", country))
dataset16 <- dataset15 %>% 
  mutate(country = ifelse(city %like% "portugal" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "pt", country))
dataset17 <- dataset16 %>% 
  mutate(country = ifelse(city %like% "hungary" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "hu", country))
dataset18 <- dataset17 %>% 
  mutate(country = ifelse(city %like% "belgium" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "be", country))
View(dataset18)
dataset19 <- dataset18 %>% 
  mutate(country = ifelse(city %like% "poland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "pl", country))
dataset20 <- dataset19 %>% 
  mutate(country = ifelse(city %like% "romania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ro", country))
dataset21 <- dataset20 %>% 
  mutate(country = ifelse(city %like% "finland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "fn", country))
dataset22 <- dataset21 %>% 
  mutate(country = ifelse(city %like% "switzerland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "sw", country))
View(dataset21)
dataset23 <- dataset22 %>% 
  mutate(country = ifelse(city %like% "greece" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "gr", country))
dataset24 <- dataset23 %>% 
  mutate(country = ifelse(city %like% "czech republic" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "cz", country))
dataset25 <- dataset24 %>% 
  mutate(country = ifelse(city %like% "albania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "alb", country))
dataset26 <- dataset25 %>% 
  mutate(country = ifelse(city %like% "ukraine" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ukr", country))
dataset27 <- dataset26 %>% 
  mutate(country = ifelse(city %like% "iceland" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "isl", country))
dataset28 <- dataset27 %>% 
  mutate(country = ifelse(city %like% "latvia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "lt", country))
dataset29 <- dataset28 %>% 
  mutate(country = ifelse(city %like% "estonia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "et", country))
dataset30 <- dataset29 %>% 
  mutate(country = ifelse(city %like% "lithuania" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "lit", country))
dataset31 <- dataset30 %>% 
  mutate(country = ifelse(city %like% "croatia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "cr", country))
dataset32 <- dataset31 %>% 
  mutate(country = ifelse(city %like% "bosnia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "bos", country))
dataset33 <- dataset32 %>% 
  mutate(country = ifelse(city %like% "serbia" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ser", country))
dataset34 <- dataset33 %>% 
  mutate(country = ifelse(city %like% "austria" 
                          & !(city %like% "in flight") 
                          & is.na(country)
                          , "ost", country))
View(dataset34)
us_dataset <- dataset34 %>% 
  filter(country == 'us') 
sightings_per_state <- data.frame(table(us_dataset$state))
sightings_per_state <- sightings_per_state %>% 
  mutate(percentage = Freq/sum(Freq) * 100
         , region = case_when(Var1 == 'ct'
                              | Var1 == 'me'
                              | Var1 == 'ma' 
                              | Var1 == 'nh' 
                              | Var1 == 'ri' 
                              | Var1 == 'vt' 
                              | Var1 == 'nj' 
                              | Var1 == 'ny'
                              | Var1 == 'pa' ~ 'Northeast'
                              , Var1 == 'in'
                              | Var1 == 'il'
                              | Var1 == 'mi'
                              | Var1 == 'oh'
                              | Var1 == 'wi'
                              | Var1 == 'ia'
                              | Var1 == 'ks'
                              | Var1 == 'mn'
                              | Var1 == 'mo'
                              | Var1 == 'ne'
                              | Var1 == 'nd'
                              | Var1 == 'sd' ~ 'Midwest'
                              , Var1 == 'de'
                              | Var1 == 'dc'
                              | Var1 == 'fl'
                              | Var1 == 'ga'
                              | Var1 == 'md'
                              | Var1 == 'nc'
                              | Var1 == 'sc'
                              | Var1 == 'va'
                              | Var1 == 'wv'
                              | Var1 == 'al'
                              | Var1 == 'ky'
                              | Var1 == 'ms'
                              | Var1 == 'tn'
                              | Var1 == 'ar'
                              | Var1 == 'la'
                              | Var1 == 'ok'
                              | Var1 == 'tx' ~ 'South'
                              , Var1 == 'az'
                              | Var1 == 'co'
                              | Var1 == 'id'
                              | Var1 == 'nm'
                              | Var1 == 'mt'
                              | Var1 == 'ut'
                              | Var1 == 'nv'
                              | Var1 == 'wy'
                              | Var1 == 'ak'
                              | Var1 == 'ca'
                              | Var1 == 'hi'
                              | Var1 == 'or'
                              | Var1 == 'wa' ~ 'West'
                              , TRUE ~ 'Other'
         )) %>%
  slice_max(Freq, n = 10) %>%
  rename('num_of_sightings' = Freq, 'state' = Var1)
dataset35 <- dataset34 %>% 
  mutate(country = ifelse(city %like% "switzerland" 
                          & !(city %like% "in flight") 
                          
                          , "swi", country))
View(dataset35)
View(sightings_per_state)

ue_sightings<-filter(dataset35, country %in% c("it","sp","fr",
                                               "pl","pt","ro","fn","swi","sw","gr",
                                               "alb", "ukr","isl","lt","et","lit",
                                               "cr","bos","ser","ost","hu","no",
                                               "be","uk","nd","de"))
View(ue_sightings)
sightings_per_uecountry <- data.frame(table(ue_sightings$country))
View(sightings_per_uecountry)

sightings_per_uecountry <- sightings_per_uecountry %>% 
  mutate(percentage = Freq/sum(Freq) * 100,
         region = case_when(Var1 == 'it'
                            | Var1 == 'sp'
                            | Var1 == 'pt' 
                            | Var1 == 'gr' ~ 'South_eu'
                            , Var1 == 'swi' 
                            | Var1 == 'ost' 
                            | Var1 == 'nd' 
                            | Var1 == 'be'
                            | Var1 == 'de' 
                            | Var1 == 'fr' ~ 'Center_eu'
                            , Var1 == 'hu' 
                            | Var1 == 'pl' 
                            | Var1 == 'ro'
                            | Var1 == 'alb'
                            | Var1 == 'ukr'
                            | Var1 == 'lt' 
                            | Var1 == 'et' 
                            | Var1 == 'lit' 
                            | Var1 == 'cr' 
                            | Var1 == 'bos'
                            | Var1 == 'ser'~ 'East_eu'
                            , Var1 == 'fn'
                            | Var1 == 'sw'
                            | Var1 == 'uk' 
                            | Var1 == 'no' 
                            | Var1 == "isl" ~ 'North_eu',
                            TRUE ~ 'Other'
         )) %>%
  rename('num_of_sightings' = Freq, 'state' = Var1)
View(sightings_per_uecountry)

sightings_per_ueregion <- sightings_per_uecountry %>% 
  filter(region != 'Other') %>%
  group_by(region) %>%
  summarize(sightings_count = sum(num_of_sightings)) %>%
  mutate(percentage = sightings_count/sum(sightings_count) * 100) %>%
  arrange(-percentage) 
View(sightings_per_ueregion)


datetime_v2 <- mdy_hm(ue_sightings$datetime)
ue_sightings_v2 <- cbind (ue_sightings,datetime_v2)
ue_sightings_v3 <- ue_sightings_v2 %>%
  dplyr::select(-datetime) %>%
  relocate(datetime_v2, .before=city)
View(ue_sightings_v3)
ue_monthly_sightings <- data.frame(table(month(ue_sightings_v3$datetime_v2)))
month_name <- month.abb[ue_monthly_sightings$Var1]
ue_monthly_sightings <- ue_monthly_sightings %>%
  cbind(month_name) %>%
  relocate(month_name, .after=Var1) %>%
  mutate(percentage = Freq/sum(Freq) * 100) %>%
  rename(month_number = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)
View(ue_monthly_sightings)
ue_monthly_sightings <- ue_monthly_sightings %>% 
  mutate(season = case_when(month_name == 'Dec' 
                            | month_name == 'Jan' 
                            | month_name == 'Feb' ~ "Winter"
                            , month_name == 'Mar'
                            | month_name == 'Apr'
                            | month_name == 'May' ~ "Spring"
                            , month_name == 'Jun'
                            | month_name == 'Jul'
                            | month_name == 'Aug' ~ "Summer"
                            , TRUE ~ "Fall"))
View(ue_monthly_sightings)
sighting_shape <- data.frame(table(ue_sightings_v3$shape))
View(sighting_shape)

sighting_shape <- sighting_shape %>% 
  mutate(percentage = Freq/sum(Freq) * 100) %>%
  mutate(round_type_shape = case_when(Var1 %like% 'circle' 
                                      | Var1 %like% 'ball'
                                      | Var1 %like% 'sphere'
                                      | Var1 %like% 'disk'
                                      | Var1 %like% 'oval'
                                      | Var1 %like% 'cigar'
                                      | Var1 %like% 'cylinder'
                                      | Var1 %like% 'egg'
                                      | Var1 %like% 'round'
                                      ~ TRUE
                                      , TRUE ~ FALSE)) %>%
  rename(shape = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)

View(sighting_shape)
sighting_shape %>%
  group_by(round_type_shape) %>%
  summarize(sightings_count = sum(num_of_sightings)) %>%
  mutate(percentage = sightings_count/sum(sightings_count) * 100) %>%
  arrange(percentage)

ue_yearly_sightings <- data.frame(table(as.numeric(format(ue_sightings_v3$datetime_v2,'%Y'))))
View(ue_yearly_sightings)
ue_yearly_sightings <- ue_yearly_sightings %>%
  rename(year = Var1, num_of_sightings = Freq) %>%
  arrange(-num_of_sightings)
write.csv(dataset35, "dataset35.csv")
write.csv(ue_yearly_sightings, "ue_yearly_sightings.csv")
write.csv(sighting_shape, "sightings_shape.csv")
write.csv(ue_sightings_v3, "ue_sightings_v3.csv")
write.csv(ue_monthly_sightings, "ue_monthly_sightings.csv")
write.csv(sightings_per_ueregion, "sightins_per_ueregion.csv")
write.csv(sightings_per_uecountry, "sightings_per_uecountry.csv")

ggplot(sightings_per_ueregion, aes(x = region, y = sightings_count)) +
  geom_col(aes(fill = region), width = 0.3) +
  scale_fill_manual(values = c("#234F1E", "#028A0F", "#03C04A", "#AEF539"))+
  labs(title = "Reported UFO Sightings Per U.E Region"
       , x = "Region"
       , y = "Number of Sightings")+
  guides(fill = guide_legend(title = "Region"))

ggplot(ue_yearly_sightings, aes(x = year, y = num_of_sightings, group = 1)) + 
  geom_line(color = "#03AC13") +
  geom_point(color = "#03AC13") +
  labs(title = "Reported UFO Sightings in Ue Over Time"
       , y = "Number of Sightings"
       , x = "Year") +
  annotate ("text", x=43, y=96, label = "year 2003", colour= 'black', size = 3, angle= 25)+
  scale_x_discrete(breaks = seq(1904, 2014, by = 10))
View(sighting_shape)

ggplot(sighting_shape, aes (x = reorder (shape, -num_of_sightings), y=num_of_sightings)) + 
  geom_col(aes(fill = shape), width=0.4, position = position_dodge(width=0.5)) + 
  theme(axis.text.x= element_text(angle = 90)) +
  labs(title = "Shape of UFO sightings in EU"
       , y = "Number of Sightings"
       , x = "Shape")
View (ue_monthly_sightings)
ggplot(ue_monthly_sightings, aes (x = reorder (month_name, season), y= percentage)) +
  geom_col(aes(fill = month_name)) +
  labs(title = "EU sightings per Month"
       , y = "Percentage of Sightings"
       , x = "Month") +
  guides(fill=guide_legend(title="Month"))

ggplot (ue_monthly_sightings, aes (x= reorder (season, -percentage), y = percentage)) + 
  geom_col (aes (fill = season)) +
  labs(title = "EU sightings per Season"
       , y = "Percentage of Sightings"
       , x = "Season")
ggplot (sightings_per_uecountry, aes (x = reorder (state, -percentage), y = percentage)) + 
  geom_col (aes (fill = state)) + 
  theme(axis.text.x= element_text(angle = 90)) + 
  labs(title = "EU sightings per Country"
       , y = "Percentage of Sightings"
       , x = "Country")
ggplot (sightings_per_uecountry, aes (x = reorder (region, -percentage), y = percentage)) + 
  geom_col (aes (fill = region)) + 
  theme(axis.text.x= element_text(angle = 45)) +
  labs(title = "EU sightings per Region"
       , y = "Percentage of Sightings"
       , x = "Region")
