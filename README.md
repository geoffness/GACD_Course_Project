# Getting and Cleaning Data Course Project
## Readme
This is a repository containing code used to analyse data from the [UCI Human Activity Recognition using smartphones data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for the [Getting and Cleaning Data](https://www.coursera.org/course/getdata) course project.

The code assumes the [UCI HAR dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) zip archive has been downloaded and extracted to the working directory.

### Files
* run_analysis.R - R script to read the UCI HAR data, combine test and train data sets, and reshape to calculate means of mean and std variables per subject/activity combination. 
* CodeBook.md - markdown file detailing the variables, data and reshaping process.

### Process
* Set the working directory to the folder containing the 'UCI HAR Dataset' folder.
* Run the script run_analysis.R, this will create a text file 'UCI_HAR_Means.txt' in the working directory.