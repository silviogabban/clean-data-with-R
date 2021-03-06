## Getting and Cleaning Data Course Project
This file describes how to run the script run_analysis.R, what it produces and how to check the results.
* Unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
* Download from here the **run_analysis.R** script file, copy it to the folder "UCI HAR Dataset" and open it with RStudio.
* Set the "UCI HAR Dataset" as your current working directory.
* Run or Source, as you prefer, the script in RStudio. 
* When run or sourced you'll find the "myResultingDataSet.txt" file in your current working directory. It'd have to be 224816 bytes long. Plus you'll find "myResultingDataSet_rownamesfalse.txt", 223844 bytes long, which is the one uploaded submitting the assignment.
* Use the **test <- read.table("myResultingDataSet.txt")** command in RStudio to read the file in the *test* variable and then, for example, the command **test[, c(1,2,3,6,9,12)]** to print the 180 observations with some of the variables to the console. Keep in mind that column 1 contains the subjects while column 2 contains the activities.

