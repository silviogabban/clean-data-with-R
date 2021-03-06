## Getting and Cleaning Data Course Project CodeBook
This code book describes the variables, the data, and any transformations or work that you performed to clean up the data.
* The site where the data was obtained is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* The data for the project was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* These are the run_analysis.R script's steps:
 1. Concatenate "./train/X_train.txt" and "./test/X_test.txt" read files in the variable *myData* thus obtaining 10229 observations of 561 variables
 2. Concatenate "./train/y_train.txt" and "./test/y_test.txt" read files in the variable *myLabels* thus obtaining 10229 observations of 1 variable
 3. Concatenate "./train/subject_train.txt" and "./test/subject_test.txt" read files in the variable *mySubjects* thus obtaining 10229 observations of 1 variable
 4. Read the "features.txt" file storing the data in a variable called *myFeatures* which is used to restrict *myData* to 66 variables extracting from *myFeatures* the list *myMeanStd* of only measurements on the mean and standard deviation.
 5. Clean the column names of the subset *myData* removing the "()" and "-" symbols in the names and capitaling the substrings "mean" and "std".
 6. Read the "activity_labels.txt" file storing the data in a variable called *myActivity*.
 7. Clean the activity names in the second column of *myActivity* making all names to lower cases, removing the underscores and capitalizing the letter immediately after the underscores.
 8. Transform the values of *myLabels* according to the *myActivity* data frame.
 9. Combine *mySubjects*, *myLabels* and *myData* by column to get *myCombinedData* 10229 observations of 68 variables after having named the first two columns "subject" and "activity".
 10. Finally, generate a tidy *myDataSet* with the average of each measurement for each activity and each subject performing a two for-loops over the 30 subjects and the 6 activities thus obtaining 180 observations of 68 variables.
 11. Write the *myDataSet* out to the "myResultingDataSet.txt" file in the current working directory.

