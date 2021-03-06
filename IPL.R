

# Importing Data Scource for IPL Data Analysis

getwd()
setwd("/Users/abcd/Desktop/DexLab Analytics/R/Hackethon")

my_data <- readxl("iplallseasons_refined_R.xlsx")


## Reading the excel file 

library(readxl)

my_data<- read_excel("iplallseasons_refined_R.xlsx")
my_data          

my_data<- data.frame(my_data)
View(my_data)



# Splitting the column Match Date

library(tidyr)
my_data<- separate(my_data,col = Match_date,into = c("Month_Date","Year"),sep = ",")

my_data<- separate(my_data,col = Month_Date,into = c("Month","Date"),sep = " ")
View(my_data)


# Converting 3 digit month into number and adding that column in data frame again 


Month_ID<- match(my_data$Month,month.abb)

my_data<- data.frame(Month_ID,my_data)
View(my_data)

# converting 3 new columns into date format 

Match_Date <- paste(my_data$Year,my_data$Month_ID,my_data$Date,sep = "-")

as.Date(Match_Date)
View(datex)

my_data<- data.frame(Match_Date,my_data)


# Creating match city by splitting column match venue 

my_data<- separate(my_data,col = Match_venue,into = c("Stadium","Match City"),sep = ",")
my_data

# Separting the team one and team two score from wickets 

my_data<- separate(my_data,col = Team1_score,into = c("Team1_Score","Team1Score_wickets"),sep = "/")

my_data<- separate(my_data,col = Team2_score,into = c("Team2_Score","Team2Score_wickets"),sep = "/")


# Winning_margin separation by if winning by wickets or won by runs; by creating 2 new columns 

my_data_x <- my_data[grep("run", my_data$Winning_margin), ]
my_data_x<- separate(my_data_x,col = Winning_margin,into = c("runs/wicket","runs/wicket_desc"),sep = " ")        

my_data_y <- my_data[grep("wicket", my_data$Winning_margin), ]
my_data_y<- separate(my_data_y,col = Winning_margin,into = c("runs/wicket","runs/wicket_desc"),sep = " ")        

my_data <- rbind(my_data_x,my_data_y)

View(my_data)

# Remove unwanted columns 

my_data<- within(my_data,rm(Match_Date.1))
my_data

#Done with the clean data which is ready for visialization 



