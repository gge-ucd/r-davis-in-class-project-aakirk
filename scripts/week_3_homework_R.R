surveys <- read.csv("data/portal_data_joined.csv") #reading the data in 

colnames(surveys) #a list of the column names 

select(.data = species_id, weight, plot_type)

surveys_new <- surveys[1:60, c(6, 9, 13)] #selecting rows 1:60 and 
#just columns 6, 9, and 13

surveys_new$species_id <- as.character(surveys_new$species_id)

surveys_new$plot_type <- as.character(surveys_new$plot_type)
