## Packages needed

install.package(reshape)
library(reshape)

## Downloads the dataset

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile= "./Dataset.zip", method= "curl")

## Unzip dataset.zip -file

unzip("./Dataset.zip")

## Reading data

#### Reading labels and row names

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")

#### Reading test set

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
measures_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#### Reading train set

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
measures_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

## Rbinding test and train datas

measures <- rbind(measures_test, measures_train)
subject <- rbind(subject_test, subject_train)
activity <- rbind(activity_test, activity_train)

## Changing matrixes to dataframes

measures <- as.data.frame(measures)
subject <- as.data.frame(subject)

## Chancing dataframe to factor
activity <- as.factor(activity$V1)

## Changing to more readable labels, replacing number values with labels 
## ren
activity_labels$V2 <- gsub("_"," ",activity_labels$V2)
levels(activity) <- factor(activity_labels$V2, levels=activity_labels$V2)

### Adding column names to dataset

colnames(measures) <- as.vector(features$V2)
colnames(subject) <- "subjects" 


### Cbinding data together

data <- cbind(measures, subject, activity)

## Selecting only variables where are mean and std values + subject + activity
## 

means_and_std <- features[grep("-std\\(\\)|-mean\\(\\)", tolower(features$V2)),]


## Labeling subjects and activity columns
filter <- append(as.vector(means_and_std$V2), c("subjects", "activity"))

## Droppping unnessesary columns

data <- data[,filter]

## Renaming column names

x <- names(data)
x <- gsub("-mean\\(\\)","-mean", x)
x <- gsub("-std\\(\\)","-std", x)
x <- gsub("-","_", x)
x <- tolower(x)
names(data) <- x

## Another dataframe

df <- melt(data,id=c("subjects","activity"), measure.vars=(1:66))

final <- dcast(df, subjects + activity ~ variable, fun.aggregate=mean)