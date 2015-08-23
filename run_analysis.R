##################################################################################
# run_analysis.R
# Combines and reshapes the UCI HAR test and train data sets to create a set of
# means of mean/std variables per subject/activity pair
##################################################################################

# require the reshape2 package for later on
library(reshape2)

# sets up locations of text files
featureTxt <- "./UCI HAR Dataset/features.txt"
actLabelTxt <- "./UCI HAR Dataset/activity_labels.txt"
testTxt <- "./UCI HAR Dataset/test/X_test.txt"
testActTxt <- "./UCI HAR Dataset/test/y_test.txt"
testSubjectTxt <- "./UCI HAR Dataset/test/subject_test.txt"
trainTxt <- "./UCI HAR Dataset/train/X_train.txt"
trainActTxt <- "./UCI HAR Dataset/train/y_train.txt"
trainSubjectTxt <- "./UCI HAR Dataset/train/subject_train.txt"

# read required datasets for activities and subjects
features <- read.table(featureTxt)
actLabels <- read.table(actLabelTxt)
testActivities <- read.table(testActTxt)
testActivities$V1 <- factor(testActivities$V1,
                            levels=actLabels$V1,labels=actLabels$V2)
testSubjects <- read.table(testSubjectTxt,col.names = "subject")
trainActivities <- read.table(trainActTxt)
trainActivities$V1 <- factor(trainActivities$V1,
                             levels=actLabels$V1,labels=actLabels$V2)
trainSubjects <- read.table(trainSubjectTxt,col.names = "subject")

# read in feature data
restrict <- grep("[Mm]ean|[Ss]td",features$V2)
testFeatures <- read.table(testTxt,col.names = features$V2)[,restrict]
trainFeatures <- read.table(trainTxt, col.names = features$V2)[,restrict]

# combine to total dataset and remove dots from names
testData <- cbind("subject"=as.factor(testSubjects$subject),
                  "activity"=testActivities$V1,testFeatures)
trainData <- cbind("subject"=as.factor(trainSubjects$subject),
                   "activity"=trainActivities$V1,trainFeatures)
allData <- rbind(testData,trainData)
names(allData) <- tolower(gsub("\\.+","",names(allData)))

# reshape to create means per subject/activity combination and output
moltenData <- melt(allData, id=c("subject","activity"), na.rm = TRUE)
recastData <- dcast(moltenData, 
                    formula = subject + activity ~ variable, mean)
write.table(recastData, "UCI_HAR_Means.txt",row.names = FALSE)
