Codebook
=======

* Original data set
* Description of datafiles and variables downloaded and read in by the run_analysis.R script
* Description of the script
* Information about "independent tidy data set with the average of each variable for each activity and each subject"

## Original data set

Original dataset with documentation can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description is available at the site where the data was obtained: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Description of datafiles, variables and values downloaded and read by the run_analysis.R script

All relations of used datafiles and variables in them have been described in the original dataset.

## Descption of the scipt 

1. Installs and loads reshape package 
2. Downloads the data set
3. Unzips downloaded dataset.zip -file into UCI HAR Dataset -folder
4. Reads data
* Reads labels and row names from activity_labels.txt and features.txt -files
* Reads data test set: values, subject number and activity code
* Reads data train set: values, subject number and activity code
5. Combines train and test sets into 3 data table: measures, subject information and activity information
6. Changes measures and subject to a data frame
7. Changes activity data to factor
8. Applies more readable labels to activity information  
9. Adds column names to data set
10. Cbinds measurements, subject information and activity information
11. Creates a dataframe where are only variables with mean and std values
12. Labels subjects and activity columns correctly
13. Drops unnessesary columns of the original data set
14. Renames column names
15. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Information about "independent tidy data set with the average of each variable for each activity and each subject"

Letters x, y and z at the end of variable name mean that this variable is measured and calculate basis of one axis out three axes of that specific measured pattern. 

**INFORMATION FOR GRADING:** My variable naming policy is a well and carefully reasoned. Here are my arguments for using underscores: Hadley "R Guru" Wickham says it is a good naming policy: http://adv-r.had.co.nz/Style.html

