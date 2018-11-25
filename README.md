# Getting and Cleaning Data Project

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. 
The R script titled run_analysis will accomplish the following:
  1) Download the raw data collected by the researchers at UC Irvine
  2) Merge the training and testing data sets
  3) Extract only the measures of mean and standard deviation
  4) Label all variables appropriately
  5) Create a tidy dataset that is composed of the mean of each variable for each individual subject

## Context
One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement.
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names.
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
