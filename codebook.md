### Code Book for Course Project, Getting and Cleaning Data

The raw data was from the UCI archive, the Human Activity Recognition Using Smartphones Data Set:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

We obtained the data from the course web link, the original readme that describe the experiments and the data is at

https://github.com/yingli/GettingAndCleaningDataProject/blob/master/README_Data.txt

The original measurements variables are listed in

https://github.com/yingli/GettingAndCleaningDataProject/blob/master/features.txt

We have made the following transformations to the original data set:

* Merges the training and the test sets of measurements 
* Combining the subject label, the activity name, and the corresponding measurements together
* Use the feature list of names to name the corresponding measurement variables
* Extracts the measurements on the mean and standard deviation, using the criteria that the variable names containing "mean" or "std"

This results in a data set that has all training and testing cases but only with variables that represent mean or std.

Then we calculated the average for each of the selected "mean" or "std" variables for each activity and each subject.
This second data set, called tidy data, is saved in a file "tidyData.txt" in the working directory, and it is also returned by the call to function "run_analysis()".


