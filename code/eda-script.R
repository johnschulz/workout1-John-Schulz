# ===================================================================
# Title: Workout 1
# Description: This script is for workout 1 in Stat133.
# Input(s): We will be doing work with csv files we created in our terminal. 
# THese files have detail information on storms from the years 2010-2015.
# Output(s): Summary data files, and plots
# Author(s): John Schulz
# Date: 10-18-2019
# ===================================================================

# packages
library(dplyr)  
library(ggplot2)  
library(readr)
library(maps)
library(lubridate)
rm(list=ls())
setwd("desktop/workout1")
getwd()
types =  list(serial_num = col_character(), season = col_integer(), num = col_character(), basin = col_factor(), sub_basin = col_character(), name = col_character(), iso_time = col_character(), nature = col_character(), latitude = col_number(), longitude = col_number(), wind = col_number(), press = col_number())
names = c("serial_num", "season", "num", "basin", "sub_basin", "name", "iso_time", "nature", "latitude", "longitude", "wind", "press")


dat <- read_csv(file = "data/ibtracs-2010-2015.csv", skip=1, col_names = names, col_types = types, na = c(-999.0, "-1.0", "0.0"))
sink(file = "output/data-summary.txt")
summary(dat)
sink()


png(filename = "images/map-all-storms.png")
map()
points(dat$longitude, dat$latitude, col = "red", cex = .1)
dev.off()

pdf(file = "images/map-all-storms.pdf")
map()
points(dat$longitude, dat$latitude, col = "red", cex = .1) 
dev.off()


png(filename = "images/map-ep-na-storms-by-year.png")
epnaStorms = dat[(dat$basin == "EP" | dat$basin == "NA"), 0:length(names)]
ggplot(epnaStorms, aes(x = wind, y = press, col = nature)) + 
  scale_color_manual(labels = c("Disturbance", "Extratropical", "Conflicting Reports", "Not Reported", "Sub tropical","Tropical Storm"), values = c("purple", "blue","green", "red","orange","yellow")) +
  geom_point(size = 2, aes(shape = basin)) + scale_shape_manual(labels = c("Eastern Pacific", "North Atlantic"), values = c("circle", "triangle")) +
  facet_grid(~ season)
dev.off()

pdf(file = "images/map-ep-na-storms-by-year.pdf")
epnaStorms = dat[(dat$basin == "EP" | dat$basin == "NA"), 0:length(names)]
ggplot(epnaStorms, aes(x = wind, y = press, col = nature)) + 
  scale_color_manual(labels = c("Disturbance", "Extratropical", "Conflicting Reports", "Not Reported", "Sub tropical","Tropical Storm"), values = c("purple", "blue","green", "red","orange","yellow")) +
  geom_point(size = 2, aes(shape = basin)) + scale_shape_manual(labels = c("Eastern Pacific", "North Atlantic"), values = c("circle", "triangle")) +
  facet_grid(~ season)
dev.off()




epnaTime = mdy_hm(epnaStorms$iso_time)
epnaStorms["month"] = month(epnaTime)

pdf(file = "images/map-ep-na-storms-by-month.pdf")
ggplot(epnaStorms, aes(x = wind, y = press, col = nature)) + 
  scale_color_manual(labels = c("Disturbance", "Extratropical", "Conflicting Reports", "Not Reported", "Sub tropical","Tropical Storm"), values = c("purple", "blue","green", "red","orange","yellow")) +
  geom_point(size = 1.5, aes(shape = basin)) + scale_shape_manual(labels = c("Eastern Pacific", "North Atlantic"), values = c("circle", "triangle")) +
  facet_grid(~ month)
dev.off()

png(filename = "images/map-ep-na-storms-by-month.png")
ggplot(epnaStorms, aes(x = wind, y = press, col = nature)) + 
  scale_color_manual(labels = c("Disturbance", "Extratropical", "Conflicting Reports", "Not Reported", "Sub tropical","Tropical Storm"), values = c("purple", "blue","green", "red","orange","yellow")) +
  geom_point(size = 1.5, aes(shape = basin)) + scale_shape_manual(labels = c("Eastern Pacific", "North Atlantic"), values = c("circle", "triangle")) +
  facet_grid(~ month)
dev.off()


