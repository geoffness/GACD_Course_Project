# Getting and Cleaning Data Course Project
## CodeBook
This code book details the raw data used from the [UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) and the transformations applied to create the 'UCI_HAR_Means.txt' output data set.

### Raw Data
The 'test' and 'train' data sets each contain a 561 feature vector for each observation. Grep was used to select only the mean and standard deviation measurements from the feature list, resulting in the following list of 88 features:  
'-XYZ' is used to denote 3 features for the 3-axial signals in the X, Y and Z directions.  
* subject  
* activity  
* tBodyAccmean-XYZ  
* tBodyAccstd-XYZ  
* tGravityAccmean-XYZ  
* tGravityAccstd-XYZ  
* tBodyAccJerkmean-XYZ  
* tBodyAccJerkstd-XYZ  
* tBodyGyromean-XYZ  
* tBodyGyrostd-XYZ  
* tBodyGyroJerkmean-XYZ  
* tBodyGyroJerkstd-XYZ  
* tBodyAccMagmean  
* tBodyAccMagstd  
* tGravityAccMagmean  
* tGravityAccMagstd  
* tBodyAccJerkMagmean  
* tBodyAccJerkMagstd  
* tBodyGyroMagmean  
* tBodyGyroMagstd  
* tBodyGyroJerkMagmean  
* tBodyGyroJerkMagstd  
* fBodyAccmean-XYZ  
* fBodyAccstd-XYZ  
* fBodyAccmeanFreq-XYZ  
* fBodyAccJerkmean-XYZ  
* fBodyAccJerkstd-XYZ  
* fBodyAccJerkmeanFreq-XYZ  
* fBodyGyromean-XYZ  
* fBodyGyrostd-XYZ  
* fBodyGyromeanFreq-XYZ  
* fBodyAccMagmean  
* fBodyAccMagstd  
* fBodyAccMagmeanFreq  
* fBodyBodyAccJerkMagmean  
* fBodyBodyAccJerkMagstd  
* fBodyBodyAccJerkMagmeanFreq  
* fBodyBodyGyroMagmean  
* fBodyBodyGyroMagstd  
* fBodyBodyGyroMagmeanFreq  
* fBodyBodyGyroJerkMagmean  
* fBodyBodyGyroJerkMagstd  
* fBodyBodyGyroJerkMagmeanFreq  
* angletBodyAccMeangravity  
* angletBodyAccJerkMeangravityMean  
* angletBodyGyroMeangravityMean  
* angletBodyGyroJerkMeangravityMean  
* angleXgravityMean  
* angleYgravityMean  
* angleZgravityMean  

### Transformations Applied
After reading in the data, the subject and activity vectors are converted into factors before combining these with the feature data.  
This process is performed for the test and train data sets separately before these are merged into one data set and names modified to remove dots.  
Once the feature data has been combined, the melt and dcast functions are used to calculate the mean of each feature for each unique subject and activity pair.  
The resulting tidy data set is then output to the 'UCI_HAR_Means.txt' text file. This data contains the 'subject' and 'activity' fields together with the mean of each of the features in the list above.