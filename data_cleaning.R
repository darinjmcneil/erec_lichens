library(dplyr)

lichens <- read.csv("ChavezLichenData_19Sept2024.csv") # read in Allison's lichen data
names(lichens) <- c("point_id", "site", "date", "plant_sp", "dbh", "lich_0N", "lich_50N", # rename the columns 
                    "lich_100N", "lich_150N", "lich_0S", "lich_50S", "lich_100S", "lich_150S", "north",        
                    "south", "all", "lich1", "lich2", "lich3", "lich4", "lich5",        
                    "lich6", "lich7", "nogenera", "comments")
names(lichens) # view the names to make sure they look ok

# add row number to table
lichens$row <- 1:nrow(lichens)
lichens <- lichens[,c(26, 1:25)]

lichens <- dplyr::select(lichens, -comments, -lich7) # remove "comments" and "lich7"
names(lichens) # make sure the columns are, in fact, removed

# cleaning up point_ID
lichens$point_id
sort(unique(lichens$point_id), decreasing = FALSE)
lichens$point_id <- gsub(pattern =  " _", replacement = "_", x = lichens$point_id)

lichens$point_id <- ifelse(test = nchar(lichens$point_id) == 7, # add "00" to points 1-9
                           yes = gsub(pattern =  "_", replacement = "_00", x = lichens$point_id),
                           no = lichens$point_id)

lichens$point_id <- ifelse(test = nchar(lichens$point_id) == 8, # add "0" to points 10-99
                           yes = gsub(pattern =  "_", replacement = "_0", x = lichens$point_id),
                           no = lichens$point_id)
sort(unique(lichens$point_id), decreasing = FALSE)

# examining site name
unique(lichens$site) # honestly looks good to me

# examining date
unique(lichens$date) # honestly looks good to me; maybe we want to convert to ordinal date later

# examining plant species
unique(lichens$plant_sp)

# clean up snags first
lichens$snag <- grepl(pattern = "snag", x = lichens$plant_sp)
lichens$plant_sp <- gsub(pattern =  "_snag", replacement = "", x = lichens$plant_sp)
lichens$plant_sp <- gsub(pattern =  " snag", replacement = "", x = lichens$plant_sp)
lichens <- lichens[,c(1:5,25,6:24)]
