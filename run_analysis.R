## Installs and loads reshape package 

install.packages("reshape")
install.packages("reshape2")
library(reshape)
library(reshape2)

## Downloads the data set

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile= "./Dataset.zip", method= "curl")

## Unzips downloaded dataset.zip -file into UCI HAR Dataset -folder

unzip("./Dataset.zip")

## Reads data

#### Reads labels and row names from activity_labels.txt and features.txt -files

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#### Reads data test set

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measures_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#### Reads train set

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measures_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Rbinds test and train datas

measures <- rbind(measures_test, measures_train)
subject <- rbind(subject_test, subject_train)
activity <- rbind(activity_test, activity_train)

## Changes matrixes to data frames

measures <- as.data.frame(measures)
subject <- as.data.frame(subject)

## Changes data frame to factor
activity <- as.factor(activity$V1)

## Applies more readable labels to activity information  
activity_labels$V2 <- gsub("_"," ",activity_labels$V2)
levels(activity) <- factor(activity_labels$V2, levels=activity_labels$V2)

### Adds column names to dataset

colnames(measures) <- as.vector(features$V2)
colnames(subject) <- "subjects" 


### Cbinds data together

data <- cbind(measures, subject, activity)

## Creates a data frame where are only variables with mean and std values

means_and_std <- features[grep("-std\\(\\)|-mean\\(\\)", tolower(features$V2)),]


## Labels subjects and activity columns
filter <- append(as.vector(means_and_std$V2), c("subjects", "activity"))

## Drops unnessesary columns

data <- data[,filter]

## Renames column names

x <- names(data)
x <- gsub("-mean\\(\\)","-mean", x)
x <- gsub("-std\\(\\)","-std", x)
x <- gsub("-","_", x)
x <- tolower(x)
names(data) <- x

## Creates a second, independent tidy data set with the average of each variable 
## for each activity and each subject. 

df <- melt(data,id=c("subjects","activity"), measure.vars=(1:66))
tidy_dataset <- dcast(df, subjects + activity ~ variable, fun.aggregate=mean)