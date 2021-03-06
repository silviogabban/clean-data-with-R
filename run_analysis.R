# Step1. Merges the training and the test sets to create one data set.
#setwd("/home/silvio/cds/UCI HAR Dataset/")
myData <- rbind(read.table("./train/X_train.txt"), read.table("./test/X_test.txt"))
myLabels <- rbind(read.table("./train/y_train.txt"), read.table("./test/y_test.txt"))
mySubjects <- rbind(read.table("./train/subject_train.txt"), read.table("./test/subject_test.txt"))

# Step2. Extracts only the measurements on the mean and standard deviation for each measurement. 
myFeatures <- read.table("features.txt")
myMeanStd <- grep("mean\\(\\)|std\\(\\)", myFeatures[, 2])
myData <- myData[, myMeanStd]
names(myData) <- myFeatures[myMeanStd, 2]
names(myData) <- gsub("\\(\\)", "", myFeatures[myMeanStd, 2]) # remove "()"
names(myData) <- gsub("-", "", names(myData)) # remove "-"
names(myData) <- gsub("std", "Std", names(myData)) # capitalize S
names(myData) <- gsub("mean", "Mean", names(myData)) # capitalize M

# Step3. Uses descriptive activity names to name the activities in the data set
myActivity <- read.table("activity_labels.txt")
myActivity[, 2] <- tolower(gsub("_", "", myActivity[, 2]))
substr(myActivity[2, 2], 8, 8) <- toupper(substr(myActivity[2, 2], 8, 8)) # uppercase 2^word
substr(myActivity[3, 2], 8, 8) <- toupper(substr(myActivity[3, 2], 8, 8)) # uppercase 2^word
myActLabels <- myActivity[myLabels[, 1], 2]
myLabels[, 1] <- myActLabels

# Step4. Appropriately labels the data set with descriptive variable names. 
names(mySubjects) <- "subject"
names(myLabels) <- "activity"
myCombinedData <- cbind(mySubjects, myLabels, myData)

# Step5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
mySubLen <- length(table(mySubjects))
myActLen <- dim(myActivity)[1]
myColLen <- dim(myCombinedData)[2]
myDataSet <- as.data.frame(matrix(NA, nrow=mySubLen*myActLen, ncol=myColLen))
colnames(myDataSet) <- colnames(myCombinedData)
myRow <- 1
for(i in 1:mySubLen) {
        for(j in 1:myActLen) {
                myDataSet[myRow, 1] <- sort(unique(mySubjects)[, 1])[i]
                myDataSet[myRow, 2] <- myActivity[j, 2]
                myDataSet[myRow, 3:myColLen] <- colMeans(myCombinedData[(i == myCombinedData$subject) & (myActivity[j, 2] == myCombinedData$activity), 3:myColLen])
                myRow <- myRow + 1
        }
}
write.table(myDataSet, "myResultingDataSet.txt")
write.table(myDataSet, "myResultingDataSet_rownamesfalse.txt", row.name=FALSE)

#test <- read.table("myResultingDataSet.txt")
#test[, c(1,2,3,6,9,12)]