library(dplyr)

lichens <- read.csv("ChavezLichenData_19Sept2024.csv")
names(lichens) <- c("point_id", "site", "date", "plant_sp", "dbh", "lich_0N", "lich_50N",   
                    "lich_100N", "lich_150N", "lich_0S", "lich_50S", "lich_100S", "lich_150S", "north",        
                    "south", "all", "lich1", "lich2", "lich3", "lich4", "lich5",        
                    "lich6", "lich7", "nogenera", "comments")
names(lichens)

lichens <- dplyr::select(lichens, -comments, -lich7)
names(lichens)

View(lichens)
