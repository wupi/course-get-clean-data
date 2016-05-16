#get data clean - project

library(plyr)
library(dplyr)

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

#extract columns needed and update column names
clean_data <- cbind(combined_data[,1:2], combined_data[,feature_index+2])
names(clean_data) <- c() feature_need[,2]