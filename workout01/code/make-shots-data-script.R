#title: "make-shots-data-script.R"
#description: "This script is about creating a csv and txt data file."
#input: stephen-curry.csv, andre-iguodala.csv, draymond-green.csv, kevin-durant.csv
#klay-thompson.csv
#output: stephen-curry-summary.txt, andre-iguodala-summary.txt,
#draymond-green-summary.txt, kevin-durant-summary-txt,
#klay-thompson-summary.txt

library(dplyr)

#importing files
curry <- read.csv("../imirenee/Desktop/workout01/data/stephen-curry.csv", stringsAsFactors = FALSE)
andre <- read.csv("../imirenee/Desktop/workout01/data/andre-iguodala.csv",stringsAsFactors = FALSE)
draymond <- read.csv("../imirenee/Desktop/workout01/data/draymond-green.csv",stringsAsFactors = FALSE)
kevin <- read.csv("../imirenee/Desktop/workout01/data/kevin-durant.csv",stringsAsFactors = FALSE)
klay <- read.csv("../imirenee/Desktop/workout01/data/klay-thompson.csv",stringsAsFactors = FALSE)

#add a column name to each imported data frame
curry$name <- "Stephen Curry"
andre$name <- "Andre Iguodala"
draymond$name <- "Draymond Green"
kevin$name <- "Kevin Durant"
klay$name <- "Klay Thompson"

#change the original value of shot_made_flag to more descriptive values
curry$shot_made_flag[curry$shot_made_flag == "n"] <- "shot_no"
curry$shot_made_flag[curry$shot_made_flag == "y"] <- "shot_yes"
andre$shot_made_flag[andre$shot_made_flag == "n"] <- "shot_no"
andre$shot_made_flag[andre$shot_made_flag == "y"] <- "shot_yes"
draymond$shot_made_flag[draymond$shot_made_flag == "n"] <- "shot_no"
draymond$shot_made_flag[draymond$shot_made_flag == "y"] <- "shot_yes"
kevin$shot_made_flag[kevin$shot_made_flag == "n"] <- "shot_no"
kevin$shot_made_flag[kevin$shot_made_flag == "y"] <- "shot_yes"
klay$shot_made_flag[klay$shot_made_flag == "n"] <- "shot_no"
klay$shot_made_flag[klay$shot_made_flag == "y"] <- "shot_yes"

# add a column minute 
curry <- mutate(curry, minute = period*4 - minutes_remaining)
andre <- mutate(andre, minute = period*4 - minutes_remaining)
draymond <- mutate(draymond, minute = period*4 - minutes_remaining)
kevin <- mutate(kevin, minute = period*4 - minutes_remaining)
klay <- mutate(klay, minute = period*4 - minutes_remaining)

# sent the output of each data frame into individual text files
# stephen curry summary
sink(file = "../imirenee/Desktop/workout01/output/stephen-curry-summary.txt")
summary(curry)
sink()
# Andre Iguodala summary
sink(file = "../imirenee/Desktop/workout01/output/andre-iguodala-summary.txt")
summary(andre)
sink()
# Graymond Green summary
sink(file = "../imirenee/Desktop/workout01/output/draymond-green-summary.txt")
summary(draymond)
sink()
#Kevin Durant summary
sink(file = "../imirenee/Desktop/workout01/output/kevin-durant-summary.txt")
summary(kevin)
sink()
#Klay Thompson summary
sink(file = "../imirenee/Desktop/workout01/output/klay-thompson-summary.txt")
summary(klay)
sink()

# combine all the data frame
NBA <- rbind(curry,kevin,andre,draymond,klay)

# write an assembled table as csv 
write.csv(
  x = NBA,
  file = "../imirenee/Desktop/workout01/data/shots-data.csv"
)

# use sink() to send the summary() output of the assembled table
sink(file = "../imirenee/Desktop/hw-stat133/workout01/output/shots-data-summary.txt")
summary(NBA)
sink()

