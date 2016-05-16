#get data clean - project

library(plyr)
library(dplyr)
library(reshape)

#load data
#the directory may vary on differnt machine
feature <- read.table("./dataclean_w1/UCI_HAR_Dataset/features.txt")

x_train <- read.table("./dataclean_w1/UCI_HAR_Dataset/train/X_train.txt")
y_train <- read.table("./dataclean_w1/UCI_HAR_Dataset/train/Y_train.txt")
train_sub <- read.table("./dataclean_w1/UCI_HAR_Dataset/train/subject_train.txt")
x_test <- read.table("./dataclean_w1/UCI_HAR_Dataset/test/X_test.txt")
y_test <- read.table("./dataclean_w1/UCI_HAR_Dataset/test/Y_test.txt")
test_sub <- read.table("./dataclean_w1/UCI_HAR_Dataset/test/subject_test.txt")
activity <- read.table("./dataclean_w1/UCI_HAR_Dataset/activity_labels.txt")

#data combine
#column combine train and test dataset, and then merge
test_data <- cbind(test_sub, y_test, x_test)
train_data <- cbind(train_sub, y_train, x_train)
combined_data <- rbind(test_data, train_data)

#get columns which include key word "mean" or "std"
feature_index <- grep(".*mean.*|.*std.*", x = feature$V2)
feature_need <- feature[feature_index,]
feature_name <- gsub('[-()]', '', feature_need[,2]) #update column name format, or the name would be cracked

#extract columns needed and update column names
clean_data <- cbind(combined_data[,1:2], combined_data[,feature_index+2])
names(clean_data) <- c("subject", "activity", feature_name )

#calculate mean for each field, aggregated by subject and activity
clean_data_melt <- melt(clean_data, id = c("subject", "activity"))
data_avg <- cast(clean_data_melt, subject+activity ~ variable, mean)

#export result as a file
write.table(clean_data, file = "./dataclean_w1/w4project" , row.names = F)
write.table(data_avg, file = "./dataclean_w1/w4project_avg" , row.names = F)