---
title: "README"
author: "Hrishikesh Kulkarni"
date: "September 26, 2015"
output: html_document
---

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The dataset consists of information on activities performed by 30 volunteer. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Steps followed in the project:

Step1: Installing the required packages. "plyr" and "reshape2".

Step2: Downloading all the text files, training and the test dataset, featues.txt and activities.txt.

Step3: Combining the training and the test dataset into one file.

Step4: Combining the training and test subjects in the single file "subject"

Step5: Downloading the "features.txt" file

Step6: Selecting only the columns which contain "mean" and/or "Std"

Step7: Creating the labels with descriptive variable names

Step8: Downloading the activity dataset

Step9: Replacing the activity code in y_data with the activity labels in activity_labels.txt

Step10: Labelling the variable in "y_data" dataset as "activity"

Step11: Labelling the variable in "subject_data" dataset as "subject"

Step12: merging the datasets "subject_data", "y_data", "x_data"

Step13: To calculate the averages for each subject for each activity, we collapse the dataset using function "melt"

Step14: Calculating mean using the function "decast" and storing in the dataset "all_data_mean"

Step15: Creating a text file using "write.table" with tidy data created in steps above.
