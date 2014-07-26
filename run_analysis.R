run_analysis<- function(){
	require(data.table)
	# read data: activity_label has the mapping between activity numeric label and text definition
	# features.txt has the entire list of all features in the training/testing data
	activities <- read.table("./activity_labels.txt")
	features<- read.table("./features.txt")
	# read measurement data for training and testing data sets
	train.X<- read.table("./X_train.txt")
	test.X<- read.table("./X_test.txt")
	# combine measurement data together
	all.X <- rbind(train.X, test.X)
	# Appropriately labels the data set with descriptive variable names. 
	# this is done by setting measurement variable names from feature list
	colnames(all.X) <-features$V2
	# read activity label for training and test data sets
	train.y<- read.table("./y_train.txt")
	test.y<- read.table("./y_test.txt")
	# combined training and testing data labels together
	all.y <- rbind(train.y, test.y)
	# Uses descriptive activity names to name the activities in the data set
	# this is done by mapping activity numeric labels to text names
	all.y$activity<- activities$V2[all.y$V1]
	# read subject list for training and testing data sets
	train.subject <- read.table("./subject_train.txt")
	test.subject <- read.table("./subject_test.txt")
	# combined training subject and testing subject together
	all.subject <- rbind(train.subject, test.subject)
	
	# Merges the training and the test sets to create one data set
	allData=data.table(cbind(
			activity=all.y$activity, 
			subject = all.subject$V1, 
			all.X))
	# Extracts only the measurements on the mean and standard deviation for each measurement
	# by inspecting the raw feature list, I think this can be done
	# by getting all the variable names that contain "mean" or "std", case insensitive
	colIndex <- c(grep("mean",features$V2, ignore.case=TRUE, value=FALSE), 
			grep("std",features$V2, ignore.case=TRUE, value=FALSE))
	allMeanStd=data.table(cbind(
			activity=all.y$activity, 
			subject = all.subject$V1, 
			all.X[,colIndex[order(colIndex)]]))
	# Creates a second, independent tidy data set with the average of each variable 
	# for each activity and each subject
	tidyData <-aggregate(.~activity+subject, data=allMeanStd,FUN=mean)
	write.table(tidyData, "./tidyData.txt",quote=FALSE)
	return(tidyData)
}

run_analysis()








