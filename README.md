GandC-Data-CourseProject
========================
## Instructions
* Data needs to be downloaded and unzipped from the UCI Machine Learning Repository into your working directory, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Ensure that the UCI HAR Datatset is located in your working directory.
* Run the script, `run_analysis.R`.

Note: `run_analysis.R` will attempt to install the packages `dply` and `qdap`.  If you have already installed these items, disregard the error created when the the script tries to install.

## Script Processing
1. The script first reads in the `features.txt` (variable labels), `X_test` (test data set), and `X_train` (training data set) files.
2. Next, the variable labels are added as column names to the two data sets.  
3. The two data sets are combined.
4. Unique variable labels are created as some labels in `features.txt` are duplicates.
5. Then, the data is subset based on keeping only columns that are measurements on the mean and standard deviation.
6. The test and train data sets that contain coded activity values (numbered 1-6, see `codebook.md` for further information) are now read into R and combined.
7. Next, subject ID numbers from `subject_test.txt` and `subject_train.txt` are combined with the coded activity values and given column names. 
8. Coded activity values are then replaced by descriptive activity names from `activity_labels.txt`.
9. The subject ID numbers and activity names are combined with the mean and standard deviation data set.
10. Lastly, a tidy data set (wide) is created from the data set where the mean of each variable is aggregated by the activity and subject ID number.

## Codebook
Please review `codebook.md` for further information regarding the original data and variable nomenclature. 