| variable name in the data | measured pattern | method for creating the value                  |
|---------------------------|------------------|------------------------------------------------|
| subjects                  | test subject     | number of test subject measured                |
| activity                  | activity         | name of the activity measured                  |
| tbodyacc_mean_x           | tbodyacc         | mean of measured pattern results               |
| tbodyacc_mean_y           | tbodyacc         | mean of measured pattern results               |
| tbodyacc_mean_z           | tbodyacc         | mean of measured pattern results               |
| tbodyacc_std_x            | tbodyacc         | standard deviation of measured pattern results |
| tbodyacc_std_y            | tbodyacc         | standard deviation of measured pattern results |
| tbodyacc_std_z            | tbodyacc         | standard deviation of measured pattern results |
| tgravityacc_mean_x        | tgravityacc      | mean of measured pattern results               |
| tgravityacc_mean_y        | tgravityacc      | mean of measured pattern results               |
| tgravityacc_mean_z        | tgravityacc      | mean of measured pattern results               |
| tgravityacc_std_x         | tgravityacc      | standard deviation of measured pattern results |
| tgravityacc_std_y         | tgravityacc      | standard deviation of measured pattern results |
| tgravityacc_std_z         | tgravityacc      | standard deviation of measured pattern results |
| tbodyaccjer_mean_x        | tbodyaccjerk     | mean of measured pattern results               |
| tbodyaccjer_mean_y        | tbodyaccjerk     | mean of measured pattern results               |
| tbodyaccjer_mean_z        | tbodyaccjerk     | mean of measured pattern results               |
| tbodyaccjer_std_x         | tbodyaccjerk     | standard deviation of measured pattern results |
| tbodyaccjer_std_y         | tbodyaccjerk     | standard deviation of measured pattern results |
| tbodyaccjer_std_z         | tbodyaccjerk     | standard deviation of measured pattern results |
| tbodygyro_mean_x          | tbodygyro        | mean of measured pattern results               |
| tbodygyro_mean_y          | tbodygyro        | mean of measured pattern results               |
| tbodygyro_mean_z          | tbodygyro        | mean of measured pattern results               |
| tbodygyro_std_x           | tbodygyro        | standard deviation of measured pattern results |
| tbodygyro_std_y           | tbodygyro        | standard deviation of measured pattern results |
| tbodygyro_std_z           | tbodygyro        | standard deviation of measured pattern results |
| tbodygyrojer_mean_x       | tbodygyrojerk    | mean of measured pattern results               |
| tbodygyrojer_mean_y       | tbodygyrojerk    | mean of measured pattern results               |
| tbodygyrojer_mean_z       | tbodygyrojerk    | mean of measured pattern results               |
| tbodygyrojer_std_x        | tbodygyrojerk    | standard deviation of measured pattern results |
| tbodygyrojer_std_y        | tbodygyrojerk    | standard deviation of measured pattern results |
| tbodygyrojer_std_z        | tbodygyrojerk    | standard deviation of measured pattern results |
| tbodyaccmag_mean          | tbodyaccmag      | mean of measured pattern results               |
| tbodyaccmag_std           | tbodyaccmag      | standard deviation of measured pattern results |
| tgravityaccmag_mean       | tbodyaccmag      | mean of measured pattern results               |
| tgravityaccmag_std        | tbodyaccmag      | standard deviation of measured pattern results |
| tbodyaccjermag_mean       | tbodyaccjerkmag  | mean of measured pattern results               |
| tbodyaccjermag_std        | tbodyaccjerkmag  | standard deviation of measured pattern results |
| tbodygyromag_mean         | tbodygyromag     | mean of measured pattern results               |
| tbodygyromag_std          | tbodygyromag     | standard deviation of measured pattern results |
| tbodygyrojermag_mean      | tbodygyrojerkmag | mean of measured pattern results               |
| tbodygyrojermag_std       | tbodygyrojerkmag | standard deviation of measured pattern results |
| fbodyacc_mean_x           | fbodyacc         | mean of measured pattern results               |
| fbodyacc_mean_y           | fbodyacc         | mean of measured pattern results               |
| fbodyacc_mean_z           | fbodyacc         | mean of measured pattern results               |
| fbodyacc_std_x            | fbodyacc         | standard deviation of measured pattern results |
| fbodyacc_std_y            | fbodyacc         | standard deviation of measured pattern results |
| fbodyacc_std_z            | fbodyacc         | standard deviation of measured pattern results |
| fbodyaccjer_mean_x        | fbodyaccjerk     | mean of measured pattern results               |
| fbodyaccjer_mean_y        | fbodyaccjerk     | mean of measured pattern results               |
| fbodyaccjer_mean_z        | fbodyaccjerk     | mean of measured pattern results               |
| fbodyaccjer_std_x         | fbodyaccjerk     | standard deviation of measured pattern results |
| fbodyaccjer_std_y         | fbodyaccjerk     | standard deviation of measured pattern results |
| fbodyaccjer_std_z         | fbodyaccjerk     | standard deviation of measured pattern results |
| fbodygyro_mean_x          | fbodygyro        | mean of measured pattern results               |
| fbodygyro_mean_y          | fbodygyro        | mean of measured pattern results               |
| fbodygyro_mean_z          | fbodygyro        | mean of measured pattern results               |
| fbodygyro_std_x           | fbodygyro        | standard deviation of measured pattern results |
| fbodygyro_std_y           | fbodygyro        | standard deviation of measured pattern results |
| fbodygyro_std_z           | fbodygyro        | standard deviation of measured pattern results |
| fbodyaccmag_mean          | fbodyaccmag      | mean of measured pattern results               |
| fbodyaccmag_std           | fbodyaccmag      | standard deviation of measured pattern results |
| fbodybodyaccjermag_mean   | fbodyaccjerkmag  | mean of measured pattern results               |
| fbodybodyaccjermag_std    | fbodyaccjerkmag  | standard deviation of measured pattern results |
| fbodybodygyromag_mean     | fbodygyrojerkmag | mean of measured pattern results               |
| fbodybodygyromag_std      | fbodygyrojerkmag | standard deviation of measured pattern results |
| fbodybodygyrojermag_mean  | fbodygyrojerkmag | mean of measured pattern results               |
| fbodybodygyrojermag_std   | fbodygyrojerkmag | standard deviation of measured pattern results |
