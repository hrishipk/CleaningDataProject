#Step1: Installing packages#

install.packages("plyr")
library(plyr)
install.packages("reshape2")
library(reshape2)

#Step2: Downloading all the text files, training and the test dataset, featues.txt and activities.txt.#
x_train<- read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\X_train.txt")
y_train<- read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt")
subject_train<- read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt")
x_test<- read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\X_test.txt")
y_test<- read.table ("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt")
subject_test<-read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt")
#Step3: Combining the training and the test dataset into one file#
x_data<- rbind(x_train, x_test)
y_data<- rbind(y_train, y_test)
#Step4: Combining the training and test subjects in the single file "subject"#
subject_data<- rbind(subject_train, subject_test)
#Step5: Downloading the "features.txt" file#
features<- read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\features.txt")
#Step6: Selecting only the columns which contain "mean" and/or "Std"#
mean_std_features<- grep(".*mean.*|.*std.*", features[,2])
#Step6: Selecting only the columns which contain "mean" and/or "Std"#
x_data<-x_data[, mean_std_features]
#Step7: Creating the labels with descriptive variable names#
names(x_data)<-features[mean_std_features,2]
names(x_data)<-gsub("-mean", "-Mean", names(x_data))
names(x_data)<-gsub("-std", "-Std", names(x_data))
names(x_data)<-gsub("[()]", "", names(x_data))
#Step8: Downloading the activity dataset#
act<-read.table("D:\\Personal\\GettingCleaningData\\Project\\getdata_projectfiles_UCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt")
#Step9: Replacing the activity code in y_data with the activity labels in activity_labels.txt#
y_data[,1]<- act[y_data[,1],2]
#Step10: Labelling the variable in "y_data" dataset as "activity"#
names(y_data)<-"activity"
#Step11: Labelling the variable in "subject_data" dataset as "subject"#
names(subject_data)<-"subject"
#Step12: merging the datasets "subject_data", "y_data", "x_data"#
all_data<-cbind(subject_data, y_data, x_data)
#Step13: To calculate the averages for each subject for each activity, we collapse the dataset using function "melt"#
all_data_melted<-melt(all_data,id=c("subject", "activity"))
#Step14: Calculating mean using the function "decast" and storing in the dataset "all_data_mean"#
all_data_mean<- dcast(all_data_melted,subject+activity ~ variable ,mean)
#Step15: Creating a text file using "write.table" with tidy data created in steps above.#
write.table(all_data_mean,"D:\\Personal\\GettingCleaningData\\Project\\tidydata.txt", row.names=FALSE)
