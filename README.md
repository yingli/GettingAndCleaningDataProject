Was code book submitted to GitHub that modifies and updates the codebooks available to you 
with the data to indicate all the variables and summaries you calculated, along with units, 
and any other relevant information?

This repo contains code for the course project as assignment from the Johns Hopkins course "Getting and Cleaning Data". 
This R script is in run_analysis.R. To run the script, after sourcing the script into R, type run_analysis(). 
Function run_analysis() expect the following data file in the working directory
* activity_labels.txt
* features.txt
* X_train.txt
X_test.txt
y_train.txt
y_test.txt
subject_train.txt
subject_test.txt

The function mainly does two things:
--  Merges the training and the test sets to create one data set
-- Create a tidy data set with the average of each mean and std measurements for each activity and each subject. 
The tidy data set will be saved in the program's working directory and also returned from the run_analysis() function.

Another file in this repo is the code book for the generated data set.
